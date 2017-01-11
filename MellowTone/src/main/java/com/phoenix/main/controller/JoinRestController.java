package com.phoenix.main.controller;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phoenix.main.service.MemberService;

@RestController
@RequestMapping("/MellowTone")
public class JoinRestController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping("/join/confirmid_check2")
	public String checkId(String userid)throws Exception{
		int result = service.checkId(userid);
		if(result==1){
			return "un1";
		}else if(result==0){
			if(!(Pattern.matches("^[a-zA-Z0-9]*$", userid)&&userid.length()>=5&&userid.length()<=10)) return "un2";
			else return "ava";
		}
		return "";
	}

}
