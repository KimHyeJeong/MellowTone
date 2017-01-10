package com.phoenix.community.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phoenix.community.domain.BoardVO;
import com.phoenix.community.domain.PageMaker;
import com.phoenix.community.domain.SearchCriteria;
import com.phoenix.community.service.BoardService;
import com.phoenix.main.service.SidebarService;

@Controller
@RequestMapping("/MellowTone")
public class BoardController {
	
	@Inject
	BoardService service;
	
	@Inject
	SidebarService sidebar_service;
	
	@RequestMapping("/boardlist")
	public String listPage(@ModelAttribute("cri") SearchCriteria cri ,Model model, int tno, HttpSession session)throws Exception{
		model.addAttribute("title", "Community");
		model.addAttribute("semititle", service.select_title(tno));
		model.addAttribute("list", sidebar_service.select_community());
		model.addAttribute("board", service.select_list(cri));
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.listCount(cri.getTno()));
		
		model.addAttribute("pageMaker", maker);
		model.addAttribute("body", "./community/boardlist.jsp");
		return "mainview";
	}
	
	//입력폼요청
	@RequestMapping(value = "/boardinput", method = RequestMethod.GET)
	public String inputpageGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("title", service.select_title(cri.getTno()));
		model.addAttribute("body", "./community/boardinput.jsp");

		return "mainview";
	}
	
	//입력
	@RequestMapping(value = "/boardinput", method = RequestMethod.POST)
	public String inputpagePOST(HttpServletRequest request, MultipartFile file, BoardVO board, RedirectAttributes attr,
			HttpSession session) throws Exception {

		System.out.println(session.getAttribute("id"));
		board.setWriter((String) session.getAttribute("id"));
		
		
		//여기서부터
		board.setImage("");
		String savedName = file.getOriginalFilename();
		if (savedName != "") {
			UUID uid = UUID.randomUUID();      
		    savedName = uid.toString()+"_"+savedName;
		    String uploadpath = request.getSession().getServletContext().getRealPath("/resources/upload");
			File target = new File(uploadpath, savedName);
			FileCopyUtils.copy(file.getBytes(), target);

			board.setImage("/resources/upload/" + savedName);
		}
		//여기까지
		service.insert(board);

		return "redirect:/MellowTone/boardlist?tno=" + board.getTno();
	}

}
