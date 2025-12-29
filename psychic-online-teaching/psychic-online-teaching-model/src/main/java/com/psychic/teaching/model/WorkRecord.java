package com.psychic.teaching.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class WorkRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Long companyId;

    private Long courseId;

    private Long coursePubId;

    private Long workId;

    private Long teachplanId;

    private String username;

    private String answer;

    private String answerType;

    private String status;

    private String correctComment;

    private String correctUsername;

    private LocalDateTime correctionDate;

    private LocalDateTime submitDate;

    private LocalDateTime createDate;

    private LocalDateTime changeDate;
}
