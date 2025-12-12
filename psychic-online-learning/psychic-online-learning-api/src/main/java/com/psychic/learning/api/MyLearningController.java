package com.psychic.learning.api;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.base.model.RestResponse;
import com.psychic.learning.model.XcUser;
import com.psychic.learning.service.LearningService;
import com.psychic.learning.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Mr.M
 * @version 1.0
 * @description 学习过程管理接口
 * @date 2022/10/2 14:52
 */
@Api(value = "学习过程管理接口", tags = "学习过程管理接口")
@Slf4j
@RestController
public class MyLearningController {

    @Autowired
    LearningService learningService;

    @PostMapping("/xc-member/list")
    public PageResult<XcUser> getCompanyList(PageParams pageParams){
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        return learningService.getCompanyList(user.getCompanyId(),pageParams);
    }

    @ApiOperation("获取视频")
    @GetMapping("/open/learn/getvideo/{courseId}/{teachplanId}/{mediaId}")
    public RestResponse<String> getvideo(@PathVariable("courseId") Long courseId, @PathVariable("courseId") Long teachplanId, @PathVariable("mediaId") String mediaId) {

        //登录用户
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String userId = null;
        if (user != null) {
            userId = user.getId();
        }
        //获取视频
        return learningService.getVideo(userId, courseId, teachplanId, mediaId);
    }

}
