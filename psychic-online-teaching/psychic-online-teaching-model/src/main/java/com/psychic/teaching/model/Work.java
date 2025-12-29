package com.psychic.teaching.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import java.time.LocalDateTime;

/**
 * 作业表
 */
@Data
public class Work {

    /**
     * 作业ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Long companyId;

    private Long courseId;

    private Long teachplanId;

    /**
     * 作业标题
     */
    private String title;

    /**
     * 作业内容/要求
     */
    private String question;

    /**
     * 创建时间
     */
    private LocalDateTime createDate;

    /**
     * 修改时间
     */
    private LocalDateTime changeDate;
}

