package com.farm.service.impl;

import com.farm.mapper.FirstCategoryMapper;
import com.farm.pojo.FirstCategory;
import com.farm.pojo.Page;
import com.farm.service.FirstCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FirstCategoryServiceImpl implements FirstCategoryService {
    @Autowired
    private FirstCategoryMapper firstCategoryMapper;

    @Override
    public List<FirstCategory> list() {
        return firstCategoryMapper.list();
    }

    @Override
    public List<FirstCategory> listById(int id) {
        return firstCategoryMapper.listById(id);
    }

    @Override
    public void add(FirstCategory firstCategory) {
           firstCategoryMapper.add(firstCategory);
    }

    @Override
    public void delete(int id) {
          firstCategoryMapper.delete(id);
    }

    @Override
    public FirstCategory get(int id) {
        return firstCategoryMapper.get(id);
    }


    @Override
    public void update(FirstCategory firstCategory) {
       firstCategoryMapper.update(firstCategory);
    }



}
