
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
	
	<style type="text/css">
		.button1{
	  border:0;
	  height:35px;
	  color:#fff;
	  background-color: #545250;
	  cursor: pointer;
	  font-size:18px;
	  
	}
	
	
	.button2{
	  border:0;
	  height:27px;
	  color:#fff;
	  background-color: #704d1a;
	  cursor: pointer;
	}
	
		.input_text{
	  
	  height:22px;
	  background-color: #f1efe8;
	}
	
	
	
	.border1{
	border: solid #b9b9b9 1px; 
	border-top:0; 
	border-left: 0; 
	border-right:0;
	  
	}

	.border2{
	border: solid #b9b9b9 2px; 
	border-top:0; 
	border-left: 0; 
	border-right:0;  
	}
	
	</style>
	
	<script type="text/javascript">
	function cancel(){
		location.href="/MellowTone/login";
	}
	
	function join_check(){
		var id = document.Jfrm.id.value;
		var pass1 = document.Jfrm.pass1.value;
		var pass2 = document.Jfrm.pass2.value;
		var name = document.Jfrm.name.value;
		var zip1 = document.Jfrm.zip1.value;
		var zip2 = document.Jfrm.zip2.value;		
		var address1 = document.Jfrm.address1.value;
		var address2 = document.Jfrm.address2.value;
		var phone1 = document.Jfrm.phone1.value;
		var phone2 = document.Jfrm.phone2.value;
		var phone3 = document.Jfrm.phone3.value;
		var email1 = document.Jfrm.email1.value;
		var email2 = document.Jfrm.email2.value;
		
		//var email1Exp = /^[a-z][A-Z][0-9]{6,15}$/;
		//var email2Exp = /^[a-z]{4,10}$/;
		var passExp = /^[a-z0-9]{5,10}$/;		//숫자+영어 5글자에서 10글자
		var idExp= /^[a-z0-9]{5,10}$/;		//숫자+영어 5글자에서 10글자
		if(id==''){
			alert("아이디를 입력하세요");
			document.Jfrm.id.focus();
		}else if(pass1==''){
			alert("비밀번호를 입력하세요");
			document.Jfrm.pass1.focus();
		}else if(pass2==''){
			alert("비밀번호 확인을 입력하세요");
			document.Jfrm.pass2.focus();
		}else if(name==''){
			alert("이름을 입력하세요");
			document.Jfrm.name.focus();
		}
		else if(zip1=='' || zip2==''){
			alert("유편번호를 입력하세요");
			document.Jfrm.zip1.focus();
		}else if(address1===''|| address2==''){
			alert("주소를 입력하세요");
			document.Jfrm.address1.focus();
		}else if(phone1=='' || phone2=='' || phone3==''){
			alert("핸드폰 번호를 입력하세요");
			document.Jfrm.phone1.focus();
		}else if(email1==''||email2==''){
			alert("이메일을 입력하세요");
			document.Jfrm.email1.focus();
		}else if(!idExp.test(id)){
			alert("아이디는 5~10글자의 숫자,영문자만 사용가능합니다");
			document.Jfrm.id.focus();
		}else if(pass1!=pass2){
			alert("비밀번호와 비밀번호확인이 같지 않습니다");
			document.Jfrm.pass2.focus();
		}else if(!passExp.test(pass1)){
			alert("비밀번호는 5~10글자의 숫자,영문자만 사용가능합니다");
			document.Jfrm.pass1.focus();
		}else if(phone1.length!=3||phone2.length!=4||phone3.length!=4||isNaN(phone1)||isNaN(phone2)||isNaN(phone3)){
			alert("핸드폰 번호를 확인하세요");
			document.Jfrm.phone1.focus();
		}else{
			alert("회원가입에 성공하였습니다.");
			document.Jfrm.submit();
		}
		
	}
		
		function idCheck(){
			window.open('${pageContext.request.contextPath}/join/confirmid_check','check','width=600,height=400,top=80,left=800');
			
		}
		
		function zipCheck(){
			window.open('${pageContext.request.contextPath}/join/zip_check','zipcheck','width=600,height=300,top=80,left=680');
		}
		
	</script>
</head>
<body>
	<center>
		<form action="/MellowTone/login" method="post" name="Jfrm">
			<table  cellpadding="8"  style=" border-collapse:collapse; line-height:50px;" width="900px">
				<tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="2" height="110px" align="center">회원가입</td></tr>
				<tr>
					<td class="border1">아이디</td>
					<td class="border1" ><input class="input_text" type="text" size="19" name="id" readonly onclick="idCheck()">&nbsp; <input class="button2" type="button" value="중복체크" onclick="idCheck()">
					</td>
				</tr>
				<tr>
					<td class="border1">비밀번호</td>
					<td class="border1"><input class="input_text" type="password" size="20" name="pass1"> 
						
					</td>
				</tr>
				<tr>
					<td class="border1">비밀번호 확인</td>
					<td class="border1"><input type="password"  class="input_text" size="20" name="pass2"> 
						
					</td>
				</tr>
				<tr>
					<td class="border1">성명</td>
					<td class="border1"><input type="text" class="input_text" size="19" name="name">
						
					</td>
				</tr>
				<tr>
					<td class="border1">우편번호</td>
					<td class="border1">
					<input type="text"  class="input_text" size="3" name="zip1" maxlength="3" readonly onclick="zipCheck()">
					 - 
					<input type="text" class="input_text" size="3" name="zip2" maxlength="3" readonly onclick="zipCheck()">
						&nbsp;<input class="button2" type="button" value="검색" onclick="zipCheck()">
						
					</td> 
				</tr>
				<tr>
					<td class="border1" rowspan="2">주소</td>
					<td ><input type="text" class="input_text" size="60" name="address1" readonly></td>
				</tr>
				<tr>
					<td class="border1"><input type="text" class="input_text" size="60" name="address2">
						
					</td>
				</tr>
				<tr>
					<td class="border1">연락처</td>
					<td class="border1"><select class="input_text" name="phone1">
						<option>010</option>
						<option>011</option>
						<option>017</option>
						<option>019</option>
					</select>
					- <input type="text" class="input_text" size="5" name="phone2" maxlength="4"> - <input type="text" class="input_text" size="5" name="phone3" maxlength="4">
						
					</td>
				</tr>
				<tr>
					<td class="border1">이메일</td>
					<td class="border1"><input class="input_text" type="text" size="19" name="email1"> @ <input type="text" class="input_text" size="19" name="email2">
					
					
					</td>
				</tr>
				<tr><td height="50px" colspan="2" class="border2"></td></tr>
				<tr>
					<td colspan="2" align="right">  <input class="button1" type="button" value="가입하기" onclick="join_check()">&nbsp;&nbsp;<input class="button1" type="reset" value="뒤로가기" onclick="cancel()"></td>
				</tr>
				<tr height="100px"></tr>
			</table>
		</form>
	</center>
</body>
</html>