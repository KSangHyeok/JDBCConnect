package com.team.hotel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	//예약관리
	@RequestMapping(value = "/serva")
	public String serva() {
		return "/serva";
	}
	//예약확정
	@RequestMapping(value="/roomok",method=RequestMethod.POST,
            produces="application/json;charset=utf-8")
	public String RoomOk(HttpServletRequest hsr) {
		System.out.println("들어옴");
		int type_code=Integer.parseInt(hsr.getParameter("type_code"));
		int room_code=Integer.parseInt(hsr.getParameter("room_code"));
		String booker=hsr.getParameter("booker");
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		String mobile=hsr.getParameter("mobile");
		String start_dt=hsr.getParameter("start_dt");
		String end_dt=hsr.getParameter("end_dt");		
		iHotel book=sqlSession.getMapper(iHotel.class);	
		book.insertbook(room_code,start_dt,end_dt,howmany,howmuch,booker,mobile);		
	return "redirect:/serva";
	}
// 예약취소
	@RequestMapping(value="/roomcan",method=RequestMethod.POST,
            produces="application/json;charset=utf-8")
	public String Roomcan(HttpServletRequest hsr) {
		int book_id=Integer.parseInt(hsr.getParameter("book_id"));		
		iHotel book=sqlSession.getMapper(iHotel.class);	
		book.deletebook(book_id);		
	return "redirect:/serva";
	}
