package com.phoenix.main.service;

import com.phoenix.main.domain.PictureVO;

public interface PictureService {
	public PictureVO select(int no)throws Exception;
	public PictureVO select_picture(int no)throws Exception;
}
