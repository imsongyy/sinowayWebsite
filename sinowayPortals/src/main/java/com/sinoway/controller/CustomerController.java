package com.sinoway.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.sinoway.bean.ResponseMessage;
import com.sinoway.entity.CustomerEntity;
import com.sinoway.service.CustomerService;
import com.sinoway.utils.EmailUtils;
import com.sinoway.utils.GenerateLinkUtils;
import com.sinoway.utils.HttpUtils;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;


/**
 * Created by souyouyou on 2018/4/20.
 */
@Controller
@RequestMapping(value = "/")
public class CustomerController {

    Logger logger = Logger.getLogger(CustomerController.class);

    private ResponseMessage resMsg;

    @Autowired
    DefaultKaptcha defaultKaptcha;

    @Autowired
    private CustomerService customerService;


    @RequestMapping("/cispRegister")
    @ResponseBody
    public ResponseMessage register(HttpServletRequest request,
                                    @RequestParam(value = "email") String email,
                                    @RequestParam(value = "orgFullname") String orgFullname,
                                    @RequestParam(value = "primaryBusiness") String primaryBusiness,
                                    @RequestParam(value = "siteAddr") String siteAddr,
                                    @RequestParam(value = "contacts") String contacts,
                                    @RequestParam(value = "contactsNumber") String contactsNumber,
                                    @RequestParam(value = "msgCode") String msgCode ){

        resMsg = new ResponseMessage();

        //获取session中的验证码
//        String messageCode = (String) request.getSession().getAttribute("msgCode");
        String messageCode = "123456";

        try {
            if (null == messageCode || !msgCode.equals(messageCode)) {
                resMsg.setMsg("验证码错误");
            } else {
                CustomerEntity customer = new CustomerEntity();
                customer.setOrgFullname(orgFullname);
                customer.setEmail(email);
                customer.setPrimaryBusiness(primaryBusiness);
                customer.setSiteAddr(siteAddr);
                customer.setContacts(contacts);
                customer.setContactsNumber(contactsNumber);
                customer.setActivated(false);
                customer.setAuditStatus(0);
                customer.setDeleted(false);
                customerService.save(customer);

                resMsg.setMsg("success");

            }

        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg("CISP会员注册、服务异常");
        }

        return resMsg;
    }



    @RequestMapping("/generateKaptcha")
    public void generateKaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception{
        byte[] captchaChallengeAsJpeg;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            //生产验证码字符串并保存到session中
            String createText = defaultKaptcha.createText();
            request.getSession().setAttribute("verifyCode", createText);
            //使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        //定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream = response.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }


    @RequestMapping("/signIn")
    @ResponseBody
    public ResponseMessage sign_in(HttpServletRequest request,
                                   @RequestParam(value = "username") String username,
                                   @RequestParam(value = "password") String password,
                                   @RequestParam(value = "verifyCode") String verifyCode){

        resMsg = new ResponseMessage();

        String captchaId = (String) request.getSession().getAttribute("verifyCode");
        if (null == captchaId || !captchaId.equals(verifyCode)){
            resMsg.setMsg("验证码验证失败");
        }

        Subject currentUser = SecurityUtils.getSubject();

        // 将用户名及密码封装到UsernamePasswordToken
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        try {
            currentUser.login(token);
            resMsg.setMsg("success");
        }catch (UnknownAccountException e){
            resMsg.setMsg("账户不存在");
        }catch (IncorrectCredentialsException e){
            resMsg.setMsg("账户密码错误!");
        }catch (DisabledAccountException e){
            resMsg.setMsg("账户状态异常!");
        }catch (AuthenticationException e){
            resMsg.setMsg("用户名或密码错误");
        }


        return resMsg;
    }

    @RequestMapping(value = "sign_out")
    public ModelAndView sign_out(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");

        Subject subject = SecurityUtils.getSubject();
        subject.logout();

        return modelAndView;
    }


    @RequestMapping("sendMessage")
    @ResponseBody
    public ResponseMessage sendMessage(@RequestParam(value = "mobile") String mobile,
                                       HttpServletRequest request){
        resMsg = new ResponseMessage();
        String msgCode = "123456";
        request.getSession().setAttribute("msgCode", msgCode);
        final boolean status = HttpUtils.sendMessage("验证码为:" + msgCode, "【北京华道征信有限公司】", mobile);
        resMsg.setResult(new HashMap(){{
            put("status",status);
        }});

        return resMsg;

    }


    @RequestMapping("customerDetail")
    @ResponseBody
    public JSONObject customerDetail(@RequestParam(value = "uid") Long uid){

        JSONObject result = new JSONObject();
        try {
            CustomerEntity customerEntity = customerService.findById(uid);

            if (null == customerEntity){
                result.put("msg","用户编号不存在");
                return result;
            }

            result.put("msg","success");
            result.put("customer",customerEntity);

        }catch (Exception e){
            logger.error(e.getMessage());
            result.put("msg","Exception");

        }

        return result;
    }

    @RequestMapping(value = "customerChangeApply")
    @ResponseBody
    public JSONObject customerChangeApply(CustomerEntity entity){

        JSONObject result = new JSONObject();

        if (null != entity && entity.getId() != null){

            try {

                CustomerEntity oldCustomer = customerService.findById(entity.getId());

                if (oldCustomer.getAuditStatus() == 3){
                    result.put("msg","信息变更申请正在审核中,请勿重复提交!");
                    return result;
                }
                entity.setId(null);
                entity.setActivated(false);
                entity.setUsername(oldCustomer.getUsername());
                entity.setPassword(oldCustomer.getPassword());
                // 保存修改数据新纪录并将ID存储到原记录中
                CustomerEntity newCustomer = customerService.save(entity);


                oldCustomer.setNewId(newCustomer.getId());
                oldCustomer.setAuditStatus(3);

                customerService.save(oldCustomer);
                result.put("msg","success");

            }catch (Exception e){
                logger.error(e.getMessage());
                result.put("msg","Exception");
            }
        }

        return result;
    }



    @RequestMapping("/setPassword")
    public JSONObject setPassword(@RequestParam(value = "uid") Long id,
                                  @RequestParam(value = "checkCode") String checkCode,
                                  @RequestParam(value = "password") String password) {

        JSONObject result = new JSONObject();

        CustomerEntity customer = customerService.findById(id);

        if(GenerateLinkUtils.verifyCheckcode(customer,checkCode)) {
            customer.setActivated(true);
            customer.setPassword(password);
            customerService.save(customer);
            result.put("msg","链接失效");
        }else {
            result.put("msg","链接失效");
        }

        return new JSONObject();
    }

//    @RequestMapping("/activate")
//    public void activate(Long id,String checkCode,HttpServletResponse response) {
//
//        //根据用户id查找用户
//        CustomerEntity customer = customerService.findById(id);
//        //验证无误，状态更改为1，即激活
//        if(GenerateLinkUtils.verifyCheckcode(customer,checkCode)) {
//
//            customer.setActivated(true);
//            customerService.save(customer);
//            try {
//                response.setContentType("text/html;charset=utf-8");
//                response.getWriter().write("恭喜，激活成功！");
//            } catch (IOException e) {
//                e.printStackTrace();
//                logger.error("激活失败,"+e.getMessage());
//            }
//        }
//    }


    @RequestMapping(value = "inforChange")
    public ModelAndView inforChange(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("inforChange");
        modelAndView.addObject("customer",getUser());

        return modelAndView;
    }

    protected CustomerEntity getUser(){
        Subject subject = SecurityUtils.getSubject();
        return (CustomerEntity) subject.getPrincipal();
    }


}
