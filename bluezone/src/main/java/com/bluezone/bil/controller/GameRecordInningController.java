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
import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.domain.game.GameRecordInning;
import com.bluezone.bil.service.game.GameMstService;
import com.bluezone.bil.service.game.GameRecordInningService;
import com.bluezone.bil.service.game.GameRecordService;
import com.bluezone.bil.service.game.MatchMstService;

@Controller
public class GameRecordInningController {
	
	@Autowired
	private MatchMstService matchMstService;
	@Autowired
	private GameMstService gameMstService;
	@Autowired
	private GameRecordService gameRecordService;
	@Autowired
	private GameRecordInningService gameRecordInningService;
	
	@RequestMapping(value="/inning/gameRecordInningForm.do")
	public ModelAndView gameRecordForm(@RequestParam("gameNo") Integer gameNo,
			HttpServletRequest request, HttpServletResponse response){
		
		GameMst gameMst = gameMstService.selectByPrimaryKey(gameNo);
		
		ModelAndView mav = new ModelAndView("/inning/gameRecordInningForm");
		mav.addObject("matchMst", matchMstService.selectByPrimaryKey(gameMst.getMatchNo()));
		mav.addObject("gameMst", gameMst);
		mav.addObject("gameCustCompList", gameRecordService.selectGameWithCustInfo(gameNo));
		
		return mav;
	}
	
	@RequestMapping(value="/inning/ajaxCreateGameInning.do", method=RequestMethod.POST)
	public @ResponseBody Object insertProcess(@ModelAttribute("gameRecordInning") GameRecordInning gameRecordInning,
			HttpServletRequest request, HttpServletResponse response){
		
		return gameRecordInningService.insertAndupdate(gameRecordInning);
	}
	
	@RequestMapping(value="/inning/ajaxGetGameInningData.do", method=RequestMethod.POST)
	public @ResponseBody Object ajaxGetGameInningData(@ModelAttribute("gameRecordInning") GameRecordInning gameRecordInning,
			HttpServletRequest request, HttpServletResponse response){
		
		return gameRecordInningService.selectByExample(gameRecordInning);
	}
	
	@RequestMapping(value="/inning/ajaxSendInningData.do", method=RequestMethod.POST)
	public @ResponseBody Object ajaxSendInningData(@RequestParam("gameRecNo") Integer gameRecNo,
			@RequestParam("gameResult") String gameResult,
			HttpServletRequest request, HttpServletResponse response){
		
		GameRecordInning gameRecordInning = new GameRecordInning();
		gameRecordInning.setGameRecNo(gameRecNo);
		
		GameRecord gameRecord = new GameRecord();
		gameRecord.setGameRecNo(gameRecNo);
		if(CommonConstant.GAME_RSLT.win.toString().equals(gameResult))
			gameRecord.setWinCnt(1);
		else if(CommonConstant.GAME_RSLT.lose.toString().equals(gameResult))
			gameRecord.setLoseCnt(1);
		else if(CommonConstant.GAME_RSLT.draw.toString().equals(gameResult))
			gameRecord.setDrawCnt(1);
		
		try {
			return gameRecordInningService.gameInningResult(gameRecordInning, gameRecord);
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
}
