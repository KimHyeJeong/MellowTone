package com.phoenix.community.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.phoenix.community.domain.BoardVO;
import com.phoenix.community.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<BoardVO> select_list(SearchCriteria cri) throws Exception {
		return session.selectList("board.select_list",cri, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public String select_title(int tno) throws Exception {
		return session.selectOne("board.select_title", tno);
	}

	@Override
	public BoardVO select_page(int bno) throws Exception {
		return session.selectOne("board.select_page", bno);
	}

	@Override
	public int listCount(int tno) throws Exception {
		return session.selectOne("board.listcount", tno);
	}

	@Override
	public void insert(BoardVO board) throws Exception {
		session.insert("board.insert", board);
	}

	@Override
	public void delete(int bno) throws Exception {
		session.delete("board.delete", bno);
	}

	@Override
	public void update(BoardVO board) throws Exception {
		session.update("board.update", board);
	}

}
