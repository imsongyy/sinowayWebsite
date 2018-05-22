package com.sinoway.controller;

import com.sinoway.bean.ResponseMessage;
import com.sinoway.entity.DocumentEntity;
import com.sinoway.entity.DriverEntity;
import com.sinoway.entity.PeriodicalEntity;
import com.sinoway.service.DocumentService;
import com.sinoway.service.DriverService;
import com.sinoway.service.PeriodicalService;
import com.sinoway.utils.ImageUploadUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;

/**
 * Created by souyouyou on 2018/4/24.
 */
@Controller
@RequestMapping(value = "/")
public class FileManageController {

    Logger logger = Logger.getLogger(FileManageController.class);

    @Value("${filePath}")
    private String filePath;

    @Autowired
    private PeriodicalService periodicalService;

    @Autowired
    private DocumentService documentService;

    @Autowired
    private DriverService driverService;


    @RequestMapping(value = "periodicals")
    @ResponseBody
    public ResponseMessage periodicals(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize){

        ResponseMessage resMsg = new ResponseMessage();

        pageIndex = pageIndex - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(pageIndex, pageSize, sort);


        Page<PeriodicalEntity> datas = null;

        try {
            datas = periodicalService.findAll(pageable);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        resMsg.setMsg("success");
        final Page<PeriodicalEntity> finalDatas = datas;
        resMsg.setResult(new HashMap(){{
            put("result", finalDatas);
        }});

        return resMsg;

    }


    @RequestMapping(value = "documents")
    @ResponseBody
    public ResponseMessage documents(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                     @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize){

        ResponseMessage resMsg = new ResponseMessage();

        pageIndex = pageIndex - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(pageIndex, pageSize, sort);


        Page<DocumentEntity> datas = null;

        try {
            datas = documentService.findAll(pageable);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        final Page<DocumentEntity> finalDatas = datas;
        resMsg.setResult(new HashMap(){{
            put("result", finalDatas);
        }});

        return resMsg;

    }


    @RequestMapping(value = "drivers")
    @ResponseBody
    public ResponseMessage drivers(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                   @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize){

        ResponseMessage resMsg = new ResponseMessage();

        pageIndex = pageIndex - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(pageIndex, pageSize, sort);


        Page<DriverEntity> datas = null;

        try {
            datas = driverService.findAll(pageable);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        final Page<DriverEntity> finalDatas = datas;
        resMsg.setResult(new HashMap(){{
            put("result", finalDatas);
        }});

        return resMsg;

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
            response.setContentLength(length);
            response.setContentType(ImageUploadUtil.imageContentType.get(fileType));
//            response.setContentType("application/x-msdownload");
//            response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
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


}

