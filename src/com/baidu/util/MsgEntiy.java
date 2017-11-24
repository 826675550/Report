package com.baidu.util;

/**
 * Created by null on 2017/11/21.
 */
public class MsgEntiy {
    private String code;
    private String msg;
    private String obj;

    public MsgEntiy() {
    }

    @Override
    public String toString() {
        return "MsgEntiy{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", obj='" + obj + '\'' +
                '}';
    }

    public MsgEntiy(String code, String msg, String obj) {
        this.code = code;
        this.msg = msg;
        this.obj = obj;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getObj() {
        return obj;
    }

    public void setObj(String obj) {
        this.obj = obj;
    }
}
