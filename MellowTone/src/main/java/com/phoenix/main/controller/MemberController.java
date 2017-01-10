package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	public void insert(@RequestBody MemberVO vo, HttpServletRequest request)throws Exception{
		String post = request.getParameter("zip1") + '-' + request.getParameter("zip2");

		String phone = request.getParameter("phone1") + '-' + request.getParameter("phone2") + '-'
				+ request.getParameter("phone3");
		String email = request.getParameter("email1") + '@' + request.getParameter("email2");

		vo = new MemberVO(0, request.getParameter("id"), request.getParameter("pass1"),
				request.getParameter("pass2"), request.getParameter("name"), post, request.getParameter("address1"),
				request.getParameter("address2"), phone, email);

		service.insert(vo);
	}
	
	@RequestMapping("/login")
	public @ResponseBody String login(HttpSession session, String id, String password)throws Exception{
		String result="FAIL";
		id = service.select(id).getId();
		String dpass = service.select(id).getPassword();
		
		
		if(password.equals(dpass)){
			
			result="SUCCESS";
			
			session.setAttribute("login", service.login(id, dpass));
			
			
		}
		return result;
	}
	
	
	

}
