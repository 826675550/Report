package com.baidu.util;

import com.baidu.domain.User;
import com.baidu.services.RoleServices;
import com.baidu.services.UserServices;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;




import javax.annotation.Resource;
import java.util.Set;

/**
 * Created by null on 2017/11/4.
 */
public class MyRealm extends AuthorizingRealm {

    @Resource
    private UserServices services;

    /**
     * 用于的权限的认证。
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<String> roleName = services.findRoles(username);
        Set<String> permissions = services.findPermissions(username);
        info.setRoles(roleName);
        info.setStringPermissions(permissions);
        return info;

    }


    /**
     * 用于登录验证
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String email = token.getPrincipal().toString();
        User user = services.selectUserByEmail(email);
        if (user != null) {
            //将查询到的用户账号和密码存放到 authenticationInfo用于后面的权限判断。第三个参数传入realName。
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getEmail(), user.getPassword(),
                    "a");
            return authenticationInfo;
        } else {
            user = services.selectUserByPhone(email);
            if (user != null) {
                AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getEmail(), user.getPassword(),
                        "a");
                return authenticationInfo;
            } else {
                return null;
            }
        }

    }
}
