package com.phoenix.main.persistence;

import java.util.List;

import com.phoenix.main.domain.ItemVO;

public interface ItemDAO {
	public List<ItemVO> list(int no)throws Exception;
	public ItemVO list_detail(String item)throws Exception;
}
