package com.phoenix.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/MellowTone")
public class MainController {
	
	@RequestMapping("/main")
	public String text(Model model)throws Exception{
		model.addAttribute("body", "./main/main.jsp");
		return "mainview";
	}
}
