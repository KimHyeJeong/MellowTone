
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>


<style>
.button1 {
	border: 0;
	height: 35px;
	color: #fff;
	background-color: #545250;
	cursor: pointer;
	font-size: 18px;
}

.input_text {
	height:22px;
	width:150px;
	background-color: #f1efe8;
}
</style>


<script type="text/javascript">
	function cancel() {
		location.href = "main.do";
	}
	function check(){
		
		
		var id = document.frm.id.value;
		var pass = document.frm.pass.value;
		if(id.trim()==''){
			alert("아이디를 입력해주세요");
        	document.frm.id.focus();
		}else if(pass.trim()==''){
			alert("비밀번호를 입력해주세요");
        	document.frm.pass.focus();
		}else{
			document.frm.submit();
		}
	}
</script>
</head>
<body>
	<center>
		<form method="post" action="mypage.do?action=login_succ" name="frm">
			<table cellpadding="8" style="border-collapse: collapse; font-size: 18px;"
				width="900px"  >
				<tr style="font-size: 30px; font-weight: bold;">
					<td class="border2" colspan="2" height="110px" align="center">로그인</td>
				</tr>
				<tr>
					<td width="360px" align="right">아이디</td>
					<td><input type="text" class="input_text"  name="id"></td>
				</tr>
				<tr>
					<td align="right">비밀번호</td>
					<td><input type="password" class="input_text" name="pass"></td>
				</tr>
				<tr>
					<td height="50px" colspan="2" align="center"><input type="button"
						class="button1" value="로그인" onclick="check()">&nbsp;&nbsp;<input type="reset" class="button1" value="취소"
						onclick="cancel()"><br></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a
						href="mypage.do?action=findId" style="font-size: 13px;">아이디</a>/<a
						href="mypage.do?action=findPass" style="font-size: 13px;"> 비밀번호 찾기</a> <br> <a
						href="mypage.do?action=join" style="font-size: 13px;">회원가입</a></td>
				</tr>
                 <tr height="200px"></tr>
			</table>
		</form>
	</center>
</body>
</html>