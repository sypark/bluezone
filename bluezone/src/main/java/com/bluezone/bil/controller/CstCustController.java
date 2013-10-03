package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.domain.cust.CstCustMst;
import com.bluezone.bil.domain.cust.CstCustRecordMst;
import com.bluezone.bil.service.cust.CstCustMstService;
import com.bluezone.bil.service.cust.CstCustRecordMstService;
import com.bluezone.bil.util.DateUtils;
import com.bluezone.bil.util.cookie.CookieUtils;

@Controller
public class CstCustController {
	
	@Autowired
	private CstCustMstService cstCustMstService;
	
	@Autowired
	private CstCustRecordMstService cstCustRecordMstService;

	
	@RequestMapping(value="/cust/insForm.do")
	public ModelAndView insForm(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("cust/insForm");
	}
	
	@RequestMapping(value="/cust/ajaxInsert.do", method = RequestMethod.POST)
	public @ResponseBody Integer insertProcess(@ModelAttribute CstCustMst cstCustMst,
			@RequestParam("score") Integer score,
			HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("score:"+score);
		System.out.println("cstCustMst:"+cstCustMst.getCustNm());
		
		// CstCustMst setting
		cstCustMst.setRegrId(CommonConstant.SYSTEM_ID);
		cstCustMst.setRegDtm(DateUtils.curTimestamp());
		cstCustMst.setUpdrId(CommonConstant.SYSTEM_ID);
		cstCustMst.setUpdDtm(DateUtils.curTimestamp());
		cstCustMst.setUseYn("Y");
		
		// CstCustRecordMst setting
		CstCustRecordMst cstCustRecordMst = new CstCustRecordMst();
		cstCustRecordMst.setScore(score);
		cstCustRecordMst.setScoreAvg(new Float(score).floatValue());
		cstCustRecordMst.setRegrId(CommonConstant.SYSTEM_ID);
		cstCustRecordMst.setRegDtm(DateUtils.curTimestamp());
		cstCustRecordMst.setUpdrId(CommonConstant.SYSTEM_ID);
		cstCustRecordMst.setUpdDtm(DateUtils.curTimestamp());
		
		int custNo = 0;
		try{
			custNo = cstCustMstService.insertCstCustMst(cstCustMst, cstCustRecordMst);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("insertProcess Error:"+e.getMessage());
			custNo = 0;
		}
		
		return custNo;
	}
	
	@RequestMapping(value="/cust/confirmRegister.do")
	public ModelAndView insForm(@RequestParam("custNo") Integer custNo,
			HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("cust/confirmRegister");
		mav.addObject("cstCustMst", cstCustMstService.selectByPrimaryKey(custNo));
		mav.addObject("cstCustRecordMst", cstCustRecordMstService.selectByPrimaryKey(custNo));
		
		return mav;
	}
	
	@RequestMapping(value="/cust/ajaxDupChkNickName.do")
	public @ResponseBody String ajaxDupChkNickName(@RequestParam("nickName") String nickName,
			HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("nickName:"+nickName);
		
		CstCustMst cstCustMst = new CstCustMst();
		cstCustMst.setNickName(nickName);
		
		cstCustMst = cstCustMstService.dupChkNickName(cstCustMst);
		
		return (cstCustMst == null ? "1":"0");
	}
	
	@RequestMapping(value="/cust/ajaxDupChkEmail.do")
	public @ResponseBody String ajaxDupChkEmail(@RequestParam("email") String email,
			HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("email:"+email);
		
		CstCustMst cstCustMst = new CstCustMst();
		cstCustMst.setEmail(email);
		
		cstCustMst = cstCustMstService.dupChkEmail(cstCustMst);
		
		return (cstCustMst == null ? "1":"0");
	}
	
	@RequestMapping(value="/cust/ajaxLoginProcess.do")
	public @ResponseBody String ajaxLoginProcess(@RequestParam("email") String email,
			@RequestParam("passwd") String passwd,
			HttpServletRequest request, HttpServletResponse response){
		
		CstCustMst cstCustMst = new CstCustMst();
		cstCustMst.setEmail(email);
		cstCustMst.setPasswd(passwd);
		cstCustMst.setUseYn("Y");
		
		Integer custNo = cstCustMstService.loginChk(cstCustMst);
		
		if(custNo.intValue() > 0){
			// 쿠키값 생성
			CookieUtils cookieUtils = new CookieUtils();
			cookieUtils.createCookie(request, response, custNo);
		}
		
		return (custNo > 0 ? "1":"0");
	}
	
	
}
