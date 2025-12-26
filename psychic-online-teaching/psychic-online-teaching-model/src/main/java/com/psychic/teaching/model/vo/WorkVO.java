package com.psychic.teaching.model.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 作业VO
 */
@Data
public class WorkVO {

    /**
     * 作业Id值
     */
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String question;

    private Long teachplanId;

    private String userNum;

    private LocalDateTime changeDate;
}
