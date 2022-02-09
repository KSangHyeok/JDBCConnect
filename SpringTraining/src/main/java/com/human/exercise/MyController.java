package com.human.exercise;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class MyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/hu")
	public String Hu(Model model) {
		IJob job=sqlSession.getMapper(IJob.class);
		ArrayList<hum> jl=job.getHu();
		
		model.addAttribute("jobs",jl);
		return "/hu";
	}
	
	@ResponseBody
	@RequestMapping(value="/dd",produces="application/json;charset=utf-8")
	public String dodd(HttpServletRequest hsr) {
		String eid=hsr.getParameter("eid");
		IJob job=sqlSession.getMapper(IJob.class);
		ArrayList<humm> ml=job.getHuu(eid);
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("eid",ml.get(i).getEmp_name());					
			ja.add(jo);
		}	
		return ja.toString();
	}
	
	@RequestMapping("/dept")
	public String Dept(Model model) {
		IJob job=sqlSession.getMapper(IJob.class);
		ArrayList<EmpD> jl=job.getDid();
		
		model.addAttribute("jobs",jl);
		return "/dept";
	}
	
	@ResponseBody
	@RequestMapping(value="/ee",produces="application/json;charset=utf-8")
	public String doee(HttpServletRequest hsr) {
		String eid=hsr.getParameter("eid");
		IJob job=sqlSession.getMapper(IJob.class);
		ArrayList<EmpF> ml=job.getFname(eid);
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("eid",ml.get(i).getEid());
			jo.put("ename",ml.get(i).getEname());
			jo.put("mobile",ml.get(i).getMobile());
			jo.put("salary",ml.get(i).getSalary());			
			ja.add(jo);
		}	
		return ja.toString();
	}
	
	@RequestMapping("/job")
	public String job(Model model) {
		IJob job=sqlSession.getMapper(IJob.class);
		ArrayList<Job> jl=job.jobList();
		
		model.addAttribute("jobs",jl);
		return "/job";
	}
	
	@RequestMapping("/emplist")
	public String emplist() {
		
		return "/emplist";
	}
	
	@ResponseBody
	@RequestMapping(value="/position",produces="application/json;charset=utf-8")
	public String doPosition(HttpServletRequest hsr) {
		String jobid=hsr.getParameter("jobcode");
		IJob job=sqlSession.getMapper(IJob.class);
		ArrayList<EmpInfo> ml=job.getList(jobid);
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("eid",ml.get(i).getEid());
			jo.put("ename",ml.get(i).getEname());
			jo.put("mobile",ml.get(i).getMobile());
			jo.put("dname",ml.get(i).getDname());			
			ja.add(jo);
		}	
		return ja.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/empList",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String empList(HttpServletRequest hsr) {
		String Keyword=hsr.getParameter("kw");
		if(Keyword.equals("")) return "";
		
		iEmp menu=sqlSession.getMapper(iEmp.class);
		ArrayList<Emp> Room=menu.selectEmp(Integer.parseInt(Keyword));
		JSONArray ja=new JSONArray();
		for(int i=0;i<Room.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("id",Room.get(i).getEmployee_id());
			jo.put("name",Room.get(i).getEmp_name());
			jo.put("number",Room.get(i).getPhone_number());
			jo.put("date",Room.get(i).getHire_date());
			jo.put("mid",Room.get(i).getManager_id());
			ja.add(jo);
		}	
	return ja.toString();
	}
	
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
//		iEmp room=sqlSession.getMapper(iEmp.class);
//		model.addAttribute("room",room.getRoom());		
//		
//		ArrayList<Roomtype> typeList=room.getRoomType();
//		model.addAttribute("types",typeList);
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
	@ResponseBody
	@RequestMapping(value="/roomlist",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String getRoomList() {
		iEmp menu=sqlSession.getMapper(iEmp.class);
		ArrayList<iRoom> Room=menu.getRoom();
		JSONArray ja=new JSONArray();
		for(int i=0;i<Room.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("code",Room.get(i).getCode());
			jo.put("roomname",Room.get(i).getRoomname());
			jo.put("name",Room.get(i).getName());
			jo.put("howmany",Room.get(i).getHowmany());
			jo.put("howmuch",Room.get(i).getHowmuch());
			ja.add(jo);
		}	
	return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/typelist",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String getTypeList() {
		iEmp menu=sqlSession.getMapper(iEmp.class);
		ArrayList<Roomtype> Room=menu.getRoomType();
		JSONArray ja=new JSONArray();
		for(int i=0;i<Room.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("typecode",Room.get(i).getTypecode());
			jo.put("name",Room.get(i).getName());			
			ja.add(jo);
		}	
	return ja.toString();
	}
	
	@RequestMapping("/menuadd")
		public String doMenuAdd(Model model) {

			return "addMenu";
		}
	@ResponseBody
	@RequestMapping(value="/menulist",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String getMenuList() {
		iEmp menu=sqlSession.getMapper(iEmp.class);
		ArrayList<iMenu> Menu=menu.getMenu();
		JSONArray ja=new JSONArray();
		for(int i=0;i<Menu.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("name",Menu.get(i).getName());
			jo.put("price",Menu.get(i).getPrice());
			jo.put("code",Menu.get(i).getCode());
			ja.add(jo);
		}	
	return ja.toString();
	}
	
	@RequestMapping(value="/addMenu")
	public void addMenu(HttpServletRequest hsr) {
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
		
//		return "redirect:/menuadd";
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
