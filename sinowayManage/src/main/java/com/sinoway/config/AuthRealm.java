package com.sinoway.config;

import com.sinoway.bean.User;
import com.sinoway.mapper.UserMapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;


public class AuthRealm extends AuthorizingRealm {

    @Autowired
    private UserMapper userMapper;

    /**
     * 授权用户权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        User user  = (User) principals.getPrimaryPrincipal();

//        if(user.getRoles() != null){
//            for(Role role:user.getRoles()){
//                authorizationInfo.addRole(role.getIdentification());
//                for(Permission p:role.getPermissions()){
//                    authorizationInfo.addStringPermission(p.getIdentification());
//                }
//            }
//        }

        return authorizationInfo;
    }
    /**
     * 验证用户身份
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userMapper.findUserByName(token.getUsername());

        if(user == null){
            throw new UnknownAccountException();
        }

        if(!user.getAvailable()){
            throw new DisabledAccountException();
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUserName());

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), credentialsSalt,getName());
        return authenticationInfo;
    }

}