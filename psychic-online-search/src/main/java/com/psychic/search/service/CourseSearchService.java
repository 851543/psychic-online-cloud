package com.psychic.search.service;

import com.psychic.base.model.PageParams;
import com.psychic.search.dto.SearchCourseParamDto;
import com.psychic.search.dto.SearchPageResultDto;
import com.psychic.search.po.CourseIndex;

/**
 * @description 课程搜索service
 * @author Mr.M
 * @date 2022/9/24 22:40
 * @version 1.0
 */
public interface CourseSearchService {


    /**
     * @description 搜索课程列表
     * @param pageParams 分页参数
     * @param searchCourseParamDto 搜索条件
     * @return com.xuecheng.base.model.PageResult<com.xuecheng.search.po.CourseIndex> 课程列表
     * @author Mr.M
     * @date 2022/9/24 22:45
    */
    SearchPageResultDto<CourseIndex> queryCoursePubIndex(PageParams pageParams, SearchCourseParamDto searchCourseParamDto);

 }
