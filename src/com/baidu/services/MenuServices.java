package com.baidu.services;

import com.baidu.domain.Menu;
import com.baidu.domain.MenuRole;
import com.baidu.domain.Role;
import com.baidu.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by null on 2017/11/13.
 */
@Service
public class MenuServices {
    @Autowired
    private MenuRepository repository;

    public List<Menu> getMenuByRid(Integer rid) {
        return repository.getMenuByRid(rid);
    }

    public List<Menu> getMenu() {
        return repository.getMenu();
    }

    public int addMenuToRole(MenuRole menuRole) {
        return repository.addMenuToRole(menuRole);
    }

    public int delMenuToRole(Integer rid) {
        return repository.delMenuToRole(rid);
    }

    public int delMenu(Integer rid) {
        return repository.delMenu(rid);
    }

    public  int addMenu(Menu menu) {
        return repository.addMenu(menu);
    }

    public int upMenu(Menu menu) {
        return repository.upMenu(menu);
    }
}
