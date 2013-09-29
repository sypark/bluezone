package com.bluezone.bil.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static String curDate(String str){
		SimpleDateFormat formatter = new SimpleDateFormat(str);
		Date today = new Date();
		
		return formatter.format(today);
	}
}
