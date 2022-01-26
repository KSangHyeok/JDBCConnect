package com.human.Login;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletRequest;
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

import com.human.Login.iLogin;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	@RequestMapping(value = "/signon", method = RequestMethod.GET)
	public String signon(Model model) {
		return "signon";
	}
	@ResponseBody
	@RequestMapping(value = "/signon_check", method = RequestMethod.POST,
					produces="application/json;charset=utf-8")
	public String signon_check(HttpServletRequest hsr) {
		String retval="";
	
		try{
			String name=hsr.getParameter("name");
		String gender=hsr.getParameter("gender");
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		String interest=hsr.getParameter("interest");
		
		iLogin login=sqlSession.getMapper(iLogin.class);
		login.insertSignon(name,gender,userid,passcode,interest);
			retval="ok";
		}catch(Exception e) {
	         retval="fail";
	      }
		return retval;
	}
	@ResponseBody
	@RequestMapping(value="/login_check",method=RequestMethod.POST,
				produces="application/json;charset=utf-8")
	public String login_check() {
		iLogin login=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> ml=login.getLogin();
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
		JSONObject jo=new JSONObject();
		jo.put("userid",ml.get(i).getUserid());
		jo.put("passcode",ml.get(i).getPasscode());
		ja.add(jo);
		}
	return ja.toString();
	}
	@ResponseBody
	   @RequestMapping(value = "/updateLogin", method= RequestMethod.POST,
			   produces="application/json;charset=utf-8")
	   public String updateLogin(HttpServletRequest hsr, HttpServletRequest request) {
	      String retval="";
	      try {	         
	         String userid=hsr.getParameter("userid");	         
	         System.out.print(userid);
	         iLogin login=sqlSession.getMapper(iLogin.class);
	         login.updateLogin(userid);
	         retval="ok";
	        
			
			HttpSession session = request.getSession(true);
			session.setAttribute("userid",hsr.getParameter("userid"));
	         
	      } catch(Exception e) {
	         retval="fail";
	      }
	      return retval;
	   }
	@RequestMapping(value = "/logout_check", method = RequestMethod.GET,
					produces="application/json;charset=utf-8")
	public String logout_check(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userid=(String)session.getAttribute("userid");
		
		iLogin login=sqlSession.getMapper(iLogin.class);
		login.updateLogout(userid);
		session.invalidate();
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping(value="/name_check",method=RequestMethod.POST,
				produces="application/json;charset=utf-8")
	public String name_check() {
		iLogin login=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> ml=login.getLogin();
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
		JSONObject jo=new JSONObject();
		jo.put("userid",ml.get(i).getUserid());
		jo.put("passcode",ml.get(i).getPasscode());
		ja.add(jo);
		}
	return ja.toString();
	}
	
}
