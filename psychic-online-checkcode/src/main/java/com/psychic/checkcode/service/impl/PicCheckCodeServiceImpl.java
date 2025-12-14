package com.psychic.checkcode.service.impl;

import com.alibaba.fastjson.JSON;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.psychic.base.execption.ServiceException;
import com.psychic.base.utils.EmailUtil;
import com.psychic.base.utils.EncryptUtil;
import com.psychic.checkcode.config.EmailNotifyConfig;
import com.psychic.checkcode.model.CheckCodeParamsDto;
import com.psychic.checkcode.model.CheckCodeResultDto;
import com.psychic.checkcode.redis.RedisCache;
import com.psychic.checkcode.service.AbstractCheckCodeService;
import com.psychic.checkcode.service.CheckCodeService;
import com.psychic.messagesdk.model.po.MqMessage;
import com.psychic.messagesdk.service.MqMessageService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @author Mr.M
 * @version 1.0
 * @description 图片验证码生成器
 * @date 2022/9/29 16:16
 */
@Slf4j
@Service("PicCheckCodeService")
public class PicCheckCodeServiceImpl extends AbstractCheckCodeService implements CheckCodeService {


    @Autowired
    private DefaultKaptcha kaptcha;

    @Autowired
    RedisCache redisCache;

    @Autowired
    RabbitTemplate rabbitTemplate;

    @Autowired
    MqMessageService mqMessageService;

    @Resource(name="NumberLetterCheckCodeGenerator")
    @Override
    public void setCheckCodeGenerator(CheckCodeGenerator checkCodeGenerator) {
        this.checkCodeGenerator = checkCodeGenerator;
    }

    @Resource(name="UUIDKeyGenerator")
    @Override
    public void setKeyGenerator(KeyGenerator keyGenerator) {
        this.keyGenerator = keyGenerator;
    }


    @Resource(name="RedisCheckCodeStore")
    @Override
    public void setCheckCodeStore(CheckCodeStore checkCodeStore) {
        this.checkCodeStore = checkCodeStore;
    }


    @Override
    public CheckCodeResultDto generate(CheckCodeParamsDto checkCodeParamsDto) {
        GenerateResult generate = generate(checkCodeParamsDto, 4, "checkcode:", 300);
        String key = generate.getKey();
        String code = generate.getCode();
        String pic = createPic(code);
        CheckCodeResultDto checkCodeResultDto = new CheckCodeResultDto();
        checkCodeResultDto.setAliasing(pic);
        checkCodeResultDto.setKey(key);
        return checkCodeResultDto;

    }

    @Override
    public void doEmail(String key) {
        EmailUtil.EmailValidationResult validate = EmailUtil.validate(key);
        if (!validate.isValid()){
            throw new ServiceException(validate.getErrorMessage());
        }
        String verifyCode = redisCache.getCacheObject(key);
        if (StringUtils.isNotEmpty(verifyCode)) {
            redisCache.deleteObject(key);
        }
        verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);//生成短信验证码
        // 验证码存入redis并设置过期时间
        redisCache.setCacheObject(key, verifyCode, 5, TimeUnit.MINUTES);
        //保存消息记录,参数1：支付结果通知类型，2: 业务id，3:业务类型
        MqMessage mqMessage = mqMessageService.addMessage("emailresult_notify", key, verifyCode, null);
        String message = JSON.toJSONString(mqMessage);
        //设置消息持久化
        Message msgObj = MessageBuilder.withBody(message.getBytes(StandardCharsets.UTF_8))
                .setDeliveryMode(MessageDeliveryMode.PERSISTENT)
                .build();
        // 2.全局唯一的消息ID，需要封装到CorrelationData中
        CorrelationData correlationData = new CorrelationData(mqMessage.getId().toString());
        // 3.添加callback
        correlationData.getFuture().addCallback(
                result -> {
                    if(result.isAck()){
                        // 3.1.ack，消息成功
                        log.debug("通知邮箱结果消息发送成功, ID:{}", correlationData.getId());
                        //删除消息表中的记录
                        mqMessageService.completed(mqMessage.getId());
                    }else{
                        // 3.2.nack，消息失败
                        log.error("通知邮箱结果消息发送失败, ID:{}, 原因{}",correlationData.getId(), result.getReason());
                    }
                },
                ex -> log.error("消息发送异常, ID:{}, 原因{}",correlationData.getId(),ex.getMessage())
        );
        // 发送消息
        rabbitTemplate.convertAndSend(EmailNotifyConfig.EMAILNOTIFY_EXCHANGE_FANOUT, "", msgObj,correlationData);
    }

    private String createPic(String code) {
        // 生成图片验证码
        ByteArrayOutputStream outputStream = null;
        BufferedImage image = kaptcha.createImage(code);

        outputStream = new ByteArrayOutputStream();
        String imgBase64Encoder = null;
        try {
            // 对字节数组Base64编码
            BASE64Encoder base64Encoder = new BASE64Encoder();
            ImageIO.write(image, "png", outputStream);
            imgBase64Encoder = "data:image/png;base64," + EncryptUtil.encodeBase64(outputStream.toByteArray());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return imgBase64Encoder;
    }
}
