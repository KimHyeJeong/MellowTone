package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.main.domain.MemberVO;
import com.phoenix.main.domain.PictureVO;
import com.phoenix.main.service.ItemService;
import com.phoenix.main.service.MemberService;
import com.phoenix.main.service.PictureService;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	private MemberService service;
	
	@Inject
	private PictureService picservice;
	
	@Inject
	private ItemService Itemservice;
	
	@RequestMapping("/update")
	public ResponseEntity<String> update(MemberVO vo,HttpServletRequest request)throws Exception{
		ResponseEntity<String> entity = null;
		String id = request.getSession().getId();
		
		String post = request.getParameter("zip1") + '-' + request.getParameter("zip2");

		String phone = request.getParameter("phone") + '-' + request.getParameter("phone1") + '-'
				+ request.getParameter("phone2");
		String email = request.getParameter("email1") + '@' + request.getParameter("email2");
		
		vo.setPost(post);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setPassword(vo.getPassword());

		service.update(vo);
		entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/inpocket")
	public void inpocket(Model model,@RequestParam("no") int no)throws Exception{
		
		model.addAttribute("picture", picservice.select_picture(no));
		
	}
	
	@RequestMapping("/inpocket2")
	public void inpocket2(Model model,@RequestParam("name") String name)throws Exception{
		
		model.addAttribute("item", Itemservice.list_detail(name));
		
	}
	
}
