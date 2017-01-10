package com.phoenix.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.phoenix.community.domain.BoardVO;
import com.phoenix.community.domain.SearchCriteria;
import com.phoenix.community.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> select_list(SearchCriteria cri) throws Exception {
		return dao.select_list(cri);
	}

	@Override
	public String select_title(int tno) throws Exception {
		return dao.select_title(tno);
	}

	@Override
	public BoardVO select_page(int bno) throws Exception {
		return dao.select_page(bno);
	}

	@Override
	public int listCount(int tno) throws Exception {
		return dao.listCount(tno);
	}

	@Override
	public void insert(BoardVO board) throws Exception {
		dao.insert(board);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public void update(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public int select_prevbno(int bno) throws Exception {
		return dao.select_prevbno(bno);
	}

	@Override
	public int select_nextbno(int bno) throws Exception {
		return dao.select_nextbno(bno);
	}

	@Override
	public void update_viewcnt(int bno) throws Exception {
		dao.update_viewcnt(bno);
	}

}
