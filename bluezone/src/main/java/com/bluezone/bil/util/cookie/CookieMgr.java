package com.bluezone.bil.util.cookie;

import javax.servlet.http.HttpServletRequest;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.util.StringUtils;

public class CookieMgr {

	private static CookieUtils cookieUtils;
	static{
		cookieUtils = new CookieUtils();
	}
	
	public static boolean isLogin(HttpServletRequest request){
		if(cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO) != null 
				&& !"".equals(cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO))
				&& !"0".equals(cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO))){
			return true;
		}else{
			return false;
		}
	}
	
	public static int getCustNo(HttpServletRequest request){
		if(cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO) != null ){
			return StringUtils.getInt(cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO));
		}else{
			return 0;
		}
	}
}
