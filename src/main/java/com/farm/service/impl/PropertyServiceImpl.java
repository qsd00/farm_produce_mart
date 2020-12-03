package com.farm.service.impl;

import com.farm.mapper.PropertyMapper;
import com.farm.pojo.Property;
import com.farm.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    private PropertyMapper propertyMapper;
    @Override
    public List<Property> list(int cid) {
        return propertyMapper.list(cid);
    }

    @Override
    public void add(Property property) {
        propertyMapper.add(property);
    }

    @Override
    public void delete(int id) {
        propertyMapper.delete(id);
    }

    @Override
    public Property get(int id) {
        return propertyMapper.get(id);
    }

    @Override
    public void update(Property property) {
        propertyMapper.update(property);
    }
}
