<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	
		.border1{
	border: solid #b9b9b9 1px; 
	border-top:0; 
	border-left: 0; 
	border-right:0;
	  
	}
	.border2{
	border: solid #b9b9b9 2px; 
	border-top:0; 
	border-left: 0; 
	border-right:0;  
	}
	
		.button2{
	  border:0;
	  height:35px;
	  color:#fff;
	  background-color: #545250;
	  cursor: pointer;
	  font-size: 18px;
	}

</style>


</head>
<body>
<center>
<form action="notice.do?action=insertpage" method="post">
	<table cellpadding="8" style=" font-size:18px; border-collapse:collapse; line-height:30px;" width="900px" >
				<tr style="font-size: 30px; font-weight: bold;"><td align="center" class="border2" colspan="4" height="110px" align="center">NOTICE</td></tr>
		<tr height="35px" bgcolor="#dae6f4">
			<th class="border1" width="10%" >번호</th>
			<th class="border1" width="60%" >제목</th>
			<th class="border1" width="10%" >작성자</th>
			<th class="border1" width="20%" >작성일</th>
		</tr>
		
		<core:forEach items="${notice}" var="notice" begin="0" end="15" varStatus="stat">
		<tr>
			<td class="border1" align="center">${stat.count + (page-1)*10}</td>
			<td class="border1" align="center"><a href="notice.do?action=select&no=${notice.no}&page=${page}">${notice.title}</a></td>
			<td class="border1" align="center">관리자</td>
			<td class="border1" align="center">${notice.gdate}</td>
		</tr>
		</core:forEach>
		<%if("admin".equals(session.getAttribute("id"))){ %>
        	<tr><td height="50px" align="right" colspan="4"><input type="submit" value="글쓰기" class="button2"/></td></tr>
       	<%} %>
        <tr><td align="center" colspan="4">
    <core:if test="${page==1}">이전</core:if>
	<core:if test="${page>1}"><a href="notice.do?action=list&page=${page-1}">이전</a></core:if>
	<core:if test="${page==pageCount}">다음</core:if>
	<core:if test="${page<pageCount}"><a href="notice.do?action=list&page=${page+1}">다음</a></core:if></td></tr>			
	    <tr height="100px"></tr>
	</table>
	
	
	
	</form>
	
</center>
</body>
</html>