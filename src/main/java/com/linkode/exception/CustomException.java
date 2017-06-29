package com.linkode.exception;

/**
 * Created by gaoshiqi on 2017/6/29.
 */

/**
 * 自定义异常类
 */
public class CustomException extends Exception {
    public String message;

    public CustomException(String message){
        super(message);
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
