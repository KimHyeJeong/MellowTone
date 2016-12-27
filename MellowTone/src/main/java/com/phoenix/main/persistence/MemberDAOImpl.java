package com.phoenix.main.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.phoenix.main.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(MemberVO vo) throws Exception {
		sqlSession.insert("member.insert", vo);
	}

	
	
}
