package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.main.domain.MemberVO;
import com.phoenix.main.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	private MemberService service;
	
	@RequestMapping("/update")
	public ResponseEntity<String> update(MemberVO vo,HttpServletRequest request)throws Exception{
		ResponseEntity<String> entity = null;
		String id = ((MemberVO)request.getSession().getAttribute("login")).getId();
		
		String post = request.getParameter("zip1") + '-' + request.getParameter("zip2");

		String phone = request.getParameter("phone") + '-' + request.getParameter("phone1") + '-'
				+ request.getParameter("phone2");
		String email = request.getParameter("email1") + '@' + request.getParameter("email2");
		
		vo = new MemberVO(0, request.getParameter("id"), request.getParameter("pass1"),
				request.getParameter("pass2"), request.getParameter("name"), post, request.getParameter("address1"),
				request.getParameter("address2"), phone, email);

		vo = service.check(id);
		post = vo.getPost();
		phone = vo.getPhone();
		email = vo.getEmail();

		String[] firstPost = post.split("-");
		String[] firstPhone = phone.split("-");
		String[] firstEmail = email.split("@");

		request.getSession().setAttribute("user", vo);
		request.setAttribute("firstPost", firstPost);
		request.setAttribute("firstPhone", firstPhone);
		request.setAttribute("firstEmail", firstEmail);
		
		
		System.out.println("¿©±â!");
		service.update(vo);
		System.out.println("¹Ù²ñ?");
		entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		System.out.println("‰ç´Ù!");
		
		return entity;
		
	}
}
