package com.sinoway.controller;

import com.sinoway.bean.ResponseMessage;
import com.sinoway.entity.CustomerEntity;
import com.sinoway.entity.InformationEntity;
import com.sinoway.entity.OrganizationEntity;
import com.sinoway.entity.PlatformQryEntity;
import com.sinoway.service.CustomerService;
import com.sinoway.service.InformationService;
import com.sinoway.service.OrganizationService;
import com.sinoway.service.PlatformQryService;
import com.sinoway.utils.EmailUtils;
import com.sinoway.utils.HttpUtils;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by souyouyou on 2018/4/21.
 */
@Controller
@RequestMapping(value = "/")
public class CispManageController {

    private static final Logger logger = Logger.getLogger(CispManageController.class);

    @Autowired
    private CustomerService customerService;

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private PlatformQryService platformQryService;

    @RequestMapping(value = "cisp/members")
    public String cispMembers(){
        return "cisp/members";
    }


    @RequestMapping(value = "/cispMembers")
    @ResponseBody
    public JSONObject cispMembers(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                            @RequestParam(value = "pageSize", defaultValue = "10") Integer size){


        JSONObject result = new JSONObject();
        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);


        Page<CustomerEntity> datas = null;
        try {
            datas = customerService.findAll(pageable);
            result.put("msg","success");
        }catch (Exception e){
            logger.error("资讯列表数据:"+e.getMessage());
            result.put("msg","Exception");
        }

        result.put("result",datas);

        return result;
    }

    @RequestMapping(value = "activePre")
    @ResponseBody
    public JSONObject activePre(@RequestParam(value = "uid") Long uid){
        JSONObject result = new JSONObject();

        CustomerEntity customer = customerService.findById(uid);
        //发送激活邮件
        EmailUtils.sendAccountActivateEmail(customer);
        HttpUtils.sendMessage("您注册的账号审核已通过,请登录预留邮箱进行账户激活!", "【北京华道征信有限公司】", customer.getContactsNumber());
        result.put("msg","success");

        return result;
    }


    @RequestMapping(value = "cisp/memberDetail")
    public ModelAndView memberDetail(@RequestParam(value = "uid") Long uid){

        CustomerEntity customer = customerService.findById(uid);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cisp/memberDetail");
        mav.addObject("customer",customer);

        return mav;

    }

    @RequestMapping(value = "allocation")
    @ResponseBody
    public ResponseMessage allocation(@RequestParam(value = "uid") Long uid,
                                      @RequestParam(value = "username") String username,
                                      @RequestParam(value = "password") String password){
        ResponseMessage resMsg = new ResponseMessage();

        try {
            CustomerEntity customerEntity = customerService.findById(uid);

            if (null == customerEntity){
                resMsg.setMsg("用户编号错误");
            }else {
                customerEntity.setUsername(username);
                customerEntity.setPassword(password);

                customerService.save(customerEntity);
                resMsg.setMsg("success");
            }

        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg("Exception");
        }

        return resMsg;


    }

    @RequestMapping(value = "saveCustomer")
    @ResponseBody
    public JSONObject saveCustomer(CustomerEntity customerEntity){

        JSONObject result = new JSONObject();

        CustomerEntity oldCustomer = customerService.findById(customerEntity.getId());

        String contacts = oldCustomer.getContacts();
        Long newId = oldCustomer.getNewId();

        //审核拒绝
        if (null != customerEntity.getAuditStatus() && customerEntity.getAuditStatus() == 2){
            customerService.deleteById(newId);

            oldCustomer.setAuditStatus(0);
            oldCustomer.setNewId(null);
            customerService.save(oldCustomer);

        }else if (null != customerEntity.getAuditStatus() && customerEntity.getAuditStatus() == 1){
            //作废老记录
            oldCustomer.setAuditStatus(customerEntity.getAuditStatus());
            oldCustomer.setActivated(false);
            oldCustomer.setDeleted(true);
            customerService.save(oldCustomer);

            //修改新纪录
            CustomerEntity newCustomer = customerService.findById(newId);
            newCustomer.setActivated(true);
            newCustomer.setAuditStatus(0);
            newCustomer.setDeleted(false);

            customerService.save(newCustomer);
        }else {
            BeanUtils.copyProperties(customerEntity,oldCustomer);
            oldCustomer.setContacts(contacts);
            oldCustomer.setActivated(true);
            oldCustomer.setDeleted(false);
            oldCustomer.setAuditStatus(0);

            customerService.save(oldCustomer);
        }

        result.put("msg","success");
        return result;

    }



    @RequestMapping(value = "cisp/org")
    public String cispOrg(){
        return "cisp/orgStatistics";
    }


    @RequestMapping(value = "cisp/qry")
    public String cispQry(){
        return "cisp/qryStatistics";
    }

    @RequestMapping(value = "enteringOrgStatistics")
    @ResponseBody
    public ResponseMessage enteringOrgStatistics(OrganizationEntity entity){

        ResponseMessage resMsg = new ResponseMessage();

        try{
            organizationService.save(entity);
            resMsg.setMsg("success");
        }catch (Exception e){
            resMsg.setMsg("Exception");
            logger.error(e.getMessage());
        }

        return resMsg;

    }


    @RequestMapping(value = "orgStatistics")
    @ResponseBody
    public JSONObject orgStatistics(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                                         @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        JSONObject resMsg = new JSONObject();

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);

        Page<OrganizationEntity> organizationEntities = null;

        try{
            organizationEntities = organizationService.findAll(pageable);
            resMsg.put("msg","success");
            resMsg.put("result",organizationEntities);
        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.put("msg","Exception");
        }

        return resMsg;


    }



    @RequestMapping(value = "enteringQryStatistics")
    @ResponseBody
    public ResponseMessage enteringQryStatistics(PlatformQryEntity entity){

        ResponseMessage resMsg = new ResponseMessage();

        try{
            platformQryService.save(entity);
            resMsg.setMsg("success");
        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg("Exception");
        }

        return resMsg;

    }


    @RequestMapping(value = "qryStatistics")
    @ResponseBody
    public JSONObject qryStatistics(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                                    @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        JSONObject resObj = new JSONObject();

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);

        Page<PlatformQryEntity> platformQryEntities = null;

        try{
            platformQryEntities = platformQryService.findAll(pageable);
            resObj.put("result",platformQryEntities);
            resObj.put("msg","success");
        }catch (Exception e){
            logger.error(e.getMessage());
            resObj.put("msg","Exception");
        }

        return resObj;

    }


    @RequestMapping(value = "qryDelete")
    @ResponseBody
    public ResponseMessage qryDelete(@RequestParam(value = "id") Long id){

        ResponseMessage resMsg = new ResponseMessage();

        try {
            platformQryService.delete(id);
            resMsg.setMsg("success");
        }catch (Exception e){
            resMsg.setMsg("Exception");
            logger.error(e.getMessage());
        }

        return resMsg;

    }



    @RequestMapping(value = "orgDelete")
    @ResponseBody
    public ResponseMessage orgDelete(@RequestParam(value = "id") Long id){

        ResponseMessage resMsg = new ResponseMessage();

        try {
            organizationService.delete(id);
            resMsg.setMsg("success");
        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg("Exception");
        }

        return resMsg;

    }

}
