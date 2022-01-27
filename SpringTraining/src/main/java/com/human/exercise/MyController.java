package com.human.exercise;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
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
