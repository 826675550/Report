package com.baidu.repository;

import com.baidu.domain.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by null on 2017/11/3.
 */
@Repository
public interface RoleRepository {

    List<Role> getAll();
    int delRole(Integer id);
    int addRole(Role role);
    int editRole(Role role);

}
