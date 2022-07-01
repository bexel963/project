package com.my.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.app.domain.UserDto;
import com.my.app.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	UserService userService;
	
	@InitBinder
	void toDate(WebDataBinder binder) {
		// User클래스의 Date birth를 @DateTimeFormat(pattern="yyyy-MM-dd")private Date birth; 로 만들면 아래 두 줄과 같은 기능을 한다.
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));	// 변환등록기 등록 - false는 빈 값을 허용할건지 결정하는거
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String toRegisterForm() {
		
		return "main/registerForm";
	}
	
	@RequestMapping(value="/register/save", method=RequestMethod.POST)
	public String save(UserDto user, Model m, RedirectAttributes rattr) {
		
		try {
			
			System.out.println("user = " + user);
			int rowCnt = userService.registerUser(user);
			
			if(rowCnt!=1) {
				throw new Exception("user register error");
			}
			
			rattr.addFlashAttribute("msg", "REGISTER_OK");	
		} catch (Exception e) {
			
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "REGISTER_ERR");
		}
		
		return "redirect:/";
	}
	
	/* 아이디 중복검사 */
	@RequestMapping(value = "/dupCheck", method = RequestMethod.POST)		
	@ResponseBody
	public String dupCheck(String id) {
		UserDto user;
		try {
			user = userService.getUser(id);
			if(user == null) {
				return "not user";				
			}else {
				return "user";				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
