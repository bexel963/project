package com.my.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
		
	@RequestMapping("/")
	public String openTilesView(Model m) throws Exception{
		
	    m.addAttribute("setHeader", "≈∏¿œ¡Ó");
	    return "/main/index";
	}
	
}
