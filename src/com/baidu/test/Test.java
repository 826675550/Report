package com.baidu.test;/**
 * Created by liuli on 2017/9/30.
 */


import com.baidu.domain.Menu;
import com.baidu.domain.Role;
import com.baidu.domain.User;
import com.baidu.repository.RoleRepository;
import com.baidu.services.MenuServices;
import com.baidu.services.RoleServices;
import com.baidu.services.UserServices;
import com.baidu.util.SendMsg_webchinese;
import org.apache.commons.httpclient.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.sql.DriverManager;
import java.util.Date;

/**
 * @author : Linda
 * @create : 2017-09-30 13:41
 * @desc :
 */
public class Test {
    ApplicationContext ac = new ClassPathXmlApplicationContext
            ("com/baidu/config/spring.xml");
    @Autowired
    private RoleRepository repository;

    @org.junit.Test
    public void fun(){
        UserServices services=ac.getBean(UserServices.class);
        System.out.println(services.upRole(new User(10,1,"","","",1,new Date(),1,new Role())));

    }
    @org.junit.Test
    public void fun1(){
        MenuServices services=ac.getBean(MenuServices.class);
        System.out.println(services.addMenu(new Menu("dome.html","111",6)) );
    }
    @org.junit.Test
    public void fun2()throws Exception{
        System.out.println(DateUtil.formatDate(new Date(), DateUtil.PATTERN_RFC1123));

    }
}
