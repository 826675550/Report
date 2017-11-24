package com.baidu.controller;

import com.baidu.domain.Role;
import com.baidu.domain.User;
import com.baidu.services.RoleServices;
import com.baidu.services.UserServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by null on 2017/11/9.
 */
@RequestMapping("Role")
@Controller
public class RoleController {
    @Resource
    private RoleServices services;

    @RequestMapping(value = "/getRole",method = RequestMethod.POST)
    @ResponseBody
    public List<Role> getAllRole(){
        return services.getAll();
    }

    @RequestMapping(value = "/delRole", method = RequestMethod.POST)
    @ResponseBody
    public boolean delRole(@RequestParam("id")String ids){
        System.out.println(ids);
        boolean r = false;
        String[] splits = ids.split(",");
        for(int i =0;i<splits.length;i++) {
            if (services.delRole(Integer.parseInt(splits[i])) > 0) {
                r =  true;
            } else {
                return false;
            }
        }
        return true;
    }

    @RequestMapping(value = "/addRole", method = RequestMethod.POST)
    @ResponseBody
    public boolean addRole(Role role){
        System.out.println("123456");
        System.out.println(role);
        if(services.addRole(role) > 0){
            return  true;
        }
        return false;
    }
    @RequestMapping("/saveRole")
    @ResponseBody
    public boolean saveUser(Role role){
        System.out.println(role);
        if (services.editRole(role)>0){
            return true;
        }
        return  false;
    }



}
