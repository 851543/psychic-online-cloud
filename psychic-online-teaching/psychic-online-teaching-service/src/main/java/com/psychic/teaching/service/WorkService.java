package com.psychic.teaching.service;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.teaching.model.Work;
import com.psychic.teaching.model.vo.WorkVO;

public interface WorkService {

    PageResult<WorkVO> list(Long companyId, PageParams pageParams);

    void add(Work work);

    void association(Work work);

    void del(Long id);
}
