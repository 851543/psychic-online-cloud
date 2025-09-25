package com.psychic.content.service.impl;

import com.psychic.content.mapper.CourseCategoryMapper;
import com.psychic.content.model.dto.CourseCategoryTreeDto;
import com.psychic.content.service.CourseCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class CourseCategoryServiceImpl implements CourseCategoryService {

    @Autowired
    private CourseCategoryMapper courseCategoryMapper;

    @Override
    public List<CourseCategoryTreeDto> queryTreeNodes(String id) {
        List<CourseCategoryTreeDto> courseCategoryTrees = courseCategoryMapper.selectTreeNodes(id);
        Map<String, CourseCategoryTreeDto> tempMap = courseCategoryTrees.stream()
                .filter(item -> !id.equals(item.getId()))
                .collect(Collectors.toMap(key -> key.getId(), value -> value, (key1, key2) -> key2));
        List<CourseCategoryTreeDto> categoryTreeArrayList = new ArrayList<>();
        courseCategoryTrees.stream()
                .filter(item -> !id.equals(item.getId()))
                .forEach(item -> {
                    if (item.getParentid().equals(id)) {
                        categoryTreeArrayList.add(item);
                    }
                    CourseCategoryTreeDto courseCategoryTreeDto = tempMap.get(item.getParentid());
                    if (courseCategoryTreeDto != null) {
                        if (courseCategoryTreeDto.getChildrenTreeNodes() == null) {
                            courseCategoryTreeDto.setChildrenTreeNodes(new ArrayList<CourseCategoryTreeDto>());
                        }
                        //下边开始往ChildrenTreeNodes属性中放子节点
                        courseCategoryTreeDto.getChildrenTreeNodes().add(item);
                    }
                });
        return categoryTreeArrayList;
    }
}
