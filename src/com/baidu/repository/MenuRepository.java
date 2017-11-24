package com.baidu.repository;

import com.baidu.domain.Menu;
import com.baidu.domain.MenuRole;
import com.baidu.domain.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by null on 2017/11/13.
 */
@Repository
public interface MenuRepository {
    List<Menu> getMenuByRid(Integer rid);
    List<Menu> getMenu();
    int addMenuToRole(MenuRole menuRole);
    int delMenuToRole(Integer rid);
    int delMenu(Integer rid);
    int addMenu(Menu menu);
    int upMenu(Menu menu);





}
