package com.farm.service;

import com.farm.pojo.Product;
import com.farm.pojo.Property;
import com.farm.pojo.PropertyValue;


import java.util.List;

public interface PropertyValueService {
    void init(Product p);
    void update(PropertyValue pv);
    void deleteByPdid(int pdid);
    PropertyValue get(int pid, int pdid);
    List<PropertyValue> list(int pdid);
    List<PropertyValue> listByPid(int pid);
    List<PropertyValue> listByPdid(int pdid);
    public void fill(Property p);
    public void fill(List<Property> ps);
}
