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
public class RecordController {
	
	@Autowired
	private CstCustMstService cstCustMstService;
	
	@Autowired
	private CstCustRecordMstService cstCustRecordMstService;

	@RequestMapping(value="/record/custRecord.do")
	public ModelAndView record(HttpServletRequest request, HttpServletResponse response){
		
		CookieUtils cookieUtils = new CookieUtils();
		String custNo = cookieUtils.getCookie(request, CommonConstant.COOKIE_CUST_NO);
		
		ModelAndView mav = new ModelAndView("cust/confirmRegister");
		mav.addObject("cstCustMst", cstCustMstService.selectByPrimaryKey(new Integer(custNo)));
		mav.addObject("cstCustRecordMst", cstCustRecordMstService.selectByPrimaryKey(new Integer(custNo)));
		
		return new ModelAndView("record/custRecord");
	}
}
