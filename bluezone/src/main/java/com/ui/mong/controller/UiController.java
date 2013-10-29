package com.ui.mong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}
