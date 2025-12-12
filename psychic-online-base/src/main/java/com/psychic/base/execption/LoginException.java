package com.psychic.base.execption;

public class LoginException extends RuntimeException{
    public LoginException(String errMessage){
        super(errMessage);
    }
}
