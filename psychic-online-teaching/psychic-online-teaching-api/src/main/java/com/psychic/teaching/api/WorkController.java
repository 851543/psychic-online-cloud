package com.psychic.teaching.api;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.teaching.model.Work;
import com.psychic.teaching.model.vo.WorkVO;
import com.psychic.teaching.service.WorkService;
import com.psychic.teaching.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/work")
public class WorkController {

    @Autowired
    WorkService workService;

    @PostMapping("/list")
    public PageResult<WorkVO> list(PageParams pageParams) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String companyId = user.getCompanyId();
        return workService.list(Long.valueOf(companyId), pageParams);
    }

    @PostMapping
    public void add(@RequestBody Work work) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String companyId = user.getCompanyId();
        work.setCompanyId(Long.valueOf(companyId));
        workService.add(work);
    }

    @DeleteMapping("/{id}")
    public void del(@PathVariable Long id) {
        workService.del(id);
    }

    @PostMapping("/association")
    public void association(@RequestBody Work work) {
        workService.association(work);
    }
}
