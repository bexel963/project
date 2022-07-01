package com.my.app.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.app.domain.UserDto;
import com.my.app.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String toLoginForm() {
		
		return "/main/loginForm";
	}
	
	@RequestMapping(value="/login/login", method=RequestMethod.POST)
	public String goLogin(Model m, String toURL, String id, String pwd, boolean rememberId, RedirectAttributes rattr, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			UserDto dto = userService.getUser(id);
					
			if(!userService.idCheck(id, pwd)) {
				rattr.addFlashAttribute("msg", "LOGIN_ERR");
				return "redirect:/login";
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("grade", dto.getGrade());
			
			if(rememberId) {
				Cookie cookie = new Cookie("id", id);			
				response.addCookie(cookie);						
			}else {
				Cookie cookie = new Cookie("id", id);			
				cookie.setMaxAge(0);							
				response.addCookie(cookie);						
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		toURL = toURL == null || toURL.equals("") ? "/" : toURL;
				
		return "redirect:"+toURL;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String goLogOut(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
}
