package com.phoenix.main.persistence;

import java.util.List;

import com.phoenix.main.domain.GalleryVO;

public interface GalleryDAO {
	public List<GalleryVO> select(int num)throws Exception;
}
