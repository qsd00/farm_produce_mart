package com.farm.mapper;

import com.farm.pojo.FirstCategory;
import com.farm.pojo.OrderItem;
import com.farm.pojo.Product;

import java.util.List;

public interface OrderItemMapper {
    void add(OrderItem c);
    void delete(int id);
    void update(OrderItem c);
    OrderItem get(int id);
    List listByOid(int oid);
    List listByOtid(int otid);
    List listByUid(int uid);
   List listByPdid(int pdid);
   List listBySidAndOid(int sid,int oid);
   List listByPdids(int[] ids);
}
