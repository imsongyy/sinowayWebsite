package com.sinoway.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class HttpUtils {
	
	@SuppressWarnings("unused")
	private static final Log log = LogFactory.getLog(HttpUtils.class);
	
	@SuppressWarnings("deprecation")
	public static String sendPostMethod(String path,String encoding ){
		String result= "";
		try {
			HttpClient httpClient = new DefaultHttpClient();
			HttpPost httpPost = new HttpPost(path);
			@SuppressWarnings("unused")
			HttpResponse response = httpClient.execute(httpPost);
			if(response.getStatusLine().getStatusCode() == 200){
			    result = EntityUtils.toString(response.getEntity(),encoding);
			}
			log.info(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; 
	}
	
	@SuppressWarnings("deprecation")
	public static String sendPostMethod(String path,Map<String,Object> params,String encoding ) throws Exception{
		String result= "";
		try {
			HttpClient httpClient = new DefaultHttpClient();
			HttpPost httpPost = new HttpPost(path);
			List<BasicNameValuePair> list = new ArrayList<BasicNameValuePair>();
			if(params!=null&&!params.isEmpty()){
				for (Map.Entry<String, Object> entry : params.entrySet()) {
					String key = entry.getKey();
					String value = entry.getValue().toString();
					BasicNameValuePair valuePair = new BasicNameValuePair(key, value);
					list.add(valuePair);
				}
				UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(list,encoding);
				httpPost.setEntity(formEntity);
			}
			HttpResponse response = httpClient.execute(httpPost);
			if(response.getStatusLine().getStatusCode() == 200){
			    result = EntityUtils.toString(response.getEntity(),encoding);
			}else{
				throw new Exception(response.getStatusLine().getStatusCode()+"");
			}
			log.info(path);
		} catch (Exception e) {
			throw new Exception(e);
		}
		return result;
	}

	@SuppressWarnings("deprecation")
	public static String sendPostMethod(String path,String xml,String encoding ) throws Exception{
		String result= "";
		try {
			HttpClient httpClient = new DefaultHttpClient();
			HttpPost httpPost = new HttpPost(path);
			StringEntity myEntity = new StringEntity(xml,encoding); 
			httpPost.addHeader("Content-Type", "text/xml"); 
			httpPost.setEntity(myEntity); 
            HttpResponse response = httpClient.execute(httpPost); 
            if(response.getStatusLine().getStatusCode() == 200){
			    result = EntityUtils.toString(response.getEntity(),encoding);
			}
            log.info(path);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return result;
	}

	

	/**
	 * 获取远程IP
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
	      String ip = request.getHeader("x-forwarded-for");  
	      if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	         ip = request.getHeader("Proxy-Client-IP");  
	     }  
	      if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	         ip = request.getHeader("WL-Proxy-Client-IP");  
	      }  
	     if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	          ip = request.getRemoteAddr();  
	     }  	     
	     return ip;  
	} 
	
	public static boolean sendMessage(String content,String sign,String getUser){
		try {
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("cdkey", ConfigUtils.getValue("HX_SMS_CDKEY"));
			params.put("password", ConfigUtils.getValue("HD_SMS_PASSWORD"));
			params.put("message", sign+content);
			params.put("phone", getUser);
			String str = HttpUtils.sendPostMethod(ConfigUtils.getValue("HD_SMS_SERVICE_URL"), params, "UTF-8");
			String err = xmlAnalyze(str, "error");
			String message = xmlAnalyze(str, "message");
			if(!"0".equals(err)){
				log.error(message);
			}	
			if("127".equals(err)){
				return false;
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 解析XML
	 */
	public static String xmlAnalyze(String xml,String node){
		String value = "";
		Pattern p = Pattern.compile("<"+node+">(.*)</"+node+">");
		Matcher m = p.matcher(xml);
	    if(m.find()) value = m.group(1);
		return value;
	}
}
