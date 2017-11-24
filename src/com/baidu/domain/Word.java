package com.baidu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Word {
    private Integer id;
    private Integer btid;
    private String context;
    private String title;
    private Integer uid;
    private Integer status;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    public Word() {
    }

    @Override
    public String toString() {
        return "Word{" +
                "id=" + id +
                ", btid=" + btid +
                ", context='" + context + '\'' +
                ", title='" + title + '\'' +
                ", uid=" + uid +
                ", status=" + status +
                ", createTime=" + createTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBtid() {
        return btid;
    }

    public void setBtid(Integer btid) {
        this.btid = btid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
