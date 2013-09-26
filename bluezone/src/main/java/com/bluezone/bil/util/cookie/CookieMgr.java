package com.bluezone.bil.util.cookie;

import javax.servlet.http.HttpServletRequest;

import com.bluezone.bil.constant.CommonConstant;

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
}
