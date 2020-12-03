package com.farm.mapper;

import com.farm.pojo.OutOrder;

import java.util.List;

public interface OutOrderMapper {
    void add(OutOrder oto);
    void update(OutOrder oto);
    void delete(int otid);
    OutOrder get(int id);
    List<OutOrder> getByOid(int oid);//根据oid查询所有订单
    List<OutOrder> listAll();
    List<OutOrder> list(int sid);
    List<OutOrder> listBySid(int sid,String status);
}
