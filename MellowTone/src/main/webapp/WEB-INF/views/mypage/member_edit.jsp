<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 변경</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function cancel(){
		location.href="./mypage.do?action=check";
	}
	function check(){
		var pass1 = document.Jfrm.pass1.value;
		var pass2 = document.Jfrm.pass2.value;
		
		var zip1 = document.Jfrm.zip1.value;
		var zip2 = document.Jfrm.zip2.value;
		
		var address1 = document.Jfrm.address1.value;
		var address2 = document.Jfrm.address2.value;
		
		var phone = document.Jfrm.phone.value;
		var phone1 = document.Jfrm.phone1.value;
		var	phone2 = document.Jfrm.phone2.value;
		
		var email1 = document.Jfrm.email1.value;
		var email2 = document.Jfrm.email2.value;
		
		var passExp = /^[a-z0-9]{5,10}$/;		//숫자+영어 5글자에서 10글자

		if(pass1==null){
			alert("비밀번호를 입력하세요");
			document.Jfrm.pass1.focus();
		}else if(pass2==null){
			alert("비밀번호 확인을 입력하세요");
			document.Jfrm.pass2.focus();
		}else if(zip1==null || zip2==null){
			alert("유편번호를 입력하세요");
			document.Jfrm.zip1.focus();
		}else if(address1===null|| address2==null){
			alert("주소를 입력하세요");
			document.Jfrm.address1.focus();
		}else if(phone==null || phone1==null || phone2==null){
			alert("핸드폰 번호를 입력하세요");
			document.Jfrm.phone.focus();
		}else if(email1==null||email2==null){
			alert("이메일을 입력하세요");
			document.Jfrm.email1.focus();
		}else if(pass1!=pass2){
			alert("비밀번호가 일치하지 않습니다.");
			document.Jfrm.pass1.value="";
			document.Jfrm.pass2.value="";
			document.Jfrm.pass1.focus();
		}else if(!passExp.test(pass1)){
			alert("비밀번호는 5~10글자의 숫자,영문자만 사용가능합니다");
			document.Jfrm.pass1.focus();
		}else if(phone.length!=3||phone1.length!=4||phone2.length!=4||isNaN(phone1)||isNaN(phone2)||isNaN(phone)){
			alert("핸드폰 번호를 확인하세요");
			document.Jfrm.phone.focus();
		}else{		
			$.ajax({
				type:'post',
				url:'/mypage/update',
				data:$('#Jfrm').serialize(),
				success:function(result){
					if(result=="SUCCESS"){
						alert("개인 정보 수정이 완료되었습니다.");
						location.href="/MellowTone/main";
					}
				}
			});
		}
		
		
	}
	function zipCheck(){
		window.open('${pageContext.request.contextPath}/join/zip_check','zipcheck','width=600,height=300,top=80,left=680');
	}
</script>

<style>
   #background {
      background-color:#fff;
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
   
   .input_text{
     
     height:22px;
     background-color: #f1efe8;
   }
   
      .button1{
     border:0;
     height:35px;
     color:#fff;
     background-color: #545250;
     cursor: pointer;
     font-size: 18px;
     
   }
   
   
   .button2{
     border:0;
     height:35px;
     color:#fff;
     background-color: #704d1a;
     cursor: pointer;
   }
   
</style>

</head>
<!-- member_edit.jsp(회원정보 변경) --> 
<body>
	<center>
		
		<form name=Jfrm>
			<input type="hidden" name="no" value="${user.no}">
 			<table  cellpadding="8"  style=" border-collapse:collapse; line-height:50px;" width="900px" >
            <tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="2" height="110px" align="center">회원정보변경</td></tr>
            <tr style="font-size:18px;">
               <td class="border1" width="150px" > 아이디</td>
               <td class="border1" width="390px"><input type="text" class="input_text" size="19" name="id" value="${user.id }" readonly="readonly"></td>
               
            </tr>
            <tr style="font-size:18px;">
               <td class="border1" width="150px" >비밀번호</td>
               <td class="border1" width="390px"><input type="password"  class="input_text" size="19" name="pass1"  > </td>
            </tr> 
            <tr style="font-size:18px;">
               <td class="border1" width="150px">비밀번호 확인</td>
               <td class="border1" width="390px"><input type="password"  class="input_text" size="19" name="pass2" " > </td>
            </tr>
            <tr style="font-size:18px;">
               <td class="border1"> 성 명</td>
               <td class="border1"><input type="text" class="input_text" size="19" name="username" value="${user.name }" readonly="readonly"></td>
            </tr>
				<tr  style="font-size:18px; line-height:22px;" >
               <td class="border1"  rowspan="3"> 주  소</td>
               <td >

            		<input type="text"  class="input_text" size="3" name="zip1" maxlength="3"  value="${firstPost[0]}" onclick="zipCheck()">
					 - 
					<input type="text" class="input_text" size="3" name="zip2" maxlength="3"  value="${firstPost[1]}" onclick="zipCheck()">
           								&nbsp;<input class="button2" type="button" value="검색" onclick="zipCheck()">
						<html:messages id="msg_post" property="errorpost">
							<font color="red"><bean:write name="msg_post"/> </font>
						</html:messages>
            </td>
            </tr> 
            <tr style="font-size:18px; line-height:22px;" >
               <td><input type="text" class="input_text" size="60" name="address1" value="${user.address1 }"></td> 
            </tr>
            <tr style="font-size:18p; line-height:22px;">
               <td class="border1"><input type="text" class="input_text" size="60" name="address2" value="${user.address2 }"></td>
            </tr>
					<tr style="font-size:18px;">
               <td class="border1"> 연락처</td>
               <td class="border1"><input type="text" name="phone" class="input_text" size="5" value="${firstPhone[0] }">
                  - <input type="text"  class="input_text" size="5" name="phone1" value="${firstPhone[1] }"> - <input type="text" class="input_text" size="5" name="phone2" value="${firstPhone[2] }">
            </tr>
            <tr style="font-size:18px;">
               <td class="border1" > 이메일</td>
               <td class="border1"><input type="text" class="input_text" size="20" name="email1" value="${firstEmail[0] }"> @ <input type="text" class="input_text" size="30" name="email2" value="${firstEmail[1] }">
            </tr>
            <tr height="50px"></tr>
				<tr>
					<td colspan="2" align="center"><input type="button" class="button1" value="변경" onclick="check()"> <input type="reset" class="button1" value="취소" onclick="cancel()"><br>
				</tr>
			</table>
		</form>
		</div>
	</center>
</body>
</html>