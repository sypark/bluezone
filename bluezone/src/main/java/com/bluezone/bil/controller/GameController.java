package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.service.game.GameMstService;
import com.bluezone.bil.service.game.GameRecordService;

@Controller
public class GameController {
	
	@Autowired
	private GameMstService gameMstService;
	@Autowired
	private GameRecordService gameRecordService;

	@RequestMapping(value="/game/createGame.do")
	public ModelAndView createGame(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/game/createGame");
		return mav;
	}
	
	@RequestMapping(value="/game/ajaxSearchGameList.do")
	public @ResponseBody Object ajaxSearchGameList(@RequestParam("matchNo") Integer matchNo,
			HttpServletRequest request, HttpServletResponse response){
		
		GameMst gameMst = new GameMst();
		gameMst.setMatchNo(matchNo);
		gameMst.setUseYn("Y");
		
		return gameMstService.selectByExample(gameMst);
	}
	
	@RequestMapping(value="/game/ajaxSearchGameRecordList.do")
	public @ResponseBody Object ajaxSearchGameRecordList(@RequestParam("gameNo") Integer gameNo,
			HttpServletRequest request, HttpServletResponse response){
			
		return gameRecordService.selectGameWithCustInfo(gameNo);
	}
}
