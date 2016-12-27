<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
     var ud;
     var id;

     function check(ud, id){
    	 this.ud = ud;
    	 this.id = id;
    	 
    	 if(ud=='delete'){
   	       location.href='list.do?control=review&action=delete&id='+id;
    	 }else{//수정버튼을 눌렀을 때
    		 location.href='contents.do?control=review&action=select&id='+id;
    	 } 
   }
  </script>
</head>
<body>
<center>
<font color="blue" size="22">Q&A (수정)</font><br><br>
<form action="list.do?control=review&action=update&id=<%=request.getParameter("id") %>" method="post" name="frm">
	<table border="2" cellpadding="1" width="500" align="center">
		<tr>
			<td width="20%" align="center">제목</td>
			<td width="80%"><input type="text" name="title" value="${dto.title}"></td>
		</tr>
		<tr>
			<td align="center">작성자</td>
			<td colspan="2">${dto.writer }</td>
		</tr>
		<tr>
			<td align="center">사진첨부</td>
			<td colspan="2"><input type="text" name="image"></td>
		</tr>
		<tr>
			<td colspan="3" align="center">내용</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><textarea rows="25" cols="66" name="contents">${dto.contents}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="3" align="right">
			<input type="submit" value="수정"/>
			<input type="button" value="삭제" onclick="check('delete',  <%=request.getParameter("id") %>)"/>
			<input type="button" value="취소" onclick="check('cancel',  <%=request.getParameter("id") %>)"/></td>
		</tr>	
	</table>
</form>
</center>
</body>
</html>