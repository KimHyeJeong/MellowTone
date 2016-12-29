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

.button2 {
	border: 0;
	height: 27px;
	color: #fff;
	background-color: #704d1a;
	cursor: pointer;
}
body{
  width:100%;
}

</style>

</head>
<body>
	<center>
		<form action="/join/Id_check2" method="post" name=frm>
			<table cellpadding="5" style="margin-top: 30px;">
				<tr height="50px">
					<td>아이디 :</td>
					<td><input type="text" class="input_text" name="id"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="button2" value="중복확인"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>