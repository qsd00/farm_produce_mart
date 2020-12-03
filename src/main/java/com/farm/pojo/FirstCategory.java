package com.farm.pojo;

import java.util.List;

public class FirstCategory {
    private int id;
    private String name;
    private List<SecondCategory> sc;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<SecondCategory> getSc() {
        return sc;
    }

    public void setSc(List<SecondCategory> sc) {
        this.sc = sc;
    }

}
