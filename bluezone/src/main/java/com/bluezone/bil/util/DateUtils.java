package com.bluezone.bil.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtils {

	public static String curDate(String str){
		return addDate(str, 0);
	}
	
	public static String addDate(String str, int amount){
		SimpleDateFormat formatter = new SimpleDateFormat(str);
		Calendar cal = Calendar.getInstance();
		
		return formatter.format(cal.getTime());
	}
	
	public static Timestamp curTimestamp(){
		java.util.Date date = new java.util.Date();
		return new java.sql.Timestamp(date.getTime());
	}
	
	public static String curWeekOfMonth(){
		Calendar cal = Calendar.getInstance();
		
		return new Integer(cal.get(Calendar.WEEK_OF_MONTH)).toString();
	}

}
