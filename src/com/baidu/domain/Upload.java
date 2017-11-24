package com.baidu.domain;

public class Upload {
    private Integer id;
    private Integer wid;
    private String path;

    @Override
    public String toString() {
        return "Upload{" +
                "id=" + id +
                ", wid=" + wid +
                ", path='" + path + '\'' +
                '}';
    }

    public Upload(String path) {
        this.path = path;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Upload() {
    }
}
