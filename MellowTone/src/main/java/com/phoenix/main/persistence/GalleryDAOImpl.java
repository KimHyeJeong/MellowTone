package com.phoenix.main.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.phoenix.main.domain.GalleryVO;

@Repository
public class GalleryDAOImpl implements GalleryDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<GalleryVO> select(int num) throws Exception {
		return session.selectList("gallery.select", num);
	}

}
