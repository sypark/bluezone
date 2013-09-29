package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.service.cust.CstCustMstService;
import com.bluezone.bil.service.cust.CstCustRecordMstService;
import com.bluezone.bil.util.cookie.CookieUtils;

@Controller
public class MainController {
	
	@Autowired
	private CstCustMstService cstCustMstService;
	
	@Autowired
	private CstCustRecordMstService cstCustRecordMstService;
	
	@RequestMapping(value="/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response){
		
		CookieUtils cookieUtils = new CookieUtils();
		String custNo = cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO);
		
		System.out.println("custNo;"+custNo);
		
		ModelAndView mav = new ModelAndView();
		if(custNo != null && !"".equals(custNo)){
			mav.setViewName("main");
			mav.addObject("cstCustMst", cstCustMstService.selectByPrimaryKey(new Integer(custNo)));
			mav.addObject("cstCustRecordMst", cstCustRecordMstService.selectByPrimaryKey(new Integer(custNo)));
		}else{
			mav.setViewName("no_main");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		
			// 쿠키값 생성
		CookieUtils cookieUtils = new CookieUtils();
		cookieUtils.removeCookie(request, response);
		
		return new ModelAndView("redirect:/main.do");
	}
}
