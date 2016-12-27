package com.phoenix.main.persistence;

import com.phoenix.main.domain.MemberVO;

public interface MemberDAO {
	public void insert(MemberVO vo)throws Exception;
}
