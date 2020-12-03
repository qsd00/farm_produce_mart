package com.farm.mapper;

import com.farm.pojo.User;

import java.util.List;

public interface UserMapper {
    void insertUser(User user);
    void deleteUser(Integer id);
    void updateUser(User user);
    User getUserById(Integer id);
    List<User> list();
    User isExist(String name);

    User getUser(String name, String pwd);

}
