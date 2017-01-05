package com.phoenix.main.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.main.domain.MemberVO;
import com.phoenix.main.domain.PostVO;
import com.phoenix.main.persistence.PostDAO;
import com.phoenix.main.service.MemberService;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Inject
	private MemberService service;
	
	
	@RequestMapping("/confirmid_check")
	 public void idcheck()throws Exception{}
	
	@RequestMapping("/Id_check2")
	public void Id_check2(String id,Model model)throws Exception{
		MemberVO vo = service.check(id);
		model.addAttribute("idcheck", vo);
		model.addAttribute("id",id);
	}
	
	@RequestMapping("/zip_check")
	public void zipcheck(HttpServletRequest request)throws Exception{
		String search = request.getParameter("addr") == null ? "ÆR" : request.getParameter("addr");

		   PostDAO dao = new PostDAO();
		   ArrayList<PostVO> list = dao.getAddrs(search); 
		   request.setAttribute("list",list);
		
	}
	
	@RequestMapping("/logout")
	public void logout()throws Exception{}
}
