package com.baidu.domain;

public class BaseType {
    private Integer id;
    private String name;

    public BaseType() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "BaseType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
