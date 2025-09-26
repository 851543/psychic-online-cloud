package com.psychic.base.execption;

import com.psychic.base.enums.CommonError;
import com.psychic.base.model.ErrorResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @description 全局异常处理器
 * @author 851543
 * @date 2022/9/6 11:29
 * @version 1.0
 */
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ResponseBody
    @ExceptionHandler(ServiceException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResult customException(ServiceException e) {
        log.error("【系统异常】{}",e.getMessage(),e);
        return new ErrorResult(e.getMessage());

    }

    @ResponseBody
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResult exception(Exception e) {
        log.error("【系统异常】{}",e.getMessage(),e);
        return new ErrorResult(CommonError.UNKOWN_ERROR.getErrMessage());

    }
}
