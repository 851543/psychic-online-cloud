package com.psychic.teaching.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.psychic.base.execption.ServiceException;
import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.teaching.mapper.WorkMapper;
import com.psychic.teaching.mapper.WorkRecordMapper;
import com.psychic.teaching.model.Work;
import com.psychic.teaching.model.WorkRecord;
import com.psychic.teaching.model.vo.WorkVO;
import com.psychic.teaching.service.WorkService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    WorkMapper workMapper;

    @Autowired
    WorkRecordMapper workRecordMapper;

    @Override
    public PageResult<WorkVO> list(Long companyId, PageParams pageParams) {
        Page<Work> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        Page<Work> pageResult = workMapper.selectPage(page,
                new LambdaQueryWrapper<Work>().eq(Work::getCompanyId, companyId)
        );
        List<Work> list = (List<Work>) pageResult.getRecords();
        long total = pageResult.getTotal();
        List<WorkVO> voList = list.stream()
                .map(work -> {
                    WorkVO vo = new WorkVO();
                    BeanUtils.copyProperties(work, vo);
                    return vo;
                })
                .collect(Collectors.toList());
        return new PageResult<WorkVO>(voList, total, pageParams.getPageNo(), pageParams.getPageSize());
    }

    @Override
    public void add(Work work) {
        workMapper.insert(work);
    }

    @Override
    public void association(Work work) {
        Work workRe = workMapper.selectOne(new LambdaQueryWrapper<Work>()
                .eq(Work::getTeachplanId, work.getTeachplanId())
        );
        if (ObjectUtils.isNotEmpty(workRe)) {
            throw new ServiceException("课程对应的章节已存在绑定作业");
        }
        Work newWork = workMapper.selectById(work.getId());
        newWork.setTeachplanId(work.getTeachplanId());
        newWork.setCourseId(work.getCourseId());
        workMapper.updateById(newWork);
    }

    @Override
    public void del(Long id) {
        workMapper.deleteById(id);
    }

    @Override
    public List<Work> getWork(Long courseId) {
        return workMapper.selectList(new LambdaQueryWrapper<Work>()
                .eq(Work::getCourseId, courseId)
        );
    }

    @Override
    public void addRecord(WorkRecord workRecord) {
        workRecordMapper.insert(workRecord);
    }

    @Override
    public PageResult<WorkRecord> recordList(PageParams pageParams) {
        Page<WorkRecord> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        Page<WorkRecord> pageResult = workRecordMapper.selectPage(page,new LambdaQueryWrapper<>());
        List<WorkRecord> list = (List<WorkRecord>) pageResult.getRecords();
        long total = pageResult.getTotal();
        return new PageResult<WorkRecord>(list, total, pageParams.getPageNo(), pageParams.getPageSize());
    }

    @Override
    public void correction(WorkRecord workRecord) {
        WorkRecord old = workRecordMapper.selectById(workRecord.getId());
        old.setCorrectComment(workRecord.getCorrectComment());
        old.setCorrectUsername(workRecord.getCorrectUsername());
        old.setStatus("306003");
        old.setCorrectionDate(LocalDateTime.now());
        workRecordMapper.updateById(old);
    }
}
