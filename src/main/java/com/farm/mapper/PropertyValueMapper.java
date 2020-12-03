package com.farm.mapper;

import com.farm.pojo.Product;
import com.farm.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueMapper {
    void insert(PropertyValue pv);
    void update(PropertyValue pv);
    void deleteByPdid(int pdid);
    PropertyValue get(int pid, int pdid);
    List<PropertyValue> list(int pdid);
    List<PropertyValue> listByPdid(int pdid);
    List<PropertyValue> listByPid(int pid);
}
