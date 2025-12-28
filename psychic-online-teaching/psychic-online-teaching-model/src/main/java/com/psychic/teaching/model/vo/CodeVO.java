package com.psychic.teaching.model.vo;

import lombok.Data;

@Data
public class CodeVO {
    private String stdout;
    private String stderr;
    private Integer exitCode;
    private Boolean timeout;
    private Long durationMs;
}
