package com.psychic.content.service.impl;

import com.psychic.content.model.dto.CourseBaseInfoDto;
import com.psychic.content.model.dto.CoursePreviewDto;
import com.psychic.content.model.dto.TeachplanDto;
import com.psychic.content.service.CourseBaseInfoService;
import com.psychic.content.service.CoursePublishService;
import com.psychic.content.service.TeachplanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description TODO
 * @author Mr.M
 * @date 2022/9/16 15:37
 * @version 1.0
 */
@Service
public class CoursePublishServiceImpl implements CoursePublishService {

    @Autowired
    CourseBaseInfoService courseBaseInfoService;

    @Autowired
    TeachplanService teachplanService;


    @Override
    public CoursePreviewDto getCoursePreviewInfo(Long courseId) {

        //课程基本信息、营销信息
        CourseBaseInfoDto courseBaseInfo = courseBaseInfoService.getCourseBaseInfo(courseId);

        //课程计划信息
        List<TeachplanDto> teachplanTree= teachplanService.findTeachplanTree(courseId);

        CoursePreviewDto coursePreviewDto = new CoursePreviewDto();
        coursePreviewDto.setCourseBase(courseBaseInfo);
        coursePreviewDto.setTeachplans(teachplanTree);
        return coursePreviewDto;
    }
}
