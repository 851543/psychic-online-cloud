package com.psychic.content.model.vo;

import com.psychic.content.model.po.CourseComment;
import com.psychic.content.model.po.CourseCommentReply;
import lombok.Data;

import java.util.List;

@Data
public class CourseCommentVO extends CourseComment {
    private List<CourseCommentReply> courseCommentReplyList;
}
