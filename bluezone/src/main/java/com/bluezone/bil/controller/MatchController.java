package com.bluezone.bil.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.domain.game.MatchMst;
import com.bluezone.bil.service.game.MatchMstService;
import com.bluezone.bil.util.DateUtils;

@Controller
public class MatchController {
	
	@Autowired
	private MatchMstService matchMstService;

	@RequestMapping(value="/match/ajaxInsert.do")
	public @ResponseBody Object ajaxInsert(@ModelAttribute("matchMst") MatchMst matchMst,
			HttpServletRequest request, HttpServletResponse response){
		
		matchMst.setRegrId(CommonConstant.SYSTEM_ID);
		matchMst.setRegDtm(DateUtils.curTimestamp());
		matchMst.setUpdrId(CommonConstant.SYSTEM_ID);
		matchMst.setUpdDtm(DateUtils.curTimestamp());
		matchMst.setStdDt(DateUtils.curDate(CommonConstant.DATE_FORMAT_YYYYMMDD));
		matchMst.setEndDt(DateUtils.addDate(CommonConstant.DATE_FORMAT_YYYYMMDD, 1));
		matchMst.setUseYn("Y");
		matchMst.setYyyymm(DateUtils.curDate("yyyyMM"));
		matchMst.setWeek(DateUtils.curWeekOfMonth());
		
		return matchMstService.insert(matchMst);
	}
	
	@RequestMapping(value="/match/ajaxSearchMatchList.do")
	public @ResponseBody Object ajaxSearchMatchList(@Param("format") String format,
			HttpServletRequest request, HttpServletResponse response){
		
		if(format == null || "".equals(format))
			format = CommonConstant.DATE_FORMAT_YYYYMMDD;
		
		MatchMst matchMst = new MatchMst();
		matchMst.setEndDt(DateUtils.curDate(format));
		
		String orderByClause = " end_dt desc, reg_dtm desc";
		
		return matchMstService.selectByExample(matchMst, orderByClause);
	}
}

