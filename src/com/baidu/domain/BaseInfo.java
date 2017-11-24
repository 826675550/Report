package com.baidu.domain;

public class BaseInfo {
    private Integer id;
    private Integer bid;
    private String var;
    private Integer Status;

    @Override
    public String toString() {
        return "BaseInfo{" +
                "id=" + id +
                ", bid=" + bid +
                ", var='" + var + '\'' +
                ", Status=" + Status +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getVar() {
        return var;
    }

    public void setVar(String var) {
        this.var = var;
    }

    public Integer getStatus() {
        return Status;
    }

    public void setStatus(Integer status) {
        Status = status;
    }

    public BaseInfo() {

    }
}
