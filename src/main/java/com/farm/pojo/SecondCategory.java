package com.farm.pojo;

import java.util.List;

public class SecondCategory {
    private int id;
    private String name;
    private int fid;//FirstCategory.id
    private List<Category>   lc;

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

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public List<Category> getLc() {
        return lc;
    }

    public void setLc(List<Category> lc) {
        this.lc = lc;
    }
}
