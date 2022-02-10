package com.team.hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//예약관리
	@RequestMapping(value = "/serva")
	public String serva() {
		return "/serva";
	}
	//예약하기
	@RequestMapping(value = "/book")
	public String home(HttpServletRequest hsr,Model model) {
		//객실보기에서 type name 넘겨받기
//		int type=Integer.parseInt(hsr.getParameter(type));
//		int name=hsr.getParameter(name);
//		
//		model.addAttribute("type",type);
//		model.addAttribute("name",name);
		return "/book";
	}
	//에약확인 베이스
	@RequestMapping(value="/bookcheck")
	public String book(HttpServletRequest hsr,Model model) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		String start_dt=hsr.getParameter("start_dt");
		String end_dt=hsr.getParameter("end_dt");
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		String booker=hsr.getParameter("booker");
		String mobile=hsr.getParameter("mobile");
		model.addAttribute("booker",booker);
		model.addAttribute("start_dt",start_dt);
		model.addAttribute("end_dt",end_dt);
		model.addAttribute("howmany",howmany);
		model.addAttribute("howmuch",howmuch);
		model.addAttribute("mobile",mobile);
		model.addAttribute("roomcode",roomcode);
		return "/confirm";
	}
		
	
}
