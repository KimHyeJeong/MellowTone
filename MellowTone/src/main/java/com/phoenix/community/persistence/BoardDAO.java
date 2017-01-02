package com.phoenix.community.persistence;

import java.util.List;

import com.phoenix.community.domain.BoardVO;
import com.phoenix.community.domain.SearchCriteria;

public interface BoardDAO {
	public List<BoardVO> select_list(SearchCriteria cri)throws Exception;
	public String select_title(int tno)throws Exception;
	public BoardVO select_page(int bno)throws Exception;
	public int listCount(int tno)throws Exception;
}
