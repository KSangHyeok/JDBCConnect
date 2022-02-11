package com.team.hotel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	
	//예약관리
	@RequestMapping(value = "/serva")
	public String serva() {
		return "/serva";
	}
	//예약객실목록
	@ResponseBody
	@RequestMapping(value="/booklist",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String getBookList() {
		iHotel book=sqlSession.getMapper(iHotel.class);
		ArrayList<Booklist> booker=book.getbook();
		JSONArray ja=new JSONArray();
		for(int i=0;i<booker.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("name",booker.get(i).getName());
			jo.put("book_id",booker.get(i).getBook_id());
			jo.put("room_code",booker.get(i).getRoom_code());
			jo.put("start_dt",booker.get(i).getStart_dt());
			jo.put("end_dt",booker.get(i).getEnd_dt());
			jo.put("howmany",booker.get(i).getHowmany());
			jo.put("howmuch",booker.get(i).getHowmuch());
			jo.put("booker",booker.get(i).getBooker());
			jo.put("mobile",booker.get(i).getMobile());
			ja.add(jo);
		}	
	return ja.toString();
	}
	//roomname change
	@ResponseBody
	@RequestMapping(value="/roomname",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String geRoomname(HttpServletRequest hsr) {
		String type_code=hsr.getParameter("type");
		iHotel type=sqlSession.getMapper(iHotel.class);
		ArrayList<Roomlist> name=type.getroomname(Integer.parseInt(type_code));
		JSONArray ja=new JSONArray();
		for(int i=0;i<name.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("code",name.get(i).getRoom_code());
			jo.put("name",name.get(i).getName());			
			ja.add(jo);
		}	
	return ja.toString();
	}
	//room 찾기
	@ResponseBody
	@RequestMapping(value="/roomlist",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String getRoomList(HttpServletRequest hsr) {
		String type_code=hsr.getParameter("type_code");
		String start_dt=hsr.getParameter("start_dt");
		String end_dt=hsr.getParameter("end_dt");
		iHotel room=sqlSession.getMapper(iHotel.class);
		ArrayList<Roomlist> list=room.getroom(Integer.parseInt(type_code));
		JSONArray ja=new JSONArray();
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("room_code",list.get(i).getRoom_code());
			jo.put("name",list.get(i).getName());
			jo.put("type",list.get(i).getType());
			jo.put("howmany",list.get(i).getHowmany());
			jo.put("howmuch",list.get(i).getHowmuch());
			ja.add(jo);
		}	
	return ja.toString();
	}
	//객실타입 select
	@ResponseBody
	@RequestMapping(value="/typelist",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String getMenuList() {
		iHotel type=sqlSession.getMapper(iHotel.class);
		ArrayList<Typelist> list=type.gettype();
		JSONArray ja=new JSONArray();
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("code",list.get(i).getType_code());
			jo.put("name",list.get(i).getType_name());			
			ja.add(jo);
		}	
	return ja.toString();
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
