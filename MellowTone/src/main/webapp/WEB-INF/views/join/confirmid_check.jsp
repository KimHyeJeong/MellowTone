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
<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#check").show();
		$("#un1").hide();
		$("#un2").hide();
		$("#ava").hide();
		
		$("#IdChk2").click(function(){
			var data = $('input[name=input_id]').val();
			$.ajax({
				url:"/MellowTone/join/confirmid_check2",
				data:{
					userid:data
				},
				success:function(result){
					$("#check").hide();
					if(result=="un1"){
						$("#un1").show();
					}else if(result=="un2"){
						$("#un2").show();
					}else if(result=="ava"){
						$("#ava").show();
					}
				}
			})
		});
	});
	
	function checkId() {

		location.href = "${pageContext.request.contextPath}/join/confirmid_check";
	}
	
	function useId() {
		opener.document.Jfrm.id.value = $('input[name=input_id]').val();
		window.close();

	}
</script>

</head>
<body>
	<div id="check">
	  <form id="frm" method="post" name="frm">
		<table cellpadding="5" style="margin-top: 30px;">
				<tr height="50px">
					<td>아이디 :</td>
					<td><input type="text" class="input_text" name="input_id"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" class="button2" id="IdChk2" value="중복확인"></td>
				</tr>
		</table>
	  </form>
	</div>
	<div id="un1">
		<table width="280" border="0" cellpadding="5">
			<tr>
				<td align="center"><b>사용불가능</b></td>
			</tr>
			<tr>
				<td align="center">이미 사용중인 아이디입니다.<br> 다른 아이디를 선택하십시요!!
				</td>
			</tr>
		</table>
		<input type="button" class="button2" value="닫기" onclick="checkId()">
	</div>
	<div id="un2">
		<table width="280" border="0" cellpadding="5">
			<tr>
				<td align="center"><b>사용불가능</b></td>
			</tr>
			<tr>
				<td align="center">아이디는 5자리~10자리 <br>영문,숫자로 <br> 입력하여주세요.

				</td>
			</tr>
		</table>
		<br> <input type="button" class="button2" value="창닫기" onclick="checkId()">
	</div>
	<div id="ava">
	<table width="280" border="0" cellpadding="5">
			<tr>
				<td align="center" height="40px"><b>사용가능</b></td>
			</tr>
			<tr>
				<td align="center">사용가능한 아이디입니다.</td>
			</tr>
			<tr><td align="center"><button class="button2" onclick="useId()">사용하기</button></td></tr>
			<tr height="30px"></tr>
	<!-- 	<tr><td align="center"><a style="text-decoration: none; color:#f333;" href="javascript:self.close()">창닫기</a></td></tr> -->
		</table>
	</div>
</body>
</html>