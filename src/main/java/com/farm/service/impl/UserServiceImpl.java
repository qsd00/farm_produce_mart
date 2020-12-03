package com.farm.service.impl;

import com.farm.mapper.UserMapper;
import com.farm.pojo.User;
import com.farm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public void regist(User c) {
        userMapper.insertUser(c);
    }

    @Override
    public void delete(int id) {
        userMapper.deleteUser(id);
    }

    @Override
    public void update(User c) {
        userMapper.updateUser(c);
    }

    @Override
    public User getUser(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public List<User> list() {
        return userMapper.list();
    }

    @Override
    public User isExist(String name) {
        return userMapper.isExist(name);
    }

    @Override
    public User login(String name, String password) {
        return userMapper.getUser(name,password);
    }
}
