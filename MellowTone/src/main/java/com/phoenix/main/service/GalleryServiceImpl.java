package com.phoenix.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.phoenix.main.domain.GalleryVO;
import com.phoenix.main.persistence.GalleryDAO;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Inject
	GalleryDAO dao;
	
	@Override
	public List<GalleryVO> select(int num) throws Exception {
		return dao.select(num);
	}

}
