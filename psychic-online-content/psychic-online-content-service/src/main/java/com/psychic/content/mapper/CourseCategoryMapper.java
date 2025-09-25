package com.psychic.content.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.psychic.content.model.dto.CourseCategoryTreeDto;
import com.psychic.content.model.po.CourseCategory;

import java.util.List;

/**
 * <p>
 * 课程分类 Mapper 接口
 * </p>
 *
 * @author 851543
 */
public interface CourseCategoryMapper extends BaseMapper<CourseCategory> {

    public List<CourseCategoryTreeDto> selectTreeNodes(String id);
}
