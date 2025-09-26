package com.psychic.base.model;

import java.io.Serializable;

public class ErrorResult implements Serializable {

    private String errMessage;

    public ErrorResult(String errMessage){
        this.errMessage= errMessage;
    }

    public String getErrMessage() {
        return errMessage;
    }

    public void setErrMessage(String errMessage) {
        this.errMessage = errMessage;
    }
}
