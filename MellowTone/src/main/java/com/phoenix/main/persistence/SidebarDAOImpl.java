package com.phoenix.main.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.phoenix.main.domain.SidebarVO;


@Repository
public class SidebarDAOImpl implements SidebarDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<SidebarVO> select_produce() throws Exception {
		return session.selectList("sidebar.select_produce");
	}

	@Override
	public List<SidebarVO> select_gallery() throws Exception {
		return session.selectList("sidebar.select_gallery");
	}

	@Override
	public List<SidebarVO> select_item() throws Exception {
		return session.selectList("sidebar.select_item");
	}

	@Override
	public List<SidebarVO> select_picture() throws Exception {
		return session.selectList("sidebar.select_picture");
	}

	@Override
	public List<SidebarVO> select_mypage() throws Exception {
		return session.selectList("sidebar.select_mypage");
	}

	@Override
	public List<SidebarVO> select_community() throws Exception {
		return session.selectList("sidebar.select_community");
	}

	@Override
	public List<SidebarVO> select_reservation() throws Exception {
		return session.selectList("sidebar.select_reservation");
	}

}
