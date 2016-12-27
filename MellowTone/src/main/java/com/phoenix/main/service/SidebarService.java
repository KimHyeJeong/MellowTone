package com.phoenix.main.service;

import java.util.List;

import com.phoenix.main.domain.SidebarVO;


public interface SidebarService {
	public List<SidebarVO> select_produce()throws Exception;
	public List<SidebarVO> select_gallery()throws Exception;
	public List<SidebarVO> select_item()throws Exception;
	public List<SidebarVO> select_picture()throws Exception;
	public List<SidebarVO> select_mypage()throws Exception;
	public List<SidebarVO> select_community()throws Exception;
}
