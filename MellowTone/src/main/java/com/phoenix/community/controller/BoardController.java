package com.phoenix.community.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.community.domain.BoardVO;
import com.phoenix.community.domain.PageMaker;
import com.phoenix.community.domain.SearchCriteria;
import com.phoenix.community.service.BoardService;

@Controller
@RequestMapping("/MellowTone")
public class BoardController {
	
	@Inject
	BoardService service;
	
	@RequestMapping("/boardlist")
	public String listPage(@ModelAttribute("cri") SearchCriteria cri ,Model model)throws Exception{
		model.addAttribute("list", service.select_list(cri));
		List<BoardVO> boardvo = service.select_list(cri);
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.listCount(cri.getTno()));
		
		model.addAttribute("pageMaker", maker);
		model.addAttribute("title", service.select_title(cri.getTno()));
		model.addAttribute("body", "./community/boardlist.jsp");
		return "mainview";
	}

}
