package com.farm.service;

import com.farm.pojo.OutOrder;

import java.util.List;

public interface OutOrderService {
    String waitDelivery = "waitDelivery";//创建订单时的状态
    String waitConfirm = "waitConfirm";//发货后的状态
    String waitPaid = "waitPaid";//接收到货后的状态
    String finish = "finish";//收到钱后的状态

    void add(OutOrder oto);
    void update(OutOrder oto);
    void delete(int otid);
    OutOrder get(int id);
    List<OutOrder> getByOid(int oid);
    List<OutOrder> list();
    List<OutOrder> list(int sid);
    List<OutOrder> listBySid(int sid, String status);
    int getCount(List<OutOrder> ots);
}
