package com.sinoway.controller;

import com.sinoway.entity.InformationEntity;
import com.sinoway.entity.OrganizationEntity;
import com.sinoway.entity.PlatformQryEntity;
import com.sinoway.service.InformationService;
import com.sinoway.service.OrganizationService;
import com.sinoway.service.PlatformQryService;
import net.sf.json.JSONObject;
import org.apache.commons.collections.IteratorUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.Iterator;
import java.util.List;
import java.util.ListResourceBundle;


/**
 * Created by souyouyou on 2018/4/9.
 */

@Controller
@RequestMapping(value = "/")
public class InformationController {

    Logger logger = Logger.getLogger(InformationController.class);

    @Autowired
    private InformationService informationService;

    @Autowired
    private PlatformQryService platformQryService;

    @Autowired
    private OrganizationService organizationService;



    @RequestMapping(value = "getInformation")
    public ModelAndView getInformationByType(@RequestParam(value = "flag") Boolean flag){

        Sort sort = new Sort(Sort.Direction.DESC, "id");

        Pageable pageable = new PageRequest(0, 1, sort);
        List<InformationEntity> result;

        if (flag){
            result = informationService.findAll();
        }else {
            result = informationService.findAll(pageable).getContent();
        }


        ModelAndView mav = new ModelAndView(new MappingJackson2JsonView());

        mav.addObject("msg","success");
        mav.addObject("result",result);

        return mav;
    }


    @RequestMapping(value = "qrySituation")
    @ResponseBody
    public JSONObject qrySituation(){
        JSONObject result = new JSONObject();

        try {
            Iterator<PlatformQryEntity> entities = platformQryService.findAll();
            List list = IteratorUtils.toList(entities);
            result.put("msg","success");
            result.put("data",list);
        }catch (Exception e){
            logger.error(e.getMessage());
            result.put("msg","Exception");
        }

        return result;

    }


    @RequestMapping(value = "memberAgency")
    @ResponseBody
    public JSONObject memberAgency(){
        JSONObject result = new JSONObject();

        try {
            Iterator<OrganizationEntity> entities = organizationService.findAll();
            List list = IteratorUtils.toList(entities);
            result.put("msg","success");
            result.put("data",list);
        }catch (Exception e){
            logger.error(e.getMessage());
            result.put("msg","Exception");
        }

        return result;
    }





}
