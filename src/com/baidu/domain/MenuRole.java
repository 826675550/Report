package com.baidu.domain;

public class MenuRole {
    private Integer id;
    private Integer rid;
    private Integer mid;

    public MenuRole(Integer rid, Integer mid) {
        this.rid = rid;
        this.mid = mid;
    }

    @Override
    public String toString() {
        return "MenuRole{" +
                "id=" + id +
                ", rid=" + rid +
                ", mid=" + mid +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public MenuRole() {

    }
}
