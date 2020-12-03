package com.farm.mapper;

import com.farm.pojo.Order;

import java.util.List;

public interface OrderMapper {

    void add(Order c);
    void delete(int id);
    void update(Order c);
    Order get(int id);
    List list();
    List listByUser(int uid,String status);
    List listByStatus(int uid,String status);

}
