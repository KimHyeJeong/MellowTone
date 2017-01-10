package com.phoenix.main.service;

import com.phoenix.main.domain.MemberVO;

public interface MemberService {
	public void insert(MemberVO vo)throws Exception;
	public MemberVO login(String id, String password)throws Exception;
	public MemberVO select(String id)throws Exception;
	public MemberVO check(String id)throws Exception;
	public void update(MemberVO vo)throws Exception;
}
