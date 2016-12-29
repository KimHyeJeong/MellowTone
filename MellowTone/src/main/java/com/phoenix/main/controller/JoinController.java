package com.phoenix.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.main.domain.PostVO;
import com.phoenix.main.persistence.PostDAO;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	@RequestMapping("/confirmid_check")
	 public void idcheck()throws Exception{}
	
	@RequestMapping("/Id_check2")
	public void Id_check2()throws Exception{}
	
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
