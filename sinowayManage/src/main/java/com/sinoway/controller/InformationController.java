package com.sinoway.controller;

import com.sinoway.bean.ResponseMessage;
import com.sinoway.bean.User;
import com.sinoway.entity.InformationEntity;
import com.sinoway.service.InformationService;
import com.sinoway.utils.ImageUploadUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

/**
 * Created by souyouyou on 2018/4/9.
 */

@Controller
@RequestMapping(value = "/")
public class InformationController {

    Logger logger = Logger.getLogger(InformationController.class);



    private String msg;
    private static String SUCCESS = "success";

    @Value("${filePath}")
    private String filePath;
//    private String filePath = "/soft/tomcat8/images";

    @Autowired
    private InformationService informationService;

    @RequestMapping(value = "createInformation")
    public ModelAndView create(@RequestParam(value = "bgPic",required = false) MultipartFile file,
                               InformationEntity informationEntity,
                               HttpServletRequest request) {

        ModelAndView mav = new ModelAndView("info/information");


        if (null == informationEntity.getId() && null == informationEntity.getTitle()) {
            return mav;
        } else {

            String serverImgUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "" + request.getContextPath() + "/getFile?fileName=";

            String fileName = System.currentTimeMillis() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")).toLowerCase();

            String uploadPath = filePath + "/" + fileName;

            if (null != file){
                File uploadFile = new File(uploadPath);
                try {
                    file.transferTo(uploadFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            informationEntity.setBgPath(serverImgUrl+fileName);
            informationEntity.setCreatorId(getUser().getId());
            informationEntity.setCreatorName(getUser().getUserName());
            informationEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
            informationService.save(informationEntity);

            mav = new ModelAndView(new MappingJackson2JsonView());
            mav.addObject("msg", "success");
            return mav;
        }
    }

    @RequestMapping(value = "getInformationByType")
    public ModelAndView getInformationByType(@RequestParam(value = "pageIndex", defaultValue = "1") Integer page,
                                             @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");

        Pageable pageable = new PageRequest(page, size, sort);
        Page<InformationEntity> result = informationService.findAll(pageable);
        ModelAndView mav = new ModelAndView(new MappingJackson2JsonView());

        mav.addObject("msg","success");
        mav.addObject("result",result);

        return mav;
    }


    /**
     * 上传编辑图片
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/uploadImage")
    @ResponseBody
    public void uploadImage(HttpServletRequest request, HttpServletResponse response) {
        try {

            //TODO 修改为参数配置

            String serverImgUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "" + request.getContextPath() + "/getFile";
            try {
                ImageUploadUtil.ckeditor(request, response, filePath, serverImgUrl);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            logger.error("上传粘贴图片:"+e.getMessage());
        }
    }


    /**
     * 获取文件
     * @param fileName
     * @param response
     */
    @RequestMapping(value = "/getFile")
    public void getFile(@RequestParam(value = "fileName") String fileName,
                        HttpServletResponse response) {
        File file = new File(filePath+"/"+fileName);
        String fileType = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

        //判断文件是否存在如果不存在就返回默认图标
//        if(!(file.exists() && file.canRead())) {
//            file = new File(request.getSession().getServletContext().getRealPath("/")
//                    + "resource/icons/auth/root.png");
//        }

        try {
            FileInputStream inputStream = new FileInputStream(file);
            int length = inputStream.available();
            byte data[] = new byte[length];
//            response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            response.setContentLength(length);
            response.setContentType(ImageUploadUtil.imageContentType.get(fileType));
            inputStream.read(data);
            OutputStream out = response.getOutputStream();
            out.write(data);
            out.flush();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    /**
     * 资讯列表
     * @return
     */
    @RequestMapping(value = "info/list")
    public String infoList(){
        return "info/list";
    }

    /**
     * 资讯列表数据
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/infos")
    @ResponseBody
    public JSONObject infos(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                            @RequestParam(value = "pageSize", defaultValue = "10") Integer size){


        JSONObject result = new JSONObject();
        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);


        Page<InformationEntity> datas = null;
        try {
            datas = informationService.findAll(pageable);
            msg = SUCCESS;
        }catch (Exception e){
            logger.error("资讯列表数据:"+e.getMessage());
            msg = "Exception";
        }

        result.put("msg","success");
        result.put("result",datas);

        return result;
    }

    @RequestMapping(value = "/deleteInfo")
    @ResponseBody
    public ResponseMessage deleteInfo(@RequestParam(value = "id") Long id){

        ResponseMessage resMsg = new ResponseMessage();

        try {
            informationService.deleteById(id);

            resMsg.setMsg("success");
        }catch (Exception e){
            logger.error(e.getMessage());
            resMsg.setMsg(e.getMessage());
        }

        return resMsg;

    }


    protected User getUser(){
        Subject subject = SecurityUtils.getSubject();
        return (User) subject.getPrincipal();
    }
}