//	예약객실목록
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
		int type_code=Integer.parseInt(hsr.getParameter("type_code"));
		String start_dt=hsr.getParameter("start_dt");
		String end_dt=hsr.getParameter("end_dt");
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		iHotel room=sqlSession.getMapper(iHotel.class);
		ArrayList<Roomlist> list=room.getroom(type_code,start_dt,end_dt,howmany);
		System.out.println(list);
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
	public String booke(HttpServletRequest hsr,Model model) {
		//객실보기에서 type name 넘겨받기
//		int type=Integer.parseInt(hsr.getParameter(type));
//		int name=hsr.getParameter(name);
//		
//		model.addAttribute("type",type);
//		model.addAttribute("name",name);
		return "book";
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
	//승혁이형	
	@RequestMapping(value = "/controltype")      //show typecontrol
	   public String typecontrol() {
	      return "typecontrol";
	   }
	@RequestMapping("/addType")      //insert typecontrol
	   public String addType(HttpServletRequest hsr) {
	      String type_name = hsr.getParameter("name");
	      iHotel addtype=sqlSession.getMapper(iHotel.class); 
	      addtype.addType(type_name);
	      return "typecontrol";
	   }
	@RequestMapping("/updType")      //update typecontrol
	   public String updType(HttpServletRequest hsr) {
	      String type_name = hsr.getParameter("name");
	      int type_code = Integer.parseInt(hsr.getParameter("type_code"));
	      iHotel updtype=sqlSession.getMapper(iHotel.class);
	      updtype.updType(type_code, type_name);
	      return "redirect:/typecontrol";
	   }
	@ResponseBody         // typecontrol ajaxcall
	   @RequestMapping(value="/typeadd1",produces="application/json;charset=utf-8")
	   public String typeadd1() {
	      iHotel selType = sqlSession.getMapper(iHotel.class);
	      ArrayList<roomtypeDTO> seltype=selType.selType();
	      JSONArray ja= new JSONArray();
	      for(int i=0; i<seltype.size(); i++) {
	         JSONObject jo=new JSONObject();
	         jo.put("type_code",seltype.get(i).getType_code());
	         jo.put("type_name",seltype.get(i).getType_name());
	         ja.add(jo);
	      }
	      return ja.toString();
	   }
	@RequestMapping("/delType")      //delete typecontrol
	   public String doDelType(HttpServletRequest hsr) {
	      int code=Integer.parseInt(hsr.getParameter("type_code"));
	      iHotel delType=sqlSession.getMapper(iHotel.class);
	      delType.delType(code);
	      return "redirect:/controltype";
	   }
  @RequestMapping("/typecontrol")      //select typecontrol
  public String selType(Model m) {
     iHotel selType = sqlSession.getMapper(iHotel.class);
     ArrayList<roomtypeDTO> seltype=selType.selType();
     m.addAttribute("seltype",seltype);
     return "typecontrol";
  }
  //roomcontrol
  @RequestMapping("/controlroom")      //show roomcontrol
  public String roomcontrol() {
     return "redirect:/roomcontrol";
  }
  @RequestMapping("/roomcontrol")      //select roomcontrol
  public String selRoom(Model m) {
     iHotel selRoom = sqlSession.getMapper(iHotel.class);
     ArrayList<roomDTO> selroom=selRoom.selRoom();
     m.addAttribute("selroom",selroom);
     return "roomcontrol";
  }
  @RequestMapping("/delRoom")      //delete roomcontrol
  public String doDeleteRoom(HttpServletRequest hsr) {
     int code=Integer.parseInt(hsr.getParameter("room_code"));
     iHotel delRoom=sqlSession.getMapper(iHotel.class);
     delRoom.delRoom(code);
     return "redirect:/roomcontrol";
  }
  @RequestMapping("/addRoom")      //insert roomcontrol
  public String addRoom(HttpServletRequest hsr) {
     String strCode = hsr.getParameter("room_code");
     String name = hsr.getParameter("name");
     int howmany = Integer.parseInt(hsr.getParameter("howmany"));
     int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
     
     if(strCode.equals("")) {
     iHotel addroom=sqlSession.getMapper(iHotel.class);
     int type = Integer.parseInt(hsr.getParameter("seltype"));
     addroom.addRoom(name,type,howmany,howmuch);
     } else {               //update roomcontrol
        int code=Integer.parseInt(strCode);
        int type = Integer.parseInt(hsr.getParameter("seltype"));
        iHotel updroom=sqlSession.getMapper(iHotel.class);
        updroom.updRoom(code, name,type, howmany, howmuch);
     }
     return "roomcontrol";
  }
  @ResponseBody            // roomcontrol ajaxcall
  @RequestMapping(value="/roomadd1",produces="application/json;charset=utf-8")
  public String roomadd1() {
     iHotel selRoom = sqlSession.getMapper(iHotel.class);
     ArrayList<roomDTO> selroom=selRoom.selRoom();
     JSONArray ja= new JSONArray();
     for(int i=0; i<selroom.size(); i++) {
        JSONObject jo=new JSONObject();
        jo.put("room_code",selroom.get(i).getRoom_code());
        jo.put("name",selroom.get(i).getName());
        jo.put("type",selroom.get(i).getType_name());
        jo.put("howmany",selroom.get(i).getHowmany());
        jo.put("howmuch",selroom.get(i).getHowmuch());
        ja.add(jo);
     }
     return ja.toString();
  }
  //김유진씨
  
//	-------------------------------------------------------------------------------
//	로그인/로그아웃
//	-------------------------------------------------------------------------------
	
	@RequestMapping("/login")
	public String goLogin() {
		return "login";
	}
	@RequestMapping(value="/login_check",method=RequestMethod.POST)
	public String doLogin(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String userid=hsr.getParameter("userid");
		
		iHotel hotel=sqlSession.getMapper(iHotel.class);
		hotel.loginMember(userid);
		session.setAttribute("userid", userid);
		return "home";
	}
	@ResponseBody
	@RequestMapping(value="/user_check", method=RequestMethod.POST)
	public String user_check(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String flag="";
		try {
			String userid=hsr.getParameter("userid");
			String passcode=hsr.getParameter("passcode");
			System.out.println("입력한 패스워드 :"+passcode);
			
			iHotel hotel=sqlSession.getMapper(iHotel.class);
			Member member=hotel.usercheck(userid);
			System.out.println("존재하는 패스워드:["+member.getPasscode()+"]");
			if(!member.getPasscode().equals(passcode)) {
				flag="fail";
			} else {
				System.out.println("u_Type:["+member.getUser_type()+"]");
				session.setAttribute("u_type", member.getUser_type());
			}
		}catch(Exception e){ // 해당 아이디가 DB에 없는 경우 생길 오류 대비
			System.out.println(e.getMessage());
			flag="fail";
		}		
		return flag;
	}
	
	@RequestMapping("/logout")
	public String goLogout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String userid=(String) session.getAttribute("userid");
		System.out.println("받아온 아이디:["+userid+"]");
		iHotel hotel=sqlSession.getMapper(iHotel.class);
		hotel.logoutMember(userid);
		session.invalidate();
		return "redirect:/";
	}
//	-------------------------------------------------------------------------------
//	회원가입
//	-------------------------------------------------------------------------------
	@RequestMapping("/register")
	public String goSignon() {
		return "signon";
	}
	@RequestMapping(value="/sign_check",method=RequestMethod.POST)
	public String doSignon(HttpServletRequest hsr) {
		String name=hsr.getParameter("name");
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		String mobile=hsr.getParameter("mobile");
		System.out.println("이름:["+name+"]");
		System.out.println("아이디:["+userid+"]");
		System.out.println("패스워드:["+passcode+"]");
		System.out.println("전화번호:["+mobile+"]");
		
		iHotel hotel=sqlSession.getMapper(iHotel.class);
		hotel.insertMember(userid, passcode, name, mobile);
		return "redirect:/login";
	}
	@ResponseBody
	@RequestMapping(value="/id_check",method=RequestMethod.POST)
	public String id_check(HttpServletRequest hsr) {
		String userid=hsr.getParameter("userid");
		System.out.println("입력한 아이디:["+userid+"]");
		
		iHotel hotel=sqlSession.getMapper(iHotel.class);
		String retext="ok";
		try {
			Member member=hotel.idcheck(userid);
			System.out.println("존재하는 아이디:["+member.getUserid()+"]");
			retext="fail";
		} catch (Exception e) {//userid가 없을 경우 나는 에러방지
			retext="ok";
		}
		return retext;
	}
	
