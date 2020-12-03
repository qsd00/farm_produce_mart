package com.farm.mapper;

import com.farm.pojo.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> list(int sid);
    List<Category> listAll();
    void add(Category category);
    void delete(int id);
    Category get(int id);
    void update(Category category);
}
