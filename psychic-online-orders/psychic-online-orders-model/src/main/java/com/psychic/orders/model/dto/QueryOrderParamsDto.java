package com.psychic.orders.model.dto;

import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
@ToString
public class QueryOrderParamsDto {

    private Long orderNo;

    private String userId;

    private String courseName;

    private String status;

    private LocalDateTime orderStart;

    private LocalDateTime orderEnd;
}
