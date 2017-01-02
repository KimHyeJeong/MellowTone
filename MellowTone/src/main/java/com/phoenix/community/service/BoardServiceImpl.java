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

}
