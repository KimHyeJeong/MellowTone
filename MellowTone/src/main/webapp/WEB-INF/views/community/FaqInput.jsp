<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
	
	.border1{
	border: solid #b9b9b9 1px;
	border-top:0;
	
	}
	.border2{
	border: solid #b9b9b9 1px; 
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
	
	.ttr{
	 width:900px;
	 height:500px;
	 margin:0;
	 border:0;
	 
	
	}

</style>
<script type="text/javascript">

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
<form action="faq.do?action=insert" method="post"  name="frm">
	<table cellpadding="8" style=" font-size:18px; border-collapse:collapse; line-height:30px;" width="900px" >
				<tr style="font-size: 30px; font-weight: bold;"><td align="center" class="border2" colspan="4" height="110px" align="center">Q & A</td></tr>
		<tr>
			<td class="border1" bgcolor="#dae6f4" width="80px" align="center" >작성자</td>
			<td class="border1"  width="200px">${id}</td>
			<td class="border1"  bgcolor="#dae6f4" align="center" width="170px">
			<input type="radio" value="1" name="visible" checked="checked"/>공개 &nbsp; &nbsp;
			<input type="radio" value="0" name="visible"/>비공개</td>
			<td class="border1" align="center">
			<select name="category" style="font-size:16px; width:110px; height:25px">
			<option value="날짜/시간">날짜/시간</option>
			<option value="예약/변경">예약/변경</option>
			<option value="환불">환불</option>
			<option value="기타">기타</option>
			</select></td>
		</tr>
		<tr>
			<td class="border1"  bgcolor="#dae6f4" align="center" width="150px">제목</td>
			<td class="border1" colspan="3" ><input type="text" name="title" style="width:750px; height:30px; margin:0; border:0;"></td>
		</tr>
		<tr>
			<td class="border1"  colspan="4" align="center"><textarea class="ttr" name="contents"></textarea></td>
		</tr>
		<tr>
			<td class="border1"  colspan="4" align="right">
			<input type="button" class="button2" value="등록" onclick="check()"/>
			<input type="button" class="button2"  value="취소" onclick="location.href='faq.do'"/></td>
		</tr>
		<tr height="100px"></tr>
	</table>
</form>
</center>
</body>
</html>