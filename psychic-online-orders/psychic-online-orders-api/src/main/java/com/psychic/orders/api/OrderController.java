package com.psychic.orders.api;

import com.psychic.base.execption.ServiceException;
import com.psychic.orders.model.dto.AddOrderDto;
import com.psychic.orders.model.dto.PayRecordDto;
import com.psychic.orders.model.dto.PayStatusDto;
import com.psychic.orders.model.po.XcPayRecord;
import com.psychic.orders.service.OrderService;
import com.psychic.orders.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Api(value = "订单支付接口", tags = "订单支付接口")
@Slf4j
@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    private RestTemplate restTemplate;

    @ApiOperation("生成支付二维码")
    @PostMapping("/generatepaycode")
    @ResponseBody
    public PayRecordDto generatePayCode(@RequestBody AddOrderDto addOrderDto) {
        //登录用户
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        if (user == null) {
            throw new ServiceException("请登录后继续选课");
        }
        return orderService.createOrder(user.getId(), addOrderDto);

    }

    @ApiOperation("扫码下单接口")
    @GetMapping("/requestpay")
    public void requestpay(String payNo, HttpServletResponse httpResponse) throws IOException {
        //如果payNo不存在则提示重新发起支付
        XcPayRecord payRecord = orderService.getPayRecordByPayno(payNo);
        if (payRecord == null) {
            throw new ServiceException("请重新点击支付获取二维码");
        }
        //支付状态
        String status = payRecord.getStatus();
        if ("601002".equals(status)) {
            throw new ServiceException("订单已支付，请勿重复支付。");
        }
        // 模拟支付
        PayStatusDto payStatusDto = new PayStatusDto();
        payStatusDto.setApp_id("APP_ID");
        payStatusDto.setTrade_status("SUCCESS");
        payStatusDto.setTrade_no(payRecord.getPayNo().toString());
        payStatusDto.setOut_trade_no(payRecord.getPayNo().toString());
        payStatusDto.setTotal_amount(payRecord.getTotalPrice().toString());
        restTemplate.postForObject("http://localhost:63030/orders/receivenotify", payStatusDto, PayStatusDto.class);
    }

    @ApiOperation("查询支付结果")
    @GetMapping("/payresult")
    @ResponseBody
    public PayRecordDto payresult(String payNo) throws IOException {
        //调用支付宝接口查询
        PayRecordDto payRecordDto = orderService.queryPayResult(payNo);
        return payRecordDto;
    }

    @ApiOperation("接收支付结果通知")
    @PostMapping("/receivenotify")
    public void receivenotify(@RequestBody PayStatusDto payStatusDto) {
        orderService.saveAliPayStatus(payStatusDto);
    }
}
