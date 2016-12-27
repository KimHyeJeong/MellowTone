package com.phoenix.main.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.phoenix.main.domain.PostVO;
import com.phoenix.util.ConnectionUtil;




public class PostDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public PostDAO() throws SQLException{
		conn = ConnectionUtil.getConnection();
	}
	
	public ArrayList<PostVO> getAddrs(String search) throws SQLException{
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ZIP_CODE, ADDRS FROM POST_TABLE WHERE ADDRS LIKE '%'|| :search ||'%' ");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, search);		
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			PostVO vo = new PostVO();
			vo.setZipcode(rs.getInt("ZIP_CODE"));
			vo.setAddrs(rs.getString("ADDRS"));
			list.add(vo);
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		return list;
	}
}
