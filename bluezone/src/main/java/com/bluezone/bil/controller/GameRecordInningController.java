package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bluezone.bil.domain.game.GameMst;
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
}
