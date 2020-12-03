package com.farm.mapper;

import com.farm.pojo.SecondCategory;

import java.util.List;

public interface SecondCategoryMapper {
    List<SecondCategory> list(int fid);
    void add(SecondCategory secondCategory);
    void delete(int id);
    void update(SecondCategory secondCategory);
    SecondCategory get(int id);
}
