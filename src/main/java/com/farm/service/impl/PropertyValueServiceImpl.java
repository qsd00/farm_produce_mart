package com.farm.service.impl;

import com.farm.mapper.PropertyMapper;
import com.farm.mapper.PropertyValueMapper;
import com.farm.pojo.Product;
import com.farm.pojo.Property;
import com.farm.pojo.PropertyValue;
import com.farm.service.PropertyService;
import com.farm.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PropertyValueServiceImpl implements PropertyValueService {
    @Autowired
    PropertyValueMapper propertyValueMapper;

    @Autowired
    PropertyService propertyService;

    @Override
    public void init(Product p) {
        List<Property> pts = propertyService.list(p.getCid());

        for (Property pt: pts) {
            PropertyValue pv = get(pt.getId(),p.getId());
            if(null==pv){
                pv = new PropertyValue();
                pv.setPid(pt.getId());
                pv.setPdid(p.getId());
                propertyValueMapper.insert(pv);
            }
        }
    }

    @Override
    public void update(PropertyValue pv) {
               propertyValueMapper.update(pv);
    }

    @Override
    public void deleteByPdid(int pdid) {
        propertyValueMapper.deleteByPdid(pdid);
    }

    @Override
    public PropertyValue get(int pid, int pdid) {
        return propertyValueMapper.get(pid,pdid);
    }

    @Override
    public List<PropertyValue> list(int pdid) {

        return propertyValueMapper.list(pdid);
    }

    @Override
    public List<PropertyValue> listByPid(int pid) {
        return propertyValueMapper.listByPid(pid);
    }

    @Override
    public List<PropertyValue> listByPdid(int pdid) {
        return propertyValueMapper.listByPdid(pdid);
    }

    @Override
    public void fill(Property p) {
        List<PropertyValue> pvs=propertyValueMapper.listByPid(p.getId());
        p.setPvs(pvs);
    }

    @Override
    public void fill(List<Property> ps) {
       for (Property p:ps){
           fill(p);
       }
    }
}
