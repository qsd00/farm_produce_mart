package com.farm.pojo;

import com.farm.service.OutOrderService;

import java.util.Date;
import java.util.List;

public class OutOrder {
    private Integer id;
    private String orderCode;
    private Integer sid;
    private Integer uid;
    private Integer oid;
    private String status;
    private Date   createDate;
    private Date   deliveryDate;
    private Date   paidDate;

    private User user;//买家
    private User sellUser;//卖家
    private List<OrderItem> orderItems;
    private float total;
    private int totalNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Date getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Date paidDate) {
        this.paidDate = paidDate;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getSellUser() {
        return sellUser;
    }

    public void setSellUser(User sellUser) {
        this.sellUser = sellUser;
    }

    public String getStatusDesc(){
        String desc ="未知";
        switch(status){
            case OutOrderService.waitDelivery:
                desc="待发货";
                break;
            case OutOrderService.waitConfirm:
                desc="待收货";
                break;
            case OutOrderService.waitPaid:
                desc="待收款";
                break;
            case OutOrderService.finish:
                desc="完成";
                break;
            default:
                desc="未知";
        }
        return desc;
    }

    @Override
    public String toString() {
        return "OutOrder{" +
                "id=" + id +
                ", orderCode='" + orderCode + '\'' +
                ", sid=" + sid +
                ", uid=" + uid +
                ", oid=" + oid +
                ", status='" + status + '\'' +
                ", createDate=" + createDate +
                ", deliveryDate=" + deliveryDate +
                ", paidDate=" + paidDate +
                ", user=" + user +
                ", sellUser=" + sellUser +
                ", orderItems=" + orderItems +
                ", total=" + total +
                ", totalNumber=" + totalNumber +
                '}';
    }
}
