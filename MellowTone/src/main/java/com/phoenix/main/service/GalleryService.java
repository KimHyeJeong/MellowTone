package com.phoenix.main.service;

import java.util.List;

import com.phoenix.main.domain.GalleryVO;

public interface GalleryService {
	public List<GalleryVO> select(int num)throws Exception;
}
