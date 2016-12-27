package com.phoenix.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.phoenix.main.domain.MemberVO;
import com.phoenix.main.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public void insert(MemberVO vo) throws Exception {
		dao.insert(vo);
	}

}
