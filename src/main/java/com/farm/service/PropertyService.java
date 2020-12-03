package com.farm.service;

import com.farm.pojo.Category;
import com.farm.pojo.Property;

import java.util.List;
public interface PropertyService {
    List<Property> list(int cid);
    void add(Property property);
    void delete(int id);
    Property get(int id);
    void update(Property property);
}
