package com.phoenix.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.phoenix.main.domain.PictureVO;
import com.phoenix.main.persistence.PictureDAO;

@Service
public class PictureServiceImpl implements PictureService {

	@Inject
	PictureDAO dao;
	
	@Override
	public PictureVO select(int no) throws Exception {
		return dao.select(no);
	}

	@Override
	public PictureVO select_picture(int no) throws Exception {
		return dao.select_picture(no);
	}

}
