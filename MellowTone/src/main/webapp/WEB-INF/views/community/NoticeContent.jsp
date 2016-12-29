<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
$(document).ready(function(){
	$(".view2").hide();	
	
	$('#update').click(function(){
		$('#title').attr("readonly", false);
		$('#content').attr("readonly", false);
		$('#content').focus();
		$(".view1").hide();	
		$(".view2").show();	
		$("#t1").css("background-color","#f5f3ed");
		$("#t2").css("background-color","#f5f3ed");
	});
	
	
});



	function check(){

		var title = document.frm.title.value;
		var contents = document.frm.contents.value;
		if(title.trim()==''){
			alert("제목을 입력하세요");
		}else if(contents.trim() == ''){
			alert("내용을 입력하세요");
		}else{
		document.frm.submit();
		}
	}

</script>

</head>
<body>
<center>


<form action="notice.do?action=update&no=${param.no}&page=${param.page}"  method="post" name="frm">
   <table cellpadding="8"
				style="font-size: 18px; border-collapse: collapse; line-height: 30px;"
				width="900px">
      <tr style="font-size: 30px; font-weight: bold;"><td  class="border2" colspan="4" height="110px" align="center">NOTICE</td></tr>
      
      <tr>
         <td bgcolor="#dae6f4" class="border1"  width="150x" align="center">작성자</td>
         <td id="t1" class="border1"  width="250px" align="center">관리자</td>
         <td bgcolor="#dae6f4" class="border1"  width="150px" align="center">작성일</td>
         <td id="t2" class="border1"  align="center">${dto.gdate}</td>
      </tr>
      <tr>
         <td bgcolor="#dae6f4" class="border1"  width="100px" align="center">제목</td>
         <td class="border1" style="padding:0;"  colspan="3" width="400px" align="center" ><input type="text" readonly="readonly" style=" width: 750px; height: 46px; margin: 0; border: 0;" id="title" name="title" value="${dto.title}"></td>
      </tr>
      <tr>
         <td style="padding:0;" class="border1"  colspan="4" align="center" ><textarea class="ttr" readonly="readonly" id="content" name="contents">${dto.contents}</textarea></td>
      </tr>
      <%if("admin".equals(session.getAttribute("id"))){ %>
      <tr>
         <td class="border1" colspan="4" align="right">
         <input type="button" value="수정" id="update" class="view1"/>
         <input type="button" value="삭제" class="view1" onclick="location.href='notice.do?action=delete&no='+${param.no}"/>
         
         <input type="button" value="완료" class="view2" onclick="check()"/>
         <input type="button" value="취소" class="view2" onclick="location.href='notice.do?action=select&no='+${param.no}+'&page='+${param.page}"/>
         
         <input type="button" class="view3" value="목록" onclick="location.href='notice.do?action=list&page='+${param.page}"/>
         
         </td>
         
      </tr>   
       	<%} %>
      <tr height="100px"></tr>
   </table>
</form>
</center>
</body>
</html>