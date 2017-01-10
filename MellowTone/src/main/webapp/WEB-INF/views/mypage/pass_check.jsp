<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경(비밀번호입력)</title>
<script type="text/javascript">
		function cancel(){
			location.href="/MellowTone/check";
		}
		
		function passCheck(){	
			var pass = document.pfrm.pass.value;
			var mypass= ${LoginUser};
			
			if(pass.trim()==''){
	            alert("비밀번호를 입력해주세요");
	            document.pfrm.pass.focus();
	        }else if(pass!=mypass){
	        	alert("비밀번호를 확인해주세요");
				document.pfrm.pass.value='';
				document.pfrm.pass.focus();
	        }else{
	        	document.pfrm.submit();
			}
		}
	</script>

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
	height: 22px;
	background-color: #f1efe8;
}
</style>

</head>
<!-- pass_check.jsp(회원정보 변경을 위한 비밀번호 입력폼) -->
<body>
	<center>

		<form  action="/MellowTone/update_form" name="pfrm" method="post">
			<table cellpadding="8" style="border-collapse: collapse;"
				width="900px">
				<tr style="font-size: 30px; font-weight: bold;">
					<td class="border2" colspan="2" height="110px" align="center">회원정보변경</td>
				</tr>
				<tr>
					<td height="150px" align="center" colspan="2"
						style="font-size: 18px;">※개인정보 변경 하기 전 본인 확인을 위하여 <br>
						비밀번호를 입력해주세요.
					</td>
				</tr>
				<tr style="font-size: 18px;">
					<td align="right">비밀번호</td>
					<td><input type="password" class="input_text" name="pass"></td>
				</tr>
				<tr>
					<td colspan="2" height="150px" align="center"><input
						type="button" class="button1" value="확인" onclick="passCheck()" >&nbsp;&nbsp;<input
						type="reset" value="취소" class="button1" onclick="cancel()">
					</td>

				</tr>
				<tr height="100px"></tr>

			</table>
		</form>

	</center>
</body>
</html>