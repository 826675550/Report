package com.baidu.services;

import com.baidu.repository.DbContextHolder;
import com.baidu.domain.Role;
import com.baidu.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by null on 2017/11/3.
 */
@Service
public class RoleServices {

    @Autowired
    private RoleRepository repository;

    public List<Role> getAll() {
        return this.repository.getAll();
    }

    public int delRole(Integer id) {
        return this.repository.delRole(id);
    }

    public int addRole(Role role) {
        return this.repository.addRole(role);
    }

    public int editRole(Role role) {
        return this.repository.editRole(role);
    }
}
