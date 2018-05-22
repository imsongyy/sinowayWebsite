package com.sinoway.controller;

import com.sinoway.entity.CustomerEntity;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by souyouyou on 2018/4/9.
 */

@Controller
@RequestMapping(value = "/")
public class MainController {


    @RequestMapping(value = "index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");

        return modelAndView;
    }

    @RequestMapping(value = "register")
    public ModelAndView register(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");

        return modelAndView;
    }

    @RequestMapping(value = "login")
    public ModelAndView login(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");

        return modelAndView;
    }

    @RequestMapping(value = "completion")
    public ModelAndView completion(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("completion");

        return modelAndView;
    }

    @RequestMapping(value = "resetpassword")
    public ModelAndView resetpassword(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("resetpassword");

        return modelAndView;
    }

    @RequestMapping(value = "credit0")
    public ModelAndView credit0(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("credit0");

        return modelAndView;
    }

    @RequestMapping(value = "credit2")
    public ModelAndView credit2(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("credit2");

        return modelAndView;
    }

    @RequestMapping(value = "credit3")
    public ModelAndView credit3(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("credit3");

        return modelAndView;
    }

    @RequestMapping(value = "credit4")
    public ModelAndView credit4(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("credit4");

        return modelAndView;
    }

    @RequestMapping(value = "credit5")
    public ModelAndView credit5(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("credit5");

        return modelAndView;
    }

    @RequestMapping(value = "service")
    public ModelAndView service(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("service");

        return modelAndView;
    }

    @RequestMapping(value = "myAccount")
    public ModelAndView myAccount(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("myAccount");

        return modelAndView;
    }

    @RequestMapping(value = "mazagine")
    public ModelAndView mazagine(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("mazagine");

        return modelAndView;
    }

    @RequestMapping(value = "drive")
    public ModelAndView drive(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("drive");

        return modelAndView;
    }
    @RequestMapping(value = "feedback")
    public ModelAndView feedback(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feedback");

        return modelAndView;
    }


    @RequestMapping(value = "interfac")
    public ModelAndView interfac(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("interfac");

        return modelAndView;
    }

    @RequestMapping(value = "welcome")
    public ModelAndView welcome(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("welcome");

        return modelAndView;
    }

    @RequestMapping(value = "cisp1")
    public ModelAndView cisp1(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cisp1");

        return modelAndView;
    }

    @RequestMapping(value = "cisp2")
    public ModelAndView cisp2(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cisp2");

        return modelAndView;
    }

    @RequestMapping(value = "cisp4")
    public ModelAndView cisp4(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cisp4");

        return modelAndView;
    }

    @RequestMapping(value = "cisp5")
    public ModelAndView cisp5(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cisp5");

        return modelAndView;
    }
    @RequestMapping(value = "cisp6")
    public ModelAndView cisp6(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cisp6");

        return modelAndView;
    }


    protected CustomerEntity getUser(){
        Subject subject = SecurityUtils.getSubject();
        return (CustomerEntity) subject.getPrincipal();
    }
}
