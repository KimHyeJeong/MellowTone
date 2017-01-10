package com.phoenix.community.service;

import java.util.List;

import com.phoenix.community.domain.BoardVO;
import com.phoenix.community.domain.SearchCriteria;

public interface BoardService {
	public List<BoardVO> select_list(SearchCriteria cri)throws Exception;
	public String select_title(int tno)throws Exception;
	public BoardVO select_page(int bno)throws Exception;
	public int listCount(int tno)throws Exception;
	public void insert(BoardVO board)throws Exception;
	public void delete(int bno)throws Exception;
	public void update(BoardVO board)throws Exception;
	public int select_prevbno(int bno) throws Exception;
	public int select_nextbno(int bno) throws Exception;
	public void update_viewcnt(int bno)throws Exception;
}
