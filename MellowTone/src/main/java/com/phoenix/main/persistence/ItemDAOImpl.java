package com.phoenix.main.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.phoenix.main.domain.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<ItemVO> list(int no) throws Exception {
		return session.selectList("item.list", no);
	}

	@Override
	public ItemVO list_detail(String item) throws Exception {
		return session.selectOne("item.list_detail", item);
	}

}
