package com.phoenix.main.service;

import java.util.Map;

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

	@Override
	public MemberVO login(String id, String password) throws Exception {
		
		return dao.login(id, password);
	}

	@Override
	public MemberVO select(String id) throws Exception {
		return dao.select(id);
	}

	@Override
	public int checkId(String id) throws Exception {
		return dao.checkId(id);
	}
	
	@Override
	public MemberVO check(String id) throws Exception {
		return dao.check(id);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(String id) throws Exception {
		dao.delete(id);
	}

}
