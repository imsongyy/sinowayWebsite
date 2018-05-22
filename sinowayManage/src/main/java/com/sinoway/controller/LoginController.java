package com.sinoway.controller;

import com.sinoway.bean.User;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;

import static javax.security.auth.message.AuthStatus.SUCCESS;

/**
 * Created by souyouyou on 2018/4/9.
 */

@Controller
@RequestMapping(value = "/")
public class LoginController {

    @RequestMapping(value = "index")
    public ModelAndView index(){

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");

        return modelAndView;
    }

    @RequestMapping(value = "login")
    public ModelAndView login(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");

        return modelAndView;
    }


    @RequestMapping(value = "sign_in")
    @ResponseBody
    public String sign_in(@RequestParam(value = "username")String userName,
                                @RequestParam(value = "password")String password){
        JSONObject result = new JSONObject();

        Subject currentUser = SecurityUtils.getSubject();

        Md5Hash mh = new Md5Hash(password, userName, 2);
        UsernamePasswordToken token=new UsernamePasswordToken(userName,mh.toString());

        token.setRememberMe(true);

        String msg = "";
        try {
            currentUser.login(token);
            User user = (User) currentUser.getPrincipal();
            msg = "success";
        }catch (UnknownAccountException e){
            msg = "账户不存在!";
        }catch (IncorrectCredentialsException e){
            msg = "账户密码错误!";
        }catch (DisabledAccountException e){
            msg = "账户状态异常!";
        }catch (AuthenticationException e){
            msg = "登录异常!";
        }

        result.put("msg",msg);
        return JSONObject.fromObject(result).toString();
    }


    @RequestMapping(value = "sign_out")
    public ModelAndView sign_out(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");

        Subject subject = SecurityUtils.getSubject();
        subject.logout();

        return modelAndView;
    }

}
