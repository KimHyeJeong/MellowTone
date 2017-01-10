package com.phoenix.main.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.main.domain.MemberVO;
import com.phoenix.main.service.GalleryService;
import com.phoenix.main.service.ItemService;
import com.phoenix.main.service.MemberService;
import com.phoenix.main.service.PictureService;
import com.phoenix.main.service.SidebarService;

@Controller
@RequestMapping("/MellowTone")
public class MainController {
   
   @Inject
   private SidebarService sidebar_service;
   
   @Inject
   private PictureService picture_service;
   
   @Inject
   private ItemService item_service;
   
   @Inject
   private GalleryService gallery_service;
   
   @Inject
   private MemberService service;
   
   @RequestMapping("/main")
   public String main(Model model)throws Exception{
      model.addAttribute("body", "./main/main.jsp");
      return "mainview";
   }
   
   @RequestMapping("/produce")
   public String produce(Model model)throws Exception{
      model.addAttribute("title", "Produce");
      model.addAttribute("list", sidebar_service.select_produce());
      model.addAttribute("body", "./produce/selfwedding.jsp");
      return "mainview";
   }
   
   @RequestMapping("/picture")
   public String picture(Model model, int no)throws Exception{
      model.addAttribute("title", "Picture");
      model.addAttribute("list", sidebar_service.select_picture());
      model.addAttribute("picture", picture_service.select(no));
      model.addAttribute("body", "./picture/picture.jsp");
      return "mainview";
   }
   
   @RequestMapping("/item")
   public String item(Model model, int no)throws Exception{
      model.addAttribute("title", "Item");
      model.addAttribute("list", sidebar_service.select_item());
      model.addAttribute("item", item_service.list(no));
      model.addAttribute("body", "./item/item_list.jsp");
      return "mainview";
   }
   
   @RequestMapping("/item_detail")
   public String item_detail(Model model, String item)throws Exception{
      model.addAttribute("title", "Item");
      model.addAttribute("list", sidebar_service.select_item());
      model.addAttribute("item", item_service.list_detail(item));
      model.addAttribute("body", "./item/item_detail.jsp");
      return "mainview";
   }
   
   @RequestMapping("/gallery")
   public String gallery(Model model, int no)throws Exception{
      model.addAttribute("title", "Gallery");
      model.addAttribute("list", sidebar_service.select_gallery());
      if(no==11){
    	  model.addAttribute("semititle", "REGULAR GALLERY");
      }else if(no==12){
    	  model.addAttribute("semititle", "NATURAL LIGHT GALLERY");
      }else if(no==13){
    	  model.addAttribute("semititle", "STUDIO GALLERY");
      }else if(no==14){
    	  model.addAttribute("semititle", "OUTER GALLERY");
      }
      model.addAttribute("gallery", gallery_service.select(no));
      model.addAttribute("body", "./gallery/gallery_list.jsp");
      return "mainview";
   }
   
   @RequestMapping("/mypage")
   public String mypage(Model model,HttpSession session)throws Exception{
	   String id = ((MemberVO)session.getAttribute("login")).getId();
	   
      
      model.addAttribute("title","Mypage");
      model.addAttribute("list",sidebar_service.select_mypage());
	
		MemberVO vo = service.check(id);
		String post = vo.getPost();
		String phone = vo.getPhone();
		String email = vo.getEmail();
		
		String[] firstPost = post.split("-");
		String[] firstPhone = phone.split("-");
		String[] firstEmail = email.split("@");
		
		session.setAttribute("LoginUser", vo );
		session.setAttribute("firstPost", firstPost);
		session.setAttribute("firstPhone", firstPhone);
		session.setAttribute("firstEmail", firstEmail);
		
		model.addAttribute("body","./mypage/member_check.jsp");
		
      return "mainview";
   }
   
   @RequestMapping("/join")
   public String join(Model model)throws Exception{
      model.addAttribute("body","./join/join_attention.jsp");
      return "mainview";
   }
   
   @RequestMapping("/login")
   public String login(Model model)throws Exception{
	   model.addAttribute("body","./join/login_form.jsp");
	   return "mainview";
   }
   
   //mypage 부분
   @RequestMapping("/check")
   public String check(Model model)throws Exception{
	   model.addAttribute("title","Mypage");
	   model.addAttribute("list",sidebar_service.select_mypage());
	   model.addAttribute("body","./mypage/member_check.jsp");
	   
	   return "mainview";
   }
   
   @RequestMapping("/update")
   public String update(Model model,HttpSession session)throws Exception{
	   String id = ((MemberVO)session.getAttribute("login")).getId();
	   String dpass = service.select(id).getPassword();
	   
	   model.addAttribute("title","Mypage");
	   model.addAttribute("list",sidebar_service.select_mypage());
	   model.addAttribute("body","./mypage/pass_check.jsp");
	   
	   model.addAttribute("LoginUser", dpass);
	   
	   return "mainview";
   }
   
   @RequestMapping("/update_form")
   public String update_form(Model model,HttpSession session)throws Exception{
	   String id = ((MemberVO)session.getAttribute("login")).getId();
	   
	   model.addAttribute("title","Mypage");
	   model.addAttribute("list",sidebar_service.select_mypage());
	   model.addAttribute("body","./mypage/member_edit.jsp");
	   
	   model.addAttribute("user", service.check(id));
	   
	   
	   return "mainview";
   }
   
   @RequestMapping("/delete")
   public String delete(Model model)throws Exception{
	   model.addAttribute("title","Mypage");
	   model.addAttribute("list",sidebar_service.select_mypage());
	   model.addAttribute("body","./mypage/delete_check.jsp");
	   
	   return "mainview";
   }
   
   @RequestMapping("/pocket")
   public String pocket(Model model)throws Exception{
	   model.addAttribute("title","Mypage");
	   model.addAttribute("list",sidebar_service.select_mypage());
	   model.addAttribute("body","./mypage/pocket_list.jsp");
	   
	   return "mainview";
   }
   
   //회원가입쪽 
   @RequestMapping("/joinform")
   public String joinform(Model model)throws Exception{
	   model.addAttribute("body","./join/join_form.jsp");
	   
	   return "mainview";
   }
   
   @RequestMapping("/findId")
   public String findId(Model model)throws Exception{
	   model.addAttribute("body","./join/search_id.jsp");
	   
	   return "mainview";
   }
   
   @RequestMapping("/findPass")
   public String findPass(Model model)throws Exception{
	   model.addAttribute("body","./join/search_pass.jsp");
	   
	   return "mainview";
   }
   
  
   
   
   
   

}