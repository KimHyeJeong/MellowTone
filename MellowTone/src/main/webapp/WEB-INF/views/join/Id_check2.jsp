<%@page import="mypage.beans.Member"%>
<%@page import="mypage.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID중복확인</title>

<style>
.input_text {
	height: 22px;
	background-color: #f1efe8;
}


	.button2{
	  border:0;
	  height:27px;
	  color:#fff;
	  background-color: #704d1a;
	  cursor: pointer;
	}
	
</style>
<script type="text/javascript">
	function useId() {
		opener.document.Jfrm.id.value = '${param.id}';
		window.close();

	}

	function checkId() {

		location.href = "./confirmid_check.jsp";
	}
</script>
</head>

<body>
	<center>
		<%
			String id = request.getParameter("id");

			MemberDAO dao = new MemberDAO();
			Member dto;
			dto = dao.select(id);

			if (dto != null) {
		%>
		<table width="280" border="0" cellpadding="5">
			<t>
				<td align="center"><b>사용불가능</b></td>
			</tr>
			<tr>
				<td align="center">이미 사용중인 아이디입니다.<br> 다른 아이디를 선택하십시요!!
				</td>
			</tr>
		</table>
		<input type="button" class="button2" value="닫기" onclick="checkId()">

		<%
			} else if (id.contains(" ")) {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr>
				<td align="center"><b>사용불가능</b></td>
			</tr>
			<tr>
				<td align="center">아이디에 공백 문자를 포함 할 수 없습니다.<br> 다시 작성해주시길 바랍니다.
				</td>
			</tr>
		</table>
		<br> <input type="button" class="button2" value="창닫기" onclick="checkId()">
		<%
			} else if (id.length() < 5 || id.length() > 10) {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr>
				<td align="center"><b>사용불가능</b></td>
			</tr>
			<tr>
				<td align="center">아이디는 5자리~10자리로 <br> 입력하여주세요.

				</td>
			</tr>
		</table>
		<br> <input type="button" class="button2" value="창닫기" onclick="checkId()">
		<%
			} else {
		%>
		<table width="280" border="0" cellpadding="5">
			<tr>
				<td align="center" height="40px"><b>사용가능</b></td>
			</tr>
			<tr>
				<td align="center">사용가능한 아이디입니다.</td>
			</tr>
			
			
			<tr><td align="center"><button class="button2" onclick="useId()">사용하기</button></td></tr>
			<tr height="30px"></tr>
			<tr><td align="center"><a style="text-decoration: none; color:#f333;" href="javascript:self.close()">창닫기</a></td></tr>
		</table>
		
		<%
			}
		%>
	</center>
</body>
</html>
