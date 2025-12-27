package com.psychic.content.service;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.content.model.dto.CourseCommentDTO;
import com.psychic.content.model.po.CourseComment;
import com.psychic.content.model.po.CourseCommentReply;
import com.psychic.content.model.vo.CourseCommentVO;

public interface CourseCommentService {

    PageResult<CourseCommentVO> list(Long companyId, PageParams pageParams, CourseCommentDTO courseCommentDTO);

    void add(CourseComment courseComment);

    void addReply(CourseCommentReply courseCommentReply);
}
