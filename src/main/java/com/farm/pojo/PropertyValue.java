package com.farm.pojo;

public class PropertyValue {
    private int id;
    private int pid;//属性id；
    private int pdid;//产品id；
    private String value;//属性值；
    private Property property;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    @Override
    public String toString() {
        return "PropertyValue{" +
                "id=" + id +
                ", pid=" + pid +
                ", pdid=" + pdid +
                ", value='" + value + '\'' +
                ", property=" + property +
                '}';
    }
}
