package com.sinoway.utils;

import java.util.ResourceBundle;

public class ConfigUtils {

	private static final ResourceBundle baseBundle = ResourceBundle.getBundle("application");
	
	public static String getValue(String key) {
		return baseBundle.getString(key).trim();
	}

	public static String getValueByBusType(String busType,String key){
		return ResourceBundle.getBundle("parameters").getString(busType+"_"+key).trim();
	}

}
