package com.phoenix.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.phoenix.main.domain.SidebarVO;
import com.phoenix.main.persistence.SidebarDAO;

@Service
public class SidebarServiceImpl implements SidebarService {

	@Inject
	SidebarDAO dao;
	
	@Override
	public List<SidebarVO> select_produce() throws Exception {
		return dao.select_produce();
	}

	@Override
	public List<SidebarVO> select_gallery() throws Exception {
		return dao.select_gallery();
	}

	@Override
	public List<SidebarVO> select_item() throws Exception {
		return dao.select_item();
	}

	@Override
	public List<SidebarVO> select_picture() throws Exception {
		return dao.select_picture();
	}

}
