package com.baidu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private Integer id;
    private Integer identityFlag;
    private String email;
    private String phone;
    private String password;
    private Integer operacteId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    private Integer status;
    private Role role;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", identityFlag=" + identityFlag +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", operacteId=" + operacteId +
                ", createTime=" + createTime +
                ", status=" + status +
                ", role=" + role +
                '}';
    }

    public User() {
    }

    public User(Integer id, Integer identityFlag, String email, String phone, String password, Integer operacteId, Date createTime, Integer status, Role role) {
        this.id = id;
        this.identityFlag = identityFlag;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.operacteId = operacteId;
        this.createTime = createTime;
        this.status = status;
        this.role = role;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdentityFlag() {
        return identityFlag;
    }

    public void setIdentityFlag(Integer identityFlag) {
        this.identityFlag = identityFlag;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getOperacteId() {
        return operacteId;
    }

    public void setOperacteId(Integer operacteId) {
        this.operacteId = operacteId;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


}
