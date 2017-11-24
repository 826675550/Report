package com.baidu.controller;

import com.baidu.domain.Menu;
import com.baidu.domain.MenuRole;
import com.baidu.domain.Role;
import com.baidu.services.MenuServices;
import com.baidu.services.RoleServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by null on 2017/11/13.
 */
@RequestMapping("Menu")
@Controller
public class MenuController {
    @Resource
    private MenuServices services;

    @RequestMapping(value = "/getMenu", method = RequestMethod.POST)
    @ResponseBody
    public List<Menu> getMenu() {
        return services.getMenu();
    }

    @RequestMapping(value = "/getMid", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> getMid(@RequestParam("rid") Integer rid) {
        return services.getMenuByRid(rid);
    }

    @RequestMapping(value = "/addMenu", method = RequestMethod.POST)
    @ResponseBody
    public int upMenu(MenuRole menuRole) {
        return services.addMenuToRole(menuRole);

    }

    @RequestMapping(value = "/upRole", method = RequestMethod.POST)
    @ResponseBody
    public boolean upRole(@RequestParam("rid")int rid,@RequestParam("ids") String ids) {
        boolean r;
        String[] splits = ids.split(",");
        r=services.delMenuToRole(rid)>0;
        for(int i =0;i<splits.length;i++) {
            if (services.addMenuToRole(new MenuRole(rid,Integer.parseInt(splits[i]))) > 0) {
                r =  true;
                System.out.println(splits[i]);
            } else {
                r =false;
            }
        }

        return r;

    }

    @RequestMapping(value = "/addMenus", method = RequestMethod.POST)
    @ResponseBody
    public boolean addMenus(Menu menu) {

        if(services.addMenu(menu) > 0){
            return  true;
        }
        return false;
    }
    @RequestMapping(value = "/upMenus", method = RequestMethod.POST)
    @ResponseBody
    public boolean upMenus(Menu menu) {
        if (services.upMenu(menu)>0){
            return true;
        }
        return  false;
    }





    @RequestMapping(value = "/delMenus", method = RequestMethod.POST)
    @ResponseBody
    public boolean delMenus(@RequestParam("id") String ids) {
        boolean r = false;
        String[] splits = ids.split(",");
        for(int i =0;i<splits.length;i++) {
            if (services.delMenu(Integer.parseInt(splits[i])) > 0) {
                r =  true;
            } else {
                return false;
            }
        }
        return true;

    }

}
