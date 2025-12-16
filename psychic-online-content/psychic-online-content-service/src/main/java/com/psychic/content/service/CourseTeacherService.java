package com.psychic.content.service;

import com.psychic.content.model.po.CourseTeacher;

import java.util.List;

public interface CourseTeacherService {
    List<CourseTeacher> getTeacher(Long course_id);

    void addTeacher(CourseTeacher courseTeacher);
}
