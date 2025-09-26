package com.psychic.base.execption;

import com.psychic.base.enums.CommonError;

public class ServiceException extends RuntimeException {

    private String message;

    public ServiceException(String errMessage) {
        super(errMessage);
        this.message = errMessage;
    }

    public ServiceException(CommonError commonError) {
        super(commonError.getErrMessage());
        this.message = commonError.getErrMessage();
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
