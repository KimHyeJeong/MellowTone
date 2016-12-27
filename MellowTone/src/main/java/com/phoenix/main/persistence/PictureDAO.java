package com.phoenix.main.persistence;

import com.phoenix.main.domain.PictureVO;

public interface PictureDAO {
	public PictureVO select(int no)throws Exception;
}
