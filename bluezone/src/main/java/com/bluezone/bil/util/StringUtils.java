package com.bluezone.bil.util;

public class StringUtils {

	public static String getString(String str){
		if(str == null)
			return "";
		else
			return str.trim();
	}
	
	public static long getLong(String str){
		if(str == null)
			return 0;
		else
			return new Long(str).longValue();
	}
	
	public static long getLong(Long a){
		if(a == null)
			return 0;
		else
			return a.longValue();
	}
	
	public static int getInt(Integer a){
		if(a == null)
			return 0;
		else
			return a.intValue();
	}
	
	public static int getInt(String str){
		if(str == null || "".equals(str.trim()))
			return 0;
		else
			return new Integer(str).intValue();
	}
	
	public static float getFloat(String str){
		if(str == null || "".equals(str))
			return 0.0f;
		else
			return new Float(str).floatValue();
	}
	
	public static float getFloat(Float f){
		if(f == null)
			return 0.0f;
		else
			return new Float(f).floatValue();
	}
	
	public static String getDateYYYYMMDD(String date, String delim){
		if(date == null || "".equals(date) || date.length() < 8)
			return date;
		return date.substring(0,4) + delim + date.substring(4,6) + delim + date.substring(6,8);
	}
	
}
