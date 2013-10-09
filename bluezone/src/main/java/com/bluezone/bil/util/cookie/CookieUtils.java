package com.bluezone.bil.util.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.domain.cust.CstCustMst;

public class CookieUtils {
	
	public void createCookie(HttpServletRequest request, HttpServletResponse response, CstCustMst cstCustMst){
		
		Cookie cookie = new Cookie(CommonConstant.COOKIE_CUST_NO, cstCustMst.getCustNo().toString());
//		cookie.setMaxAge(60*60*24);				// 쿠키 유지 기간(이부분이 없으면 브라우저 종료시 사라짐)
	    cookie.setPath("/");								// 모든 경로에서 접근 가능하도록 
//	    cookie.setDomain("localhost");				// 이부분을 적용하면 서브 도메인간 공유 가능. 지정안하면 localhost에서도 적용됨.
	    response.addCookie(cookie);					// 쿠키저장
	    
	    Cookie cookie1 = new Cookie(CommonConstant.COOKIE_LOGIN, "Y");
//	    cookie1.setMaxAge(60*60*24);				// 쿠키 유지 기간(이부분이 없으면 브라우저 종료시 사라짐)
	    cookie1.setPath("/");							// 모든 경로에서 접근 가능하도록 
//	    cookie1.setDomain("localhost");				// 이부분을 적용하면 서브 도메인간 공유 가능. 지정안하면 localhost에서도 적용됨.
	    response.addCookie(cookie1);					// 쿠키저장
	    
	    Cookie cookie2 = new Cookie(CommonConstant.COOKIE_CUST_LEVEL, cstCustMst.getCustLevel().toString());
//	    cookie1.setMaxAge(60*60*24);				// 쿠키 유지 기간(이부분이 없으면 브라우저 종료시 사라짐)
	    cookie2.setPath("/");							// 모든 경로에서 접근 가능하도록 
//	    cookie1.setDomain("localhost");				// 이부분을 적용하면 서브 도메인간 공유 가능. 지정안하면 localhost에서도 적용됨.
	    response.addCookie(cookie2);					// 쿠키저장
	}
	
	public String getCookie(HttpServletRequest request, String key){
		String value = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if(key.equals(cookie.getName())){
		        	value = cookie.getValue();
		        	break;
		        }
		    }
		}
		
		return value;
	}
	
	public void removeCookie(HttpServletRequest request, HttpServletResponse response){
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		    	cookie.setMaxAge(0);				//쿠키 유지기간을 0으로함
		    	cookie.setPath("/");					//쿠키 접근 경로 지정
				response.addCookie(cookie);		//쿠키저장
		    }
		}
	}
}
