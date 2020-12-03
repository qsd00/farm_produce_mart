package com.farm.pojo;

public class OrderItem {
    private Integer id;
    private Integer pdid;//产品id
    private Integer oid;//买家订单id
    private Integer uid;//买家id
    private Integer number;//订单项数量
    private Integer otid;//卖家订单id
    private Integer sid;//卖家id

    private Product product;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPdid() {
        return pdid;
    }

    public void setPdid(Integer pdid) {
        this.pdid = pdid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getOtid() {
        return otid;
    }

    public void setOtid(Integer otid) {
        this.otid = otid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", pdid=" + pdid +
                ", oid=" + oid +
                ", uid=" + uid +
                ", number=" + number +
                ", product=" + product +
                '}';
    }
}
