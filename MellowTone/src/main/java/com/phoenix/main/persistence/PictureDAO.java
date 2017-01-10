package com.phoenix.main.persistence;

import com.phoenix.main.domain.PictureVO;

public interface PictureDAO {
	public PictureVO select(int no)throws Exception;
	public PictureVO select_picture(int no)throws Exception;
}
