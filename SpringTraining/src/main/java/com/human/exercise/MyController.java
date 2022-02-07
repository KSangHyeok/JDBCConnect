package com.human.exercise;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/s")
	public String s() {
		
		return "/StudentScore";
	}
	
	@RequestMapping("/deleteRoom")
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("code"));
		iEmp room=sqlSession.getMapper(iEmp.class);
		room.deleteRoom(roomcode);
		return "redirect:/room";
	}
	
	@RequestMapping("/deleteMenu")
	public String deleteMenu(HttpServletRequest hsr) {
		int code=Integer.parseInt(hsr.getParameter("code"));
		iEmp menu=sqlSession.getMapper(iEmp.class);
		menu.deleteMenu(code);
		return "redirect:/menuadd";
	}
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String room(Model model) {
		iEmp room=sqlSession.getMapper(iEmp.class);
		model.addAttribute("room",room.getRoom());		
		
		ArrayList<Roomtype> typeList=room.getRoomType();
		model.addAttribute("types",typeList);
		return "addRoom";
	}
	
	@RequestMapping("/addtype")
	public String typeAdd() {
		return "typeadd";
	}
	
	@RequestMapping(value="/typeadd")
	public String addType(HttpServletRequest hsr) {
		int type=Integer.parseInt(hsr.getParameter("typecode"));
		String name=hsr.getParameter("name");
				
		iEmp room=sqlSession.getMapper(iEmp.class);
		room.insertType(type,name);
		return "typeadd";
	}
	
//	@RequestMapping("/room")
//	public String doRoomAdd() {
//		return "addRoom";
//	}
	
	@RequestMapping(value="/addRoom")
	public String addRoom(HttpServletRequest hsr) {
		String Scode=hsr.getParameter("code");
		String name=hsr.getParameter("name");
		int type=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		iEmp room=sqlSession.getMapper(iEmp.class);
		if(Scode.equals("")) {			
			room.insertRoom(name,type,howmany,howmuch);
		}else {
			int code=Integer.parseInt(Scode);
			room.updateRoom(code,name,type,howmany,howmuch);
		}
		
		return "redirect:/room";
	}
	
	@RequestMapping("/menuadd")
		public String doMenuAdd(Model model) {
		iEmp menu=sqlSession.getMapper(iEmp.class);
		model.addAttribute("menu",menu.getMenu());
		
		
			return "addMenu";
		}
	
	
	@RequestMapping(value="/addMenu")
	public String addMenu(HttpServletRequest hsr) {
		String strcode=hsr.getParameter("code");		
		String mname=hsr.getParameter("menu_name");
		int price=Integer.parseInt(hsr.getParameter("price"));
		
		iEmp menu=sqlSession.getMapper(iEmp.class);
		if(strcode.equals("")) {
			menu.addMenu(mname,price);
		}else {
			int code=Integer.parseInt(strcode);
			menu.updateMenu(code,mname,price);
		}
		
		return "redirect:/menuadd";
	}
		
	@RequestMapping(value="/depart")
	public String depart(Model m) {
		iDepart depart=sqlSession.getMapper(iDepart.class);
		ArrayList<Depart> coun=depart.getdepart();
		m.addAttribute("de",coun);
		return "depart";
	}
	@RequestMapping(value="/country")
	public String country(Model m) {
		iCountry con=sqlSession.getMapper(iCountry.class);
		ArrayList<country> coun=con.getcon();
		m.addAttribute("con",coun);
		return "country";
	}
	
	@RequestMapping(value="/emp")
	public String doEmpList(Model m) {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Employee> alEmp=emp.getEmpList();
		m.addAttribute("alEmp",alEmp);
		return "emp";
	}
	@RequestMapping(value = "/look",method=RequestMethod.GET)
	public String look(HttpServletRequest hsr,Model model) {
		model.addAttribute("mobile","010-2565-6113");
		model.addAttribute("address","준빌맂");
		return "look";
	}
	@RequestMapping(value="/view")
	public String view(HttpServletRequest hsr) {
		String nick=hsr.getParameter("nickname");
		
		return "redirect:/look";
	}
	@RequestMapping(value="/input")
	public String input() {
		
		return "/input";
	}
	
	@RequestMapping(value="/calc")
	public String calc(HttpServletRequest hsr,Model model) {	
		try {
			double e;
			int q=Integer.parseInt(hsr.getParameter("q"));
			int w=Integer.parseInt(hsr.getParameter("w"));
			String op=hsr.getParameter("op");
			if(op.equals("+")) {
				e=(q+w);
				model.addAttribute("e",e);
				return "plus";
			}else if(op.equals("-")) {
				e=(q-w);
				model.addAttribute("e",e);
				return "minus";
			}else if(op.equals("*")) {
				e=(q*w);
				model.addAttribute("e",e);
				return "multi";
			}else if(op.equals("/")) {
				e=(q/w);
				model.addAttribute("e",e);
				return "divide";
			}
		} catch (Exception e) {
			model.addAttribute("e","error");
			return "error";
		}
//		String q=hsr.getParameter("q");
//		String w=hsr.getParameter("w");
//		if(q.equals("") || q==null || w.equals("") || w==null) {
//			model.addAttribute("e","error")	;
//			return "input";
//		}else {
//			int e=Integer.parseInt(q)*Integer.parseInt(w);
//			if(e>20) {
//				model.addAttribute("e",e);
//				return "calc";
//			}else {
//				model.addAttribute("e",e);
//				return "input";
//			}
//		}		
		return null;
		
//		int q=Integer.parseInt(hsr.getParameter("q"));
//		int w=Integer.parseInt(hsr.getParameter("w"));
//			int e=(q*w);
//		if(e>20)
//		model.addAttribute("e",e);
//		
//		return "input";
	}

}
