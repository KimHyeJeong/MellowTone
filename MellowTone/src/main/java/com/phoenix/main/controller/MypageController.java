package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		String id = request.getSession().getId();
		
		String post = request.getParameter("zip1") + '-' + request.getParameter("zip2");

		String phone = request.getParameter("phone") + '-' + request.getParameter("phone1") + '-'
				+ request.getParameter("phone2");
		String email = request.getParameter("email1") + '@' + request.getParameter("email2");
		
		vo= new MemberVO(Integer.parseInt(request.getParameter("no")),
				id,
				request.getParameter("pass1"),
				request.getParameter("pass2"),
				request.getParameter("username"),
				post,
				request.getParameter("address1"),
				request.getParameter("address2"),
				phone,
				email);
		
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
		
		service.update(vo);
		entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/deleteId")
	public void deleteId(Model model, HttpSession session)throws Exception{
		String id = ((MemberVO)session.getAttribute("login")).getId();
		System.out.println("ID="+id);
		String dpass = service.select(id).getPassword();
		System.out.println("DPASS="+dpass);
		
		model.addAttribute("LoginUser",dpass);
		service.delete(id);
		
	}
}
