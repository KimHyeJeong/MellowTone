package com.phoenix.main.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.main.service.ItemService;
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
	public String item_detail(Model model, String name)throws Exception{
		model.addAttribute("title", "Item");
		model.addAttribute("list", sidebar_service.select_item());
		model.addAttribute("item", item_service.list_detail(name));
		model.addAttribute("body", "./item/item_list.jsp");
		return "mainview";
	}
}
