package com.farm.service;

import com.farm.pojo.*;

import java.util.List;

public interface OrderItemService {
    void add(OrderItem c);
    void delete(int id);
    void update(OrderItem c);
    OrderItem get(int id);
    List<OrderItem> listByOid(int oid);
    List<OrderItem> listByOtid(int otid);
    List<OrderItem> listByUid(int uid);
    List listBySidAndOid(int sid,int oid);
     int getSaleCount(int pdid);
    void fill(List<Order> os);
    void fill(Order o);
    void fillOfOut(List<OutOrder> ots);//填充商户订单的订单项
    void fillOfOut(OutOrder ot);
    List<OrderItem> listByPdids(int[] ids);
}
