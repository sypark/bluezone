package com.bluezone.bil.constant;

public class CommonConstant {

	public final static String SYSTEM_ID="system";
	public final static String COOKIE_CUST_NO="custno";
	public final static String COOKIE_LOGIN="login";
	public final static String COOKIE_CUST_LEVEL="custlevel";
	
	public final static String DATE_FORMAT_YYYYMMDD="yyyyMMdd";
	
	public final static String GAME_STATUS_CREATE = "C";
	public final static String GAME_STATUS_START = "S";
	public final static String GAME_STATUS_END = "E";
	public final static String GAME_STATUS_DELETE = "D";
	
	public final static int CUST_GRADE_MASTER = 1;
	public final static int CUST_GRADE_STAFF = 2;
	public final static int CUST_GRADE_NORMAL = 3;
	
	public final static String MATCH_TYPE_REGULAR = "1";
	public final static String MATCH_TYPE_SPOT = "2";
	
	public static enum CUST_SEX {M, F;}
	public static enum GAME_RSLT {win, lose, draw;}
	
}
