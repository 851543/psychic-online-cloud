package com.psychic.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.content.mapper.CourseBaseMapper;
import com.psychic.content.mapper.CourseCommentMapper;
import com.psychic.content.mapper.CourseCommentReplyMapper;
import com.psychic.content.model.dto.CourseCommentDTO;
import com.psychic.content.model.po.CourseBase;
import com.psychic.content.model.po.CourseComment;
import com.psychic.content.model.po.CourseCommentReply;
import com.psychic.content.model.vo.CourseCommentVO;
import com.psychic.content.service.CourseCommentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CourseCommentServiceImpl implements CourseCommentService {

    @Autowired
    CourseCommentMapper courseCommentMapper;

    @Autowired
    CourseCommentReplyMapper courseCommentReplyMapper;

    @Autowired
    private CourseBaseMapper courseBaseMapper;

    @Override
    public PageResult<CourseCommentVO> list(Long companyId, PageParams pageParams, CourseCommentDTO courseCommentDTO) {
        Page<CourseComment> page = new Page<>(pageParams.getPageNo(),pageParams.getPageSize());
        Page<CourseComment> courseCommentPage = courseCommentMapper.selectPage(page, new LambdaQueryWrapper<CourseComment>()
                .eq(StringUtils.isNotEmpty(courseCommentDTO.getTargetId()),CourseComment::getTargetId,courseCommentDTO.getTargetId())
                .like(StringUtils.isNotEmpty(courseCommentDTO.getTargetName()),CourseComment::getTargetName,courseCommentDTO.getTargetName())
                .orderByDesc(CourseComment::getChangeDate)
        );
        List<CourseComment> commentList = courseCommentPage.getRecords();
        List<CourseCommentVO> list = commentList.stream().filter(item->{
            CourseBase courseBase = courseBaseMapper.selectById(item.getTargetId());
            if (companyId != null && courseBase.getCompanyId() != companyId){
                return false;
            }
            if (courseCommentDTO.getLevel() != null){
                if (courseCommentDTO.getLevel() == 1 && (item.getStarRank() > 4 && item.getStarRank() <= 5)){
                    return true;
                }else  if (courseCommentDTO.getLevel() == 0 && (item.getStarRank() > 2 && item.getStarRank() <= 4)){
                    return true;
                }else if (courseCommentDTO.getLevel() == -1 && (item.getStarRank() >= 0 && item.getStarRank() <= 2)){
                    return true;
                }else {
                    return false;
                }
            }
            return true;
        }).map(item -> {
            CourseCommentVO courseCommentVO = new CourseCommentVO();
            BeanUtils.copyProperties(item, courseCommentVO);
            List<CourseCommentReply> courseCommentReplies = courseCommentReplyMapper.selectList(new LambdaQueryWrapper<CourseCommentReply>()
                    .eq(CourseCommentReply::getCommentId, item.getCommentId())
            );
            courseCommentVO.setCourseCommentReplyList(courseCommentReplies);
            return courseCommentVO;
        }).collect(Collectors.toList());
        long size = courseCommentPage.getSize();
        return new PageResult<CourseCommentVO>(list,size,pageParams.getPageNo(),pageParams.getPageSize());
    }

    @Override
    public void add(CourseComment courseComment) {
        courseCommentMapper.insert(courseComment);
    }

    @Override
    public void addReply(CourseCommentReply courseCommentReply) {
        courseCommentReplyMapper.insert(courseCommentReply);
    }
}
