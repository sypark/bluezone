package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.service.cust.CstCustMstService;
import com.bluezone.bil.service.cust.CstCustRecordMstService;
import com.bluezone.bil.service.game.GameRecordService;
import com.bluezone.bil.util.cookie.CookieMgr;
import com.bluezone.bil.util.cookie.CookieUtils;

@Controller
public class MainController {
	
	@Autowired
	private CstCustMstService cstCustMstService;
	
	@Autowired
	private CstCustRecordMstService cstCustRecordMstService;
	
	@Autowired
	private GameRecordService gameRecordService;
	
	@RequestMapping(value="/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response){
		
		int custNo = CookieMgr.getCustNo(request);
		
		System.out.println("custNo;"+custNo);
		
		ModelAndView mav = new ModelAndView();
		if(custNo > 0){
			mav.setViewName("main");
			mav.addObject("cstCustMst", cstCustMstService.selectByPrimaryKey(new Integer(custNo)));
			mav.addObject("cstCustRecordMst", cstCustRecordMstService.selectByPrimaryKey(new Integer(custNo)));
			mav.addObject("analysisCustRecord", cstCustRecordMstService.analysisCstCustRecord(new Integer(custNo)));
			mav.addObject("analysisAgainstRecordList", cstCustRecordMstService.analysisAgainstRecordList(new Integer(custNo)));
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
	
	@RequestMapping(value="/main/ajaxRecentRecordList.do")
	public @ResponseBody Object ajaxRecentRecordList(HttpServletRequest request, HttpServletResponse response){
		
		int custNo = CookieMgr.getCustNo(request);
		
		GameRecord gameRecord = new GameRecord();
		gameRecord.setCustNo(custNo);
		
		String orderByClause = " reg_dtm asc";
		
		return gameRecordService.selectByExample(gameRecord, orderByClause);
	}
	
	@RequestMapping(value="/main/ajaxTotalMemberScoreList.do")
	public @ResponseBody Object ajaxTotalMemberScoreList(HttpServletRequest request, HttpServletResponse response){
		
		return cstCustRecordMstService.totalMemberScoreList();
	}
}
