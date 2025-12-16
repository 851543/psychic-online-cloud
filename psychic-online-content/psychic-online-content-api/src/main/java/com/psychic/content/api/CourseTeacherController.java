package com.psychic.content.api;

import com.psychic.content.model.po.CourseTeacher;
import com.psychic.content.service.CourseTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/courseTeacher")
public class CourseTeacherController {

    @Autowired
    CourseTeacherService courseTeacherService;

    @GetMapping("/list/{course_id}")
    public List<CourseTeacher> getTeacher(@PathVariable Long course_id){
        return courseTeacherService.getTeacher(course_id);
    }

    @PostMapping
    public void addTeacher(@RequestBody CourseTeacher courseTeacher){
        courseTeacherService.addTeacher(courseTeacher);
    }
}
