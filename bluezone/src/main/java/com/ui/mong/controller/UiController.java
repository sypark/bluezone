package com.ui.mong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bluezone.bil.domain.game.GameMst;
import com.google.gson.Gson;

@Controller
public class UiController {

	@RequestMapping(value="/ui/table.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("ui/table");
	}
	
	@RequestMapping(value="/ui/button.do")
	public ModelAndView button(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("ui/button");
	}
	
	@RequestMapping(value="/ui/ajax.do")
	public ModelAndView ajax(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("ui/ajax");
	}
	
	@RequestMapping(value="/ui/tableLayer.do")
	public ModelAndView tableLayer(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("ui/tableLayer");
	}
	
	@RequestMapping(value="/ui/tableJson.do")
	public @ResponseBody Object tableJson(HttpServletRequest request, HttpServletResponse response){
		
		String jsonData = "[{\"clo1\":\"Ajax11\",\"clo2\":\"Ajax22\",\"clo3\":\"@mdo\",\"clo11\":\"<span class='label label-warning'>Expiring</span>\"},{\"clo1\":\"Ajax33\",\"clo2\":\"Ajax44\",\"clo3\":\"@mdo\",\"clo22\":\"<span class='label label-warning'>Expiring</span>\"}]";
		return jsonData;
	}
}
