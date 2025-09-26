package com.psychic.content.api;

import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.content.model.dto.AddCourseDto;
import com.psychic.content.model.dto.CourseBaseInfoDto;
import com.psychic.content.model.dto.QueryCourseParamsDto;
import com.psychic.content.model.po.CourseBase;
import com.psychic.content.service.CourseBaseInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 851543
 * @version 1.0
 * @description 课程信息编辑接口
 * @date 2022/9/6 11:29
 */
@Api(value = "课程信息编辑接口", tags = "课程信息编辑接口")
@RestController
public class CourseBaseInfoController {

    @Autowired
    private CourseBaseInfoService courseBaseInfoService;

    @ApiOperation("课程查询接口")
    @PostMapping("/course/list")
    public PageResult<CourseBase> list(PageParams pageParams, @RequestBody QueryCourseParamsDto queryCourseParams) {
        return courseBaseInfoService.queryCourseBaseList(pageParams, queryCourseParams);
    }

    @ApiOperation("新增课程基础信息")
    @PostMapping("/course")
    public CourseBaseInfoDto createCourseBase(@RequestBody AddCourseDto addCourseDto) {
        return courseBaseInfoService.createCourseBase(1232141425L, addCourseDto);
    }
}
