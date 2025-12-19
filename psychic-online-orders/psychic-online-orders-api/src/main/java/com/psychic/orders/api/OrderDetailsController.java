package com.psychic.orders.api;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.orders.model.dto.QueryOrderParamsDto;
import com.psychic.orders.model.po.XcOrders;
import com.psychic.orders.model.po.XcPayRecord;
import com.psychic.orders.service.OrderService;
import com.psychic.orders.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderDetailsController {

    @Autowired
    OrderService orderService;

    @PostMapping("/org-list")
    public PageResult<XcOrders> page(PageParams pageParams, @RequestBody QueryOrderParamsDto queryOrderParamsDto){
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        return orderService.page(user.getCompanyId(),pageParams,queryOrderParamsDto);
    }

    @PostMapping("/my-list")
    public PageResult<XcOrders> myOrderPage(PageParams pageParams, @RequestBody QueryOrderParamsDto queryOrderParamsDto){
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        return orderService.myOrderPage(user.getId(),pageParams,queryOrderParamsDto);
    }
}
