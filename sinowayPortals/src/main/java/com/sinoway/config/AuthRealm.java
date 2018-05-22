package com.sinoway.config;

import com.sinoway.entity.CustomerEntity;
import com.sinoway.service.CustomerService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;


public class AuthRealm extends AuthorizingRealm {

    @Autowired
    private CustomerService customerService;

    /**
     * 授权用户权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        CustomerEntity customer  = (CustomerEntity) principals.getPrimaryPrincipal();

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
        CustomerEntity customer = customerService.findByUsername(token.getUsername());

        if(customer == null){
            throw new UnknownAccountException();
        }

        if(!customer.getActivated()){
            throw new DisabledAccountException();
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(customer.getUsername());

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(customer, customer.getPassword(), credentialsSalt,getName());
        return authenticationInfo;
    }

}