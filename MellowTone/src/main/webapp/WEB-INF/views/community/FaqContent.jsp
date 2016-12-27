<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

.border1 {
	border: solid #b9b9b9 1px;
	border-top: 0;
}

.border2 {
	border: solid #b9b9b9 1px;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.button1 {
	border: 0;
	height: 28px;
	color: #fff;
	background-color: #704d1a;
	cursor: pointer;
	font-size: 13px;
}

.view1, .view2, .view3 {
	border: 0;
	height: 30px;
	color: #fff;
	background-color: #545250;
	cursor: pointer;
	font-size: 18px;
}

.ttr {
	width: 900px;
	height: 500px;
	margin: 0;
	border: 0;
	
}

</style>

<script type="text/javascript">
<%-- window.onload = function(){
	
	<%
		FaqDTO dto = (FaqDTO)request.getAttribute("dto");
		String buf_visible = dto.getVisible();
		String buf_writer = dto.getWriter();
		String buf_id =  (String)session.getAttribute("id");
		String admin = "admin";
		if(buf_visible.equals("0") &&
				!(buf_writer.equals(buf_id))&&
				!(admin.equals(buf_id))){%>
			alert("해당 게시물을 볼 권한이 없습니다");
			location.href="faq.do" 
	<%}%>
}

$(document).ready(function(){
	$(".view2").hide();	

	$('#update').click(function(){
		<%
			if(buf_writer.equals(buf_id)){
		%>
		$('#title').attr("readonly", false);
		$('#content').attr("readonly", false);
		$('#content').focus();
		
		$('#category').attr("disabled", false);
		$('.visible').attr("disabled", false);
		$(".view1").hide();	
		$(".view2").show();	
		$("#t1").css("background-color","#f5f3ed");
		$("#t2").css("background-color","#f5f3ed");
		<%}else { %>
			alert("수정할 권한이 없습니다");
		<%}%>
	});
	$('#delete').click(function(){
		<%
		if(buf_writer.equals(buf_id)){
		%>
			location.href='faq.do?action=delete&no='+${param.no};
		<%}else { %>
		alert("삭제할 권한이 없습니다");
	<%}%>
	});

	
});
function check(){
	
	var title = document.frm.title.value;
	var contents = document.frm.contents.value;
	if(title==''){
		alert("제목을 입력하세요");
	}else if(contents == ''){
		alert("내용을 입력하세요");
	}else{
	document.frm.submit();
	}
} --%>
  </script>
</head>
<body>
<center>


<form action="faq.do?action=update&no=${param.no}&page=${param.page}" method="post" name="frm">

	   <table cellpadding="8"
				style="font-size: 18px; border-collapse: collapse; line-height: 30px;"
				width="900px">
      <tr style="font-size: 30px; font-weight: bold;"><td  class="border2" colspan="4" height="110px" align="center">Q  A</td></tr>
		<tr>
			<td  bgcolor="#dae6f4" class="border1" rowspan="2" width="150px" align="center">작성자</td>
			<td  class="border1"  class="border1" id="t1" rowspan="2" width="200px" align="center">${dto.writer}</td>
			<td  class="border1" width="50px" align="center">
			<select name="category" id="category" style="font-size:16px; width:110px; height:25px" disabled="disabled">
			<c:if test="${dto.category=='날짜/시간'}">
			<option value="날짜/시간" selected="selected">날짜/시간</option>
			</c:if>
			<c:if test="${dto.category!='날짜/시간'}">
			<option value="날짜/시간">날짜/시간</option>
			</c:if>
			<c:if test="${dto.category=='예약/변경'}">
			<option value="예약/변경" selected="selected">예약/변경</option>
			</c:if>
			<c:if test="${dto.category!='예약/변경'}">
			<option value="예약/변경">예약/변겅</option>
			</c:if>
			<c:if test="${dto.category=='환불'}">
			<option value="환불" selected="selected">환불</option>
			</c:if>
			<c:if test="${dto.category!='환불'}">
			<option value="환불">환불</option>
			</c:if>
			<c:if test="${dto.category=='기타'}">
			<option value="기타" selected="selected">기타</option>
			</c:if>
			<c:if test="${dto.category!='기타'}">
			<option value="기타">기타</option>
			</c:if>
			</select></td>
			
			<td  class="border1" align="center" width="170px">
			<input type="radio" value="1" name="visible" class="visible" checked="checked" disabled="disabled"/>공개
			<c:if test="${dto.visible==0}">
			<input type="radio" value="0" name="visible" class="visible" checked="checked" disabled="disabled"/>비공개
			</c:if>
			<c:if test="${dto.visible==1}">
				<input type="radio" value="0" name="visible" class="visible" disabled="disabled"/>비공개
			</c:if> </td>
		</tr>
		<tr>
		    <td bgcolor="#dae6f4" class="border1" width="150px" align="center">작성일</td>
         	<td class="border1" id="t2" width="170px" align="center">${dto.gdate}</td>
		</tr>	
		<tr>
			<td bgcolor="#dae6f4" class="border1" align="center" width="150px">제목</td>
			<td class="border1"colspan="3	"align="center" ><input type="text" readonly="readonly" style=" width: 750px; height: 46px; margin: 0; border: 0;" id="title" name="title" value="${dto.title}"></td>
		</tr>
		<tr>
			<td  class="border1" colspan="4" align="center"><textarea class="ttr" readonly="readonly" id="content" name="contents">${dto.contents}</textarea></td>
		</tr>
      <tr>
         <td  class="border1" colspan="4" align="right">
         <input type="button" value="수정" id="update" class="view1"/>
         <input type="button" value="삭제" class="view1" id="delete"/>
         
         <input type="button" value="완료" class="view2" onclick="check()" />
         <input type="button" value="취소" class="view2" onclick="location.href='faq.do?action=select&no='+${param.no}+'&page='+${param.page}"/>
         
         <input type="button" class="view3" value="목록" onclick="location.href='faq.do?action=list&page='+${param.page}"/>
         
         </td>
         
      </tr>
      <tr height="100px"></tr>   
	</table>
</form>
</center>
</body>
</html>