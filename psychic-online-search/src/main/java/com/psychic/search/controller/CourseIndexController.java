package com.psychic.search.controller;

import com.psychic.base.execption.ServiceException;
import com.psychic.search.po.CourseIndex;
import com.psychic.search.service.IndexService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

/**
 * @author Mr.M
 * @version 1.0
 * @description 课程索引接口
 * @date 2022/9/24 22:31
 */
@Api(value = "课程信息索引接口", tags = "课程信息索引接口")
@RestController
@RequestMapping("/index")
public class CourseIndexController {

    @Value("${elasticsearch.course.index}")
    private String courseIndexStore;

    @Autowired
    IndexService indexService;

    @ApiOperation("添加课程索引")
    @PostMapping("course")
    public Boolean add(@RequestBody CourseIndex courseIndex) {

        Long id = courseIndex.getId();
        if(id==null){
            throw new ServiceException("课程id为空");
        }
        Boolean result = indexService.addCourseIndex(courseIndexStore, String.valueOf(id), courseIndex);
        if(!result){
            throw new ServiceException("添加课程索引失败");
        }
        return result;

    }

    @ApiOperation("删除课程索引")
    @DeleteMapping("/course/{id}")
    public Boolean del(@PathVariable String id) {
        if(id==null){
            throw new ServiceException("课程id为空");
        }
        Boolean result = indexService.deleteCourseIndex(courseIndexStore, id);
        if(!result){
            throw new ServiceException("删除课程索引失败");
        }
        return result;

    }
}
