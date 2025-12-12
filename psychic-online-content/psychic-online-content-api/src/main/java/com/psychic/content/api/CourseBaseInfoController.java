package com.psychic.content.api;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.content.model.dto.AddCourseDto;
import com.psychic.content.model.dto.CourseBaseInfoDto;
import com.psychic.content.model.dto.EditCourseDto;
import com.psychic.content.model.dto.QueryCourseParamsDto;
import com.psychic.content.model.po.CourseBase;
import com.psychic.content.service.CourseBaseInfoService;
import com.psychic.content.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        //机构id
        String companyId = user.getCompanyId();
        return courseBaseInfoService.queryCourseBaseList(Long.parseLong(companyId),pageParams, queryCourseParams);
    }

    @ApiOperation("新增课程基础信息")
    @PostMapping("/course")
    public CourseBaseInfoDto createCourseBase(@RequestBody AddCourseDto addCourseDto) {
        return courseBaseInfoService.createCourseBase(1232141425L, addCourseDto);
    }

    @ApiOperation("根据课程id查询课程基础信息")
    @GetMapping("/course/{courseId}")
    public CourseBaseInfoDto getCourseBaseById(@PathVariable Long courseId){
        return courseBaseInfoService.getCourseBaseInfo(courseId);
    }

    @ApiOperation("修改课程基础信息")
    @PutMapping("/course")
    public CourseBaseInfoDto modifyCourseBase(@RequestBody EditCourseDto editCourseDto){
        return courseBaseInfoService.updateCourseBase(1232141425L,editCourseDto);
    }
}
