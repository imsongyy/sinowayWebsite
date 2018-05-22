package com.sinoway.controller;

import com.sinoway.bean.ResponseMessage;
import com.sinoway.entity.CustomerEntity;
import com.sinoway.entity.QuestionEntity;
import com.sinoway.service.QuestionService;
import com.sinoway.utils.DateUtils;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by souyouyou on 2018/4/27.
 */

@Controller
@RequestMapping(value = "/")
public class QuestionController {

    private final static Logger logger = Logger.getLogger(QuestionController.class);

    @Autowired
    private QuestionService questionService;


    @RequestMapping(value = "questions")
    @ResponseBody
    public ResponseMessage questions(){
        ResponseMessage resMsg = new ResponseMessage();
        try {
            final List<QuestionEntity> questions = questionService.findCommon();
            resMsg.setMsg("success");
            resMsg.setResult(new HashMap(){{
                put("result", questions);
            }});
        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg("Exception");
        }
        return resMsg;
    }



    @RequestMapping(value = "myQuestions")
    @ResponseBody
    public ResponseMessage myQuestions(){
        ResponseMessage resMsg = new ResponseMessage();
        try {
            final List<QuestionEntity> questions = questionService.findOwn();
            resMsg.setMsg("success");
            resMsg.setResult(new HashMap(){{
                put("result", questions);
            }});
        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg("Exception");
        }
        return resMsg;
    }

    @RequestMapping(value = "proposeQuestion")
    @ResponseBody
    public ResponseMessage proposeQuestion(@RequestParam(value = "type",required = false)String type,
                                           @RequestParam(value = "question")String question,
                                           @RequestParam(value = "username",required = false)String username,
                                           @RequestParam(value = "email",required = false)String email,
                                           @RequestParam(value = "mobile",required = false)String mobile){
        ResponseMessage resMsg = new ResponseMessage();

        try {
            QuestionEntity entity = new QuestionEntity();
            CustomerEntity customer = getUser();
            if (null != customer) {
                entity.setUsername(customer.getUsername());
                entity.setEmail(customer.getEmail());
                entity.setMobile(customer.getEmail());
            }else {
                entity.setUsername(username);
                entity.setEmail(email);
                entity.setMobile(mobile);
            }

            entity.setType(type);
            entity.setQuestion(question);
            entity.setDealStatus(false);
            entity.setQuzTime(DateUtils.getStrFormTime("yyyy-MM-dd HH:mm:ss",new Date()));

            questionService.save(entity);
            resMsg.setMsg("success");
        }catch (Exception e){
            resMsg.setMsg("Exception");
            logger.error(e.getMessage());
        }


        return resMsg;
    }


    protected CustomerEntity getUser(){
        Subject subject = SecurityUtils.getSubject();
        return (CustomerEntity) subject.getPrincipal();
    }

}
