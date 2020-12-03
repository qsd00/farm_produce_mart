package com.farm.mapper;

import com.farm.pojo.FirstCategory;
import com.farm.pojo.Page;

import java.util.List;

public interface FirstCategoryMapper {
    void add(FirstCategory firstCategory);
    void delete(int id);
    FirstCategory get(int id);
    void update(FirstCategory firstCategory);
    List<FirstCategory> list();
    List<FirstCategory> listById(int id);

}
