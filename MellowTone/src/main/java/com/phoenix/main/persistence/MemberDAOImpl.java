package com.phoenix.main.persistence;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public MemberVO login(String id, String password) throws Exception {
		Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("password", password);
		return sqlSession.selectOne("member.login", map);
	}

	@Override
	public MemberVO select(String id) throws Exception {
		return sqlSession.selectOne("member.select", id);
	}

	@Override
	public MemberVO check(String id) throws Exception {
		return sqlSession.selectOne("member.check", id);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		sqlSession.update("member.update", vo);
	}

	
	
}
