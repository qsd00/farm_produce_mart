package com.farm.service;

import com.farm.pojo.Category;
import com.farm.pojo.SecondCategory;

import java.util.List;

public interface CategoryService {
    List<Category> list(int sid);
    List<Category> listAll();
    void add(Category category);
    void delete(int id);
    Category get(int id);
    void update(Category category);
    public void fill(SecondCategory sc);
    public void fill(List<SecondCategory> scs);
}
