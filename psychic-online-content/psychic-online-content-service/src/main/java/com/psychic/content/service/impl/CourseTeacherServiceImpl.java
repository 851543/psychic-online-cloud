package com.psychic.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.psychic.base.execption.ServiceException;
import com.psychic.content.mapper.CourseTeacherMapper;
import com.psychic.content.model.po.CourseTeacher;
import com.psychic.content.service.CourseTeacherService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseTeacherServiceImpl implements CourseTeacherService {

    @Autowired
    CourseTeacherMapper courseTeacherMapper;

    @Override
    public List<CourseTeacher> getTeacher(Long course_id) {
        return courseTeacherMapper.selectList(new LambdaQueryWrapper<CourseTeacher>()
                .eq(CourseTeacher::getCourseId,course_id)
        );
    }

    @Override
    public void addTeacher(CourseTeacher courseTeacher) {
        CourseTeacher courseTeacherTemp = courseTeacherMapper.selectOne(new LambdaQueryWrapper<CourseTeacher>()
                .eq(CourseTeacher::getCourseId, courseTeacher.getCourseId())
                .eq(CourseTeacher::getTeacherName, courseTeacher.getTeacherName())
        );
        if (ObjectUtils.isNotEmpty(courseTeacherTemp)){
            throw new ServiceException("教师姓名不能重复");
        }
        courseTeacherMapper.insert(courseTeacher);
    }
}
