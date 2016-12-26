<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경(비밀번호입력)</title>
	<script type="text/javascript">
		function cancel(){
			location.href="./mypage.do?action=check";
		}
	</script>
<style>
	#background {
		width: 540px;
		height: 600px;
		background-color: #F0F8FF;
	}
</style>
</head>
<!-- pass_check.jsp(회원정보 변경을 위한 비밀번호 입력폼) --> 
<body>
	<center>
	<div id="background">
	<form method="post" action="./mypage.do?action=check">
	<table border="1" cellpadding="5">
		<caption>회원 정보 변경</caption>
		<tr>
			<td colspan="2">
				※변경한 정보를 저장하시려면 <br>
		 		 다시 한번 비밀번호를 입력해주세요.
		   </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pass"> </td>
		</tr>
		<tr>
			<td> 비밀번호 확인 </td>
			<td><input type="password" name="passch"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="reset" value="취소" onclick="cancel()"> <input type="submit" value="확인"></td>
		</tr>

	</table>
	</form>
	</div>
	</center>
</body>
</html>