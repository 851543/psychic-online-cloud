package com.psychic.content.service.jobhandler;

import com.alibaba.fastjson.JSON;
import com.psychic.base.utils.HttpUtils;
import com.psychic.content.mapper.CourseBaseMapper;
import com.psychic.content.mapper.CoursePublishMapper;
import com.psychic.content.model.po.CourseBase;
import com.psychic.content.model.po.CoursePublish;
import com.psychic.content.service.sse.SseServer;
import com.psychic.messagesdk.model.po.MqMessage;
import com.psychic.messagesdk.service.MessageProcessAbstract;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class CourseCommitAuditTask extends MessageProcessAbstract {

    @Autowired
    CoursePublishMapper coursePublishMapper;

    @Autowired
    CourseBaseMapper courseBaseMapper;

    @Autowired
    SseServer sseServer;

    //任务调度入口
    @XxlJob("CourseCommitAuditJobHandler")
    public void courseCommitAuditJobHandler() throws Exception {
        // 分片参数
        int shardIndex = XxlJobHelper.getShardIndex();
        int shardTotal = XxlJobHelper.getShardTotal();
        log.debug("shardIndex=" + shardIndex + ",shardTotal=" + shardTotal);
        //参数:分片序号、分片总数、消息类型、一次最多取到的任务数量、一次任务调度执行的超时时间
        process(shardIndex, shardTotal, "course_commitAudit", 30, 60);
    }

    @Override
    public boolean execute(MqMessage mqMessage) {
        //获取消息相关的业务信息
        String businessKey1 = mqMessage.getBusinessKey1();
        long courseId = Integer.parseInt(businessKey1);
        //取出课程发布信息
        CourseBase courseBase = courseBaseMapper.selectById(courseId);
        String jsonString = JSON.toJSONString(courseBase);
        String of = HttpUtils.sendPost("http://localhost:10095/ai/course_commit_audit", jsonString);
        if (!Boolean.parseBoolean(of)) {
            courseBase.setAuditStatus("202004");
            courseBaseMapper.updateById(courseBase);
            sseServer.sendToAllMessage(courseBase.getId().toString(),courseBase.getName() + "课程审核通过");
        }else {
            sseServer.sendToAllMessage(courseBase.getId().toString(),courseBase.getName() + "课程审核不通过");
        }
        return true;
    }
}
