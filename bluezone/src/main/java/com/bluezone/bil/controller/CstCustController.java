package com.bluezone.bil.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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
import com.bluezone.bil.domain.game.GameCustComp;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.domain.game.GameRecordInning;
import com.bluezone.bil.service.cust.CstCustMstService;
import com.bluezone.bil.service.cust.CstCustRecordMstService;
import com.bluezone.bil.service.game.GameMstService;
import com.bluezone.bil.service.game.GameRecordInningService;
import com.bluezone.bil.service.game.GameRecordService;
import com.bluezone.bil.service.game.MatchMstService;
import com.bluezone.bil.util.DateUtils;
import com.bluezone.bil.util.cookie.CookieMgr;
import com.bluezone.bil.util.cookie.CookieUtils;

@Controller
public class CstCustController {
	
	@Autowired
	private CstCustMstService cstCustMstService;
	
	@Autowired
	private CstCustRecordMstService cstCustRecordMstService;
	
	@Autowired
	private MatchMstService matchMstService;
	
	@Autowired
	private GameMstService gameMstService;

	@Autowired
	private GameRecordService gameRecordService;
	
	@Autowired
	private GameRecordInningService gameRecordInningService;
	

	
	@RequestMapping(value="/cust/insForm.do")
	public ModelAndView insForm(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("cust/insForm");
	}
	
	@RequestMapping(value="/cust/ajaxInsert.do", method=RequestMethod.POST)
	public @ResponseBody Object insertProcess(@ModelAttribute CstCustMst cstCustMst,
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
		cstCustMst.setCustLevel(CommonConstant.CUST_GRADE_NORMAL);
		
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
	public @ResponseBody Object ajaxDupChkNickName(@RequestParam("nickName") String nickName,
			HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("nickName:"+nickName);
		
		CstCustMst cstCustMst = new CstCustMst();
		cstCustMst.setNickName(nickName);
		
		cstCustMst = cstCustMstService.dupChkNickName(cstCustMst);
		
		return (cstCustMst == null ? "1":"0");
	}
	
	@RequestMapping(value="/cust/ajaxDupChkEmail.do")
	public @ResponseBody Object ajaxDupChkEmail(@RequestParam("email") String email,
			HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("email:"+email);
		
		CstCustMst cstCustMst = new CstCustMst();
		cstCustMst.setEmail(email);
		
		cstCustMst = cstCustMstService.dupChkEmail(cstCustMst);
		
		return (cstCustMst == null ? "1":"0");
	}
	
	@RequestMapping(value="/cust/ajaxLoginProcess.do")
	public @ResponseBody Object ajaxLoginProcess(@RequestParam("email") String email,
			@RequestParam("passwd") String passwd,
			HttpServletRequest request, HttpServletResponse response){
		
		CstCustMst cstCustMst = new CstCustMst();
		cstCustMst.setEmail(email);
		cstCustMst.setPasswd(passwd);
		cstCustMst.setUseYn("Y");
		
		cstCustMst = cstCustMstService.loginChk(cstCustMst);
		
		boolean isLogin = false;
		if(cstCustMst != null && cstCustMst.getCustNo() > 0){
			// 쿠키값 생성
			CookieUtils cookieUtils = new CookieUtils();
			cookieUtils.createCookie(request, response, cstCustMst);
			isLogin = true;
		}
		
		return (isLogin ? "1":"0");
	}
	
	@RequestMapping(value="/cust/ajaxCustInfo.do")
	public @ResponseBody Object ajaxCustInfo(HttpServletRequest request, HttpServletResponse response){
		
		int custNo = CookieMgr.getCustNo(request);
		
		if(custNo > 0){
			return cstCustMstService.selectByPrimaryKey(custNo);
		}else{
			return null;
		}
	}
	
	@RequestMapping(value="/cust/gameRecordList.do")
	public ModelAndView gameRecordList(@Param("matchNo") Integer matchNo, 
			@Param("gameNo") Integer gameNo,
			HttpServletRequest request, HttpServletResponse response){
		
		int custNo = CookieMgr.getCustNo(request);
		
		GameCustComp gameCustComp = new GameCustComp();
		gameCustComp.setCustNo(custNo);
		gameCustComp.setGameNo(gameNo);
		gameCustComp.setMatchNo(matchNo);
		
		ModelAndView mav = new ModelAndView("cust/gameRecordList");
		mav.addObject("gameRecordList", gameRecordService.selectTotalCustGameRecordList(gameCustComp));
		
		return mav;
	}
	
	@RequestMapping(value="/cust/gameRecordInningList.do")
	public ModelAndView gameRecordInningList(@RequestParam("gameNo") Integer gameNo,
			@RequestParam("gameRecNo") Integer gameRecNo, 
			HttpServletRequest request, HttpServletResponse response){
		
		GameRecord gameRecord = new GameRecord();
		gameRecord.setGameNo(gameNo);
		
		List<GameRecord> gameRecordList = gameRecordService.selectByExample(gameRecord);
		
		ModelAndView mav = new ModelAndView("cust/gameRecordInningList");
		mav.addObject("gameMst", gameMstService.selectByPrimaryKey(gameNo));
		mav.addObject("gameRecordList", gameRecordList);
		
		String orderByClause = " inning_num asc";
		for (GameRecord gameRecord2 : gameRecordList) {
			GameRecordInning gameRecordInning = new GameRecordInning();
			gameRecordInning.setGameRecNo(gameRecord2.getGameRecNo());
			mav.addObject("gameRecordInningList"+(gameRecNo == gameRecord2.getGameRecNo() ? "0":"1"), gameRecordInningService.selectByExample(gameRecordInning, orderByClause));
		}
		
		return mav;
	}
	
	@RequestMapping(value="/cust/leftmenu.do")
	public ModelAndView leftmenu(HttpServletRequest request, HttpServletResponse response){
		
		int custNo = CookieMgr.getCustNo(request);
		
		ModelAndView mav = new ModelAndView("cust/custRecordLeftMenu");
		mav.addObject("custMatchList", matchMstService.custMatchList(custNo));
		mav.addObject("custGameList", gameMstService.custGameList(custNo));
		return mav;
	}
	
	@RequestMapping(value="/cust/ajaxSelectCstCustInfoFromGameRecNo.do")
	public @ResponseBody Object selectCstCustInfoFromGameRecNo(@RequestParam("gameRecNo") Integer gameRecNo,
			HttpServletRequest request, HttpServletResponse response){
		
		return cstCustMstService.selectCstCustInfoFromGameRecNo(gameRecNo);
	}
}
