package com.phoenix.main.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.phoenix.main.domain.PictureVO;

@Repository
public class PictureDAOImpl implements PictureDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public PictureVO select(int no) throws Exception {
		return session.selectOne("picture.select", no);
	}

}
