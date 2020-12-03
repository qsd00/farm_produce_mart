package com.farm.service.impl;

import com.farm.mapper.CategoryMapper;
import com.farm.pojo.Category;
import com.farm.pojo.SecondCategory;
import com.farm.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> list(int sid) {
        return categoryMapper.list(sid);
    }

    @Override
    public List<Category> listAll() {
        return categoryMapper.listAll();
    }

    @Override
    public void add(Category category) {
        categoryMapper.add(category);
    }

    @Override
    public void delete(int id) {
        categoryMapper.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryMapper.get(id);
    }

    @Override
    public void update(Category category) {
        categoryMapper.update(category);
    }

    @Override
    public void fill(SecondCategory sc) {
        List<Category> cs = list(sc.getId());
        sc.setLc(cs);

    }

    @Override
    public void fill(List<SecondCategory> scs) {
        for (SecondCategory sc : scs) {
            fill(sc);
        }
    }

}