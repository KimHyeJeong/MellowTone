package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.main.domain.MemberVO;
import com.phoenix.main.service.MemberService;

@Controller
@RequestMapping("/Main")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping("/insert")
	public void insert(MemberVO vo)throws Exception{
		service.insert(vo);
	}
	
	
	@RequestMapping("/login")
	public void login(HttpSession session, String id, String password)throws Exception{
		String dpass = service.select(id).getPassword();
		
		if(password.equals(dpass)){
			
			session.setAttribute("login", service.login(id, password));
		}
	}
}
