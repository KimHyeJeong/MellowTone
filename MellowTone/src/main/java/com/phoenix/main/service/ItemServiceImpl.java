package com.phoenix.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.phoenix.main.domain.ItemVO;
import com.phoenix.main.persistence.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	ItemDAO dao;
	
	@Override
	public List<ItemVO> list(int no) throws Exception {
		return dao.list(no);
	}

	@Override
	public ItemVO list_detail(String name) throws Exception {
		return dao.list_detail(name);
	}

}
