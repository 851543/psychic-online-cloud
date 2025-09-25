package com.psychic.content.model.dto;

import com.psychic.content.model.po.CourseCategory;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @description 课程分类树型结点dto
 * @author 851543
 * @date 2022/9/7 15:16
 * @version 1.0
 */
@Data
public class CourseCategoryTreeDto extends CourseCategory implements Serializable {

    List<CourseCategoryTreeDto> childrenTreeNodes;
}