//	-------------------------------------------------------------------------------
//	회원탈퇴
//	-------------------------------------------------------------------------------
	@RequestMapping("/account_delete")
	public String account_delete() {
		return "deleteMember";
	}
	@RequestMapping(value="/delete_account",method=RequestMethod.POST)
	public String delete_account(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String userid=(String) session.getAttribute("userid");
		System.out.println("받아온 아이디:["+userid+"]");
		
		iHotel hotel=sqlSession.getMapper(iHotel.class);
		hotel.deleteMember(userid);
		session.invalidate();
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping(value="/passcode_check",method=RequestMethod.POST)
	public String pass_check(HttpServletRequest hsr) {
		String retext="";
		try {
			String userid=hsr.getParameter("userid");
			String passcode=hsr.getParameter("passcode");
			System.out.println("입력한 아이디:["+userid+"]");
			System.out.println("입력한 패스워드:["+passcode+"]");
			
			iHotel hotel=sqlSession.getMapper(iHotel.class);
			Member member=hotel.usercheck(userid);
			System.out.println("존재하는 패스워드:["+member.getPasscode()+"]");
			if(member.getPasscode().equals(passcode)) retext="ok";
			else retext="fail";
		} catch (Exception e) {//userid가 없을 경우 나는 에러방지
			retext="fail";
		}
		System.out.println("리턴값:"+retext);
		return retext;
	}
	//지명은씨--------------------------------------------------------
	@RequestMapping("/flist")
	public String FAQList() {
		System.out.println("flist");
		return "FAQList";
	}
	@ResponseBody
	@RequestMapping(value="ftitle",produces="application/json;charset=UTF-8")
	public String  getFAQList(HttpServletRequest hsr) {
		
		iHotel FList=sqlSession.getMapper(iHotel.class);
		ArrayList<Board> faq=FList.getBoardList();
//		System.out.println("Size:" +faq.size());
		
		JSONArray ja= new JSONArray();
		for(int i=0; i<faq.size();i++) { //ArrayList ->JSON
			JSONObject jo=new JSONObject();
			jo.put("post_code",faq.get(i).getPost_code());//
			jo.put("title",faq.get(i).getTitle());//
			jo.put("created",faq.get(i).getCreated());
		
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping("/fcontent")
	public String FAQContent(HttpServletRequest hsr, Model model) {		
		int post_code=Integer.parseInt(hsr.getParameter("post_code"));
		HttpSession session= hsr.getSession(true);
		iHotel fcontent=sqlSession.getMapper(iHotel.class);
//		ArrayList<Board> fc=fcontent.getBoardList();
		Board post=fcontent.getPost(post_code);
		model.addAttribute("post",post);
		System.out.println(session.getAttribute("user_type"));
		
//		session.setAttribute("u_type", member.getUser_type());
	//	model.addAttribute("user_type",session.getAttribute("user_type"));
		return "FAQContent";
	}
	@RequestMapping("/deletefaq")
//	@RequestMapping("/deletefaq/{post_code}")
//	public String DeleteFAQ(@PathVariable(value="post_code") int post_code) {
	public String DeleteFAQ(HttpServletRequest hsr) {
		int post_code=Integer.parseInt(hsr.getParameter("post_code"));
		iHotel faq=sqlSession.getMapper(iHotel.class);
		Board post=faq.getPost(post_code);
		faq.deleteBoard(post_code);
		return "redirect:/flist";
	}
	@RequestMapping("/fwrite")
	public String FAQWrite() {
		return "FAQWrite";
	}
	@RequestMapping("/admin_fwrite")
	public String Write(HttpServletRequest hsr,Model model) {
		int post_code=Integer.parseInt(hsr.getParameter("post_code"));
		iHotel faq=sqlSession.getMapper(iHotel.class);
		Board board=faq.getPost(post_code);
		model.addAttribute("board",board);
		return "FAQWrite";
	}
	@RequestMapping(value="/FAQWrite",method=RequestMethod.POST)
	public String FAQ(HttpServletRequest hsr) {
		String strcode=hsr.getParameter("post_code");
		String title=hsr.getParameter("title");
		String content=hsr.getParameter("content");
		iHotel FAQW=sqlSession.getMapper(iHotel.class);
		if(strcode.equals("") || strcode.equals(null)) {
			FAQW.addBoard(title, content);
		} else {
			int post_code=Integer.parseInt(strcode);
			FAQW.updateBoard(post_code, title, content);
		}
		return "redirect:/flist";
	}	
}
