package com.human.cafe;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.cafe.iCafe;

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
		iCafe cafe=sqlSession.getMapper(iCafe.class);
//		ArrayList<Menu> ml=cafe.getMenuList();
//		System.out.println("menu length:"+ml.size());
		model.addAttribute("ml",cafe.getMenuList());
		return "home";
	}
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.POST,
					produces="application/json;charset=utf-8")
	public String list() {
		iCafe cafe=sqlSession.getMapper(iCafe.class);
		ArrayList<Menu> ml=cafe.getMenuList();
		//JSONOBject -> JSONArray -> toString -> write().print()
		// [{name:'americano',price:2000},{name:'mocca',price:3500}]
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("code",ml.get(i).getCode());
			jo.put("name",ml.get(i).getName());
			jo.put("price",ml.get(i).getPrice());
			ja.add(jo);
		}
		return ja.toString();
	}
}
