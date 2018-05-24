package com.sinoway.controller;

import com.sinoway.bean.User;
import com.sinoway.entity.DocumentEntity;
import com.sinoway.entity.DriverEntity;
import com.sinoway.entity.PeriodicalEntity;
import com.sinoway.service.DocumentService;
import com.sinoway.service.DriverService;
import com.sinoway.service.PeriodicalService;
import com.sinoway.utils.DateUtils;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by souyouyou on 2018/4/24.
 */
@Controller
@RequestMapping(value = "/")
public class FileManageController {

    Logger logger = Logger.getLogger(FileManageController.class);

    @Autowired
    private PeriodicalService periodicalService;

    @Autowired
    private DocumentService documentService;

    @Autowired
    private DriverService driverService;

    @Value("${filePath}")
    private String filePath;

    @RequestMapping(value = "periodical")
    public String periodical(){
        return "files/periodical";
    }


    @RequestMapping(value = "periodicalList")
    public String periodicals(){
        return "files/periodicalList";
    }

    @RequestMapping(value = "documentList")
    public String documentList(){
        return "files/documentList";
    }

    @RequestMapping(value = "driverList")
    public String driverList(){
        return "files/driverList";
    }


    @RequestMapping(value = "document")
    public String document(){
        return "files/document";
    }


    @RequestMapping(value = "driver")
    public String driver(){
        return "files/dirver";
    }

    @RequestMapping(value = "createPeriodical")
    @ResponseBody
    public JSONObject createPeriodical(PeriodicalEntity entity,
                                       @RequestParam(value = "file",required = false) MultipartFile file){

        JSONObject result = new JSONObject();

        SaveFile saveFile = saveFile(filePath, file);

        entity.setFileName(saveFile.getFileName());
        entity.setFilePath(saveFile.getFilePath());
        entity.setUploader(getUser().getUserName());
        entity.setUploadTime(DateUtils.getStrFormTime("yyyy-MM-dd HH:mm:ss",new Date()));

        periodicalService.save(entity);
        result.put("msg","success");


        return result;
    }

    @RequestMapping(value = "delPeriodical")
    @ResponseBody
    public JSONObject delPeriodical(@RequestParam(value = "id") Long id){

        JSONObject result = new JSONObject();

        try {

            periodicalService.deleteById(id);
            result.put("msg","success");

        }catch (Exception e){
            result.put("msg","Exception");
            logger.error(e.getMessage());
        }

        return result;

    }


    @RequestMapping(value = "delDocument")
    @ResponseBody
    public JSONObject delDocument(@RequestParam(value = "id") Long id){

        JSONObject result = new JSONObject();

        try {
            documentService.deleteById(id);
            result.put("msg","success");
        }catch (Exception e){
            result.put("msg","Exception");
            logger.error(e.getMessage());
        }

        return result;

    }

    @RequestMapping(value = "delDriver")
    @ResponseBody
    public JSONObject delDriver(@RequestParam(value = "id") Long id){

        JSONObject result = new JSONObject();

        try {
            driverService.deleteById(id);
            result.put("msg","success");
        }catch (Exception e){
            result.put("msg","Exception");
            logger.error(e.getMessage());
        }

        return result;

    }


    @RequestMapping(value = "createDocument")
    @ResponseBody
    public JSONObject createDocument(DocumentEntity entity,
                                       @RequestParam(value = "file",required = false) MultipartFile file){

        JSONObject result = new JSONObject();

        SaveFile saveFile = saveFile(filePath, file);

        entity.setUploadTime(DateUtils.getStrFormTime("yyyy-MM-dd HH:mm:ss",new Date()));
        entity.setFileName(saveFile.getFileName());
        entity.setFilePath(saveFile.getFilePath());
        entity.setUploader(getUser().getUserName());


        documentService.save(entity);
        result.put("msg","success");


        return result;
    }


    @RequestMapping(value = "createDriver")
    @ResponseBody
    public JSONObject createDriver(DriverEntity entity,
                                     @RequestParam(value = "file",required = false) MultipartFile file){

        JSONObject result = new JSONObject();

        SaveFile saveFile = saveFile(filePath, file);

        entity.setUploadTime(DateUtils.getStrFormTime("yyyy-MM-dd HH:mm:ss",new Date()));
        entity.setUploader(getUser().getUserName());
        entity.setFileName(saveFile.getFileName());
        entity.setFilePath(saveFile.getFilePath());


        driverService.save(entity);
        result.put("msg","success");


        return result;
    }


    @RequestMapping(value = "periodicals")
    @ResponseBody
    public JSONObject periodicals(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                                  @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        JSONObject result = new JSONObject();

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);


        Page<PeriodicalEntity> datas = null;

        try {
            datas = periodicalService.findAll(pageable);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        result.put("result",datas);
        result.put("msg","success");

        return result;

    }


    @RequestMapping(value = "documents")
    @ResponseBody
    public JSONObject documents(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                                  @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        JSONObject result = new JSONObject();

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);


        Page<DocumentEntity> datas = null;

        try {
            datas = documentService.findAll(pageable);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        result.put("result",datas);
        result.put("msg","success");

        return result;

    }


    @RequestMapping(value = "drivers")
    @ResponseBody
    public JSONObject drivers(@RequestParam(value = "pageIndex", defaultValue = "0") Integer page,
                                @RequestParam(value = "pageSize", defaultValue = "10") Integer size){

        JSONObject result = new JSONObject();

        page = page - 1;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = new PageRequest(page, size, sort);


        Page<DriverEntity> datas = null;

        try {
            datas = driverService.findAll(pageable);
        }catch (Exception e){
            logger.error(e.getMessage());
        }

        result.put("result",datas);
        result.put("msg","success");

        return result;

    }


    protected SaveFile saveFile(String filePath,MultipartFile file){

        SaveFile saveFile = new SaveFile();
        String fileName = System.currentTimeMillis() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")).toLowerCase();

        String uploadPath = filePath + "/" + fileName;

        saveFile.setFileName(fileName);
        saveFile.setFilePath(uploadPath);

        File uploadFile = new File(uploadPath);
        try {
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return saveFile;


    }


    protected User getUser(){
        Subject subject = SecurityUtils.getSubject();
        return (User) subject.getPrincipal();
    }


}

class SaveFile{
    private String fileName;
    private String filePath;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
