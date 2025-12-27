package com.psychic.content.api;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.content.model.dto.CourseCommentDTO;
import com.psychic.content.model.dto.QueryCourseParamsDto;
import com.psychic.content.model.po.CourseComment;
import com.psychic.content.model.po.CourseCommentReply;
import com.psychic.content.model.vo.CourseCommentVO;
import com.psychic.content.service.CourseCommentService;
import com.psychic.content.util.SecurityUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class CourseCommentController {

    @Autowired
    CourseCommentService courseCommentService;

    @PostMapping("/course-comment/list")
    public PageResult<CourseCommentVO> list(PageParams pageParams, @RequestBody CourseCommentDTO courseCommentDTO){
        if (StringUtils.isNotEmpty(courseCommentDTO.getTargetId())){
            return courseCommentService.list(null,pageParams,courseCommentDTO);
        }
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String companyId = user.getCompanyId();
        return courseCommentService.list(Long.valueOf(companyId),pageParams,courseCommentDTO);
    }

    @PostMapping("/course-comment")
    public void add(@RequestBody CourseComment courseComment){
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        courseComment.setUserId(Long.valueOf(user.getId()));
        courseComment.setUserName(user.getUsername());
        courseComment.setNickName(user.getName());
        courseComment.setUserHead(user.getUserpic());
        courseCommentService.add(courseComment);
    }

    @PostMapping("/course-comment-reply")
    public void addReply(@RequestBody CourseCommentReply courseCommentReply){
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        courseCommentReply.setUserId(Long.valueOf(user.getId()));
        courseCommentReply.setUserName(user.getUsername());
        courseCommentReply.setNickName(user.getName());
        courseCommentService.addReply(courseCommentReply);
    }
}
