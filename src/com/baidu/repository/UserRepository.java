package com.baidu.repository;

import com.baidu.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

/**
 * Created by null on 2017/11/5.
 */
@Repository
public interface UserRepository {
    List<User> login(String userName,String pwd);
    User selectUserByEmail(String email);
    User selectUserByPhone(String phone);
    Set<String> findRoles(String email);

    Set<String> findPermissions(String email);
    List<User> getAll();
    int delUser(Integer id);
    int addUser(User user);
    int editUser(User user);
    int upRole(User user);
}
