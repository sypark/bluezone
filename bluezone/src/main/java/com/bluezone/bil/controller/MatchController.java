package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluezone.bil.domain.game.MatchMst;
import com.bluezone.bil.service.game.MatchMstService;
import com.bluezone.bil.util.DateUtils;

@Controller
public class MatchController {
	
	@Autowired
	private MatchMstService matchMstService;

	@RequestMapping(value="/match/ajaxSearchMatchList.do")
	public @ResponseBody Object ajaxSearchMatchList(@Param("format") String format,
			HttpServletRequest request, HttpServletResponse response){
		
		if(format == null || "".equals(format))
			format = "yyyymmdd";
		
		MatchMst matchMst = new MatchMst();
		matchMst.setMatchDt(DateUtils.curDate(format));
		
		return matchMstService.selectByExample(matchMst);
	}
}
