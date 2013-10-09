package com.bluezone.bil.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.service.cust.CstCustMstService;
import com.bluezone.bil.service.game.GameMstService;
import com.bluezone.bil.service.game.GameRecordService;
import com.bluezone.bil.util.DateUtils;

@Controller
public class GameController {
	
	@Autowired
	private GameMstService gameMstService;
	@Autowired
	private GameRecordService gameRecordService;
	@Autowired
	private CstCustMstService cstCustMstService;

	@RequestMapping(value="/game/createGame.do")
	public ModelAndView createGame(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/game/createGame");
		mav.addObject("cstCustMstList", cstCustMstService.selectByExample(null));
		
		return mav;
	}
	
	@RequestMapping(value="/game/ajaxSearchGameList.do")
	public @ResponseBody Object ajaxSearchGameList(@RequestParam("matchNo") Integer matchNo,
			HttpServletRequest request, HttpServletResponse response){
		
		GameMst gameMst = new GameMst();
		gameMst.setMatchNo(matchNo);
		gameMst.setStatus(CommonConstant.GAME_STATUS_CREATE);
		
		String orderByClause = " game_dt desc, reg_dtm desc";
		
		return gameMstService.selectByExample(gameMst, orderByClause);
	}
	
	@RequestMapping(value="/game/ajaxSearchGameRecordList.do")
	public @ResponseBody Object ajaxSearchGameRecordList(@RequestParam("gameNo") Integer gameNo,
			HttpServletRequest request, HttpServletResponse response){
			
		return gameRecordService.selectGameWithCustInfo(gameNo);
	}
	
	@RequestMapping(value="/game/ajaxCreateGame.do", method=RequestMethod.POST)
	public @ResponseBody Object ajaxCreateGame(@ModelAttribute("gameMst") GameMst gameMst,
			@RequestParam("custNo1") Integer custNo1,
			@RequestParam("custNo2") Integer custNo2,
			HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("custNo1:"+custNo1);
		System.out.println("custNo2:"+custNo2);
		
		gameMst.setRegrId(CommonConstant.SYSTEM_ID);
		gameMst.setRegDtm(DateUtils.curTimestamp());
		gameMst.setUpdrId(CommonConstant.SYSTEM_ID);
		gameMst.setUpdDtm(DateUtils.curTimestamp());
		gameMst.setStatus(CommonConstant.GAME_STATUS_CREATE);
		gameMst.setGameDt(DateUtils.curDate(CommonConstant.DATE_FORMAT_YYYYMMDD));
		
		List<Integer> custList = new ArrayList<Integer>();
		custList.add(custNo1);
		custList.add(custNo2);
		try {
			int cnt = gameMstService.createGame(gameMst, custList);
			
			if(cnt > 0){
				return gameMst.getGameNo()+"";
			}else{
				return "0";
			}
		} catch (Exception e) {
			return "0";
		}
	}
	
	@RequestMapping(value="/game/ajaxDeleteGame.do")
	public @ResponseBody Object ajaxDeleteGame(@RequestParam("gameNo") Integer gameNo,
			HttpServletRequest request, HttpServletResponse response){
		
		return gameMstService.deleteByPrimaryKey(gameNo);
	}
}
