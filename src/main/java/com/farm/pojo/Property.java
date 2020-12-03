package com.farm.pojo;

import java.util.List;

public class Property {
      private int id;
      private String name;
      private int cid;//Category的id
      private List<PropertyValue>  pvs;

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

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public List<PropertyValue> getPvs() {
        return pvs;
    }

    public void setPvs(List<PropertyValue> pvs) {
        this.pvs = pvs;
    }

    @Override
    public String toString() {
        return "Property{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cid=" + cid +
                ", pvs=" + pvs +
                '}';
    }
}
