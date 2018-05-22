package com.sinoway.bean;

import org.springframework.context.annotation.Scope;

import java.util.Map;

/**
 * Created by souyouyou on 2018/4/20.
 */
@Scope("prototype")
public class ResponseMessage {
    private String msg;
    private Map result;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map getResult() {
        return result;
    }

    public void setResult(Map result) {
        this.result = result;
    }
}
