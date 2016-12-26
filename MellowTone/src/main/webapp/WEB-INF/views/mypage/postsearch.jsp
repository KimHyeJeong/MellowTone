<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String search = request.getParameter("addr") == null ? "뷁" : request.getParameter("addr");

	PostDAO dao = new PostDAO();
	ArrayList<PostVO> list = dao.getAddrs(search); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소검색</title>
</head>
<body>
	<form action="postsearch.jsp">
		주소검색 : <input type="text" name="addr" /><input type="submit" value="검색">
		<table border="1">
			<tr>
				<td width="100">우편번호</td>
				<td width="600">주소</td>
			</tr>
			<% for(int i=0; i < list.size(); i++){ %>
					<tr>
						<td><%=list.get(i).getZipcode() %></td>
						<td><%=list.get(i).getAddrs() %></td>
					</tr>
					
			<% } %>
		</table>
	</form>
</body>
</html>