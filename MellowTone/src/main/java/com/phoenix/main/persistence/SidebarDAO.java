package com.phoenix.main.persistence;

import java.util.List;

import com.phoenix.main.domain.SidebarVO;

public interface SidebarDAO {
	public List<SidebarVO> select_produce()throws Exception;
	public List<SidebarVO> select_gallery()throws Exception;
	public List<SidebarVO> select_item()throws Exception;
	public List<SidebarVO> select_picture()throws Exception;
}
