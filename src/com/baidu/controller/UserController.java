package com.baidu.controller;

import com.baidu.domain.Role;
import com.baidu.domain.User;
import com.baidu.services.UserServices;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;




import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by null on 2017/11/5.
 */
@RequestMapping("User")
@Controller
public class UserController {
    @Resource
    private UserServices services;

    @RequestMapping(value = "/loginByPhone",method = RequestMethod.POST)
    @ResponseBody
    public String loginByPhone(@RequestParam("user") String email, @RequestParam("pwd") String pwd, Model model, HttpServletRequest request) {
        Subject subject = SecurityUtils.getSubject();
        HttpSession session=request.getSession();

        UsernamePasswordToken token = new UsernamePasswordToken(email, pwd);
        try {
            subject.login(token);
            System.out.println("pwd:"+pwd+"user:"+email);
            if(session.getAttribute("err")!=null) session.removeAttribute("err");
            return "index.jsp" ;
        }catch (Exception e){
            //这里将异常打印关闭是因为如果登录失败的话会自动抛异常
//            e.printStackTrace();
            session.setAttribute("err","用户名或密码错误");
            return "error.jsp" ;
        }
    }

    @RequestMapping(value = "/getUser",method = RequestMethod.POST)
    @ResponseBody
    public List<User> getAllUser(){
        return services.getAll();
    }

    @RequestMapping(value = "/delUser", method = RequestMethod.POST)
    @ResponseBody
    public boolean delUser(@RequestParam("id")String ids){
        System.out.println(ids);
        boolean r = false;
        String[] splits = ids.split(",");
        for(int i =0;i<splits.length;i++) {
            if (services.delUser(Integer.parseInt(splits[i])) > 0) {
                r =  true;
            } else {
                return false;
            }
        }
        return true;
    }
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public boolean addUser(User user){
        System.out.println("123456");
        System.out.println(user);
        if(services.addUser(user) > 0){
            return  true;
        }
        return false;
    }

    @RequestMapping("/saveUser")
    @ResponseBody
    public boolean saveUser(User user){
        System.out.println(user);
        if (services.editUser(user)>0){
            return true;
        }
        return  false;
    }
    @RequestMapping(value="/upRole", method = RequestMethod.GET)
    @ResponseBody
    public boolean upRole(@RequestParam("id") Object id,@RequestParam("identityFlag") Integer identityFlag){
        System.out.println(id+"--"+identityFlag);

        if (services.upRole(new User(Integer.parseInt(id.toString()),identityFlag,"","","",1,new Date(),1,new Role()))>0){
            return true;
        }
        return  false;
    }


}
