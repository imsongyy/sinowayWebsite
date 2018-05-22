package com.sinoway.controller;

import com.sinoway.dao.QuestionRepository;
import com.sinoway.entity.QuestionEntity;
import com.sinoway.service.QuestionService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by souyouyou on 2018/4/27.
 */
@Controller
@RequestMapping(value = "/")
public class QuestionController {

    private final static Logger logger = Logger.getLogger(QuestionController.class);

    @Autowired
    private QuestionService questionService;

    @RequestMapping(value = "questionList")
    public String questionList(){
        return "question/list";
    }

    @RequestMapping(value = "questionDetail")
    public ModelAndView questionDetail(@RequestParam(value = "id") Long qid){

        QuestionEntity question = questionService.findOne(qid);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("question/detail");
        mav.addObject("question",question);

        return mav;

    }


    @RequestMapping(value = "questions")
    @ResponseBody
    public JSONObject questions(@RequestParam(value = "pageIndex", defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        JSONObject result = new JSONObject();

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");

        Pageable pageable = new PageRequest(page, size, sort);

        try {
            Page<QuestionEntity> questions = questionService.findAll(pageable);
            result.put("result",questions);
            result.put("msg","success");
        }catch (Exception e) {
            logger.error(e.getMessage());
            result.put("msg", "Exception");
        }

        return result;
    }


    @RequestMapping(value = "dealQuestion")
    @ResponseBody
    public JSONObject dealQuestion(@RequestParam(value = "qid") Long qid,
                                   @RequestParam(value = "answer") String answer){

        JSONObject result = new JSONObject();

        try {
            QuestionEntity question = questionService.findOne(qid);
            question.setDealStatus(true);
            question.setAnswer(answer);

            questionService.save(question);
            result.put("msg","success");
        }catch (Exception e){
            result.put("msg","Exception");
        }

        return result;

    }

    @RequestMapping(value = "delQuestion")
    @ResponseBody
    public JSONObject delQuestion(@RequestParam(value = "qid") Long qid){

        JSONObject result = new JSONObject();

        try {
            questionService.deleteByid(qid);
            result.put("msg","success");
        }catch (Exception e){
            result.put("msg","Exception");
        }

        return result;

    }

}
