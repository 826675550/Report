package com.baidu.services;

import com.baidu.domain.User;
import com.baidu.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * Created by null on 2017/11/5.
 */
@Service
public class UserServices {
    @Autowired
    private UserRepository repository;

    public List<User> login(String userName, String pwd) {
        return repository.login(userName, pwd);
    }

    public User selectUserByEmail(String userName) {
        return repository.selectUserByEmail(userName);
    }

    public User selectUserByPhone(String phone) {
        return repository.selectUserByPhone(phone);
    }

    public Set<String> findRoles(String email) {
        return repository.findRoles(email);
    }

    public Set<String> findPermissions(String email) {
        return repository.findPermissions(email);
    }

    public List<User> getAll() {
        return repository.getAll();
    }

    public int delUser(Integer id) {
        return repository.delUser(id);
    }

    public int addUser(User user) {
        return repository.addUser(user);
    }

    public int editUser(User user) {
        return repository.editUser(user);
    }
    public  int upRole(User user){
        return repository.upRole(user);
    }
}
