package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public @ResponseBody String login(HttpSession session, String id, String password)throws Exception{
		String result="FAIL";
		System.out.println("password="+password);
		/*String dpass = service.select(id).getPassword();
		System.out.println("dpass="+dpass);*/
		
		if(password.equals("1234")){
			System.out.println("여기?");
			result="SUCCESS";
			System.out.println("여기2?");
			session.setAttribute("login", service.login(id, password));
			System.out.println("여기3?");
		}
		return result;
	}
}
