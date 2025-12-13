package com.psychic.checkcode.service.impl;

import com.alibaba.fastjson.JSON;
import com.psychic.base.execption.ServiceException;
import com.psychic.checkcode.config.EmailNotifyConfig;
import com.psychic.messagesdk.model.po.MqMessage;
import com.psychic.messagesdk.service.MqMessageService;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Slf4j
@Service
public class ReceiveEmailNotifyService {

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    MqMessageService mqMessageService;

    @Value("${spring.mail.username}")
    String mailUserName;

    //监听消息队列接收邮箱结果通知
    @RabbitListener(queues = EmailNotifyConfig.EMAILNOTIFY_QUEUE)
    public void receive(Message message, Channel channel) {
        //获取消息
        MqMessage mqMessage = JSON.parseObject(message.getBody(), MqMessage.class);
        String mailAddress = mqMessage.getBusinessKey1();
        String verifyCode = mqMessage.getBusinessKey2();
        // 编写邮箱内容
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<html><head><title></title></head><body>");
        stringBuilder.append("您好<br/>");
        stringBuilder.append("您的验证码是：").append(verifyCode).append("<br/>");
        stringBuilder.append("您可以复制此验证码并返回至通灵在线教育，以验证您的邮箱。<br/>");
        stringBuilder.append("此验证码只能使用一次，在");
        stringBuilder.append(5);
        stringBuilder.append("分钟内有效。验证成功则自动失效。<br/>");
        stringBuilder.append("如果您没有进行上述操作，请忽略此邮件。");
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        // 发件配置并发送邮件
        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
            //这里只是设置username 并没有设置host和password，因为host和password在springboot启动创建JavaMailSender实例的时候已经读取了
            mimeMessageHelper.setFrom(mailUserName);
            // 用户的邮箱地址
            mimeMessageHelper.setTo(mailAddress);
            // 邮件的标题
            mimeMessage.setSubject("邮箱验证-通灵在线教育");
            // 上面所拼接的邮件内容
            mimeMessageHelper.setText(stringBuilder.toString(), true);
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            throw new ServiceException(e.getMessage());
        }

        log.debug("服务接收邮箱结果:{}", mqMessage);
    }
}
