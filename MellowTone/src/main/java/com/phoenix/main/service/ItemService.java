package com.phoenix.main.service;

import java.util.List;

import com.phoenix.main.domain.ItemVO;

public interface ItemService {
	public List<ItemVO> list(int no)throws Exception;
	public ItemVO list_detail(String name)throws Exception;
}
