
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴(비밀번호 입력)</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		function cancel(){
			location.href="/MellowTone/check";
		}
		
		function passCheck(){
			

			var password = document.dfrm.password.value;
			var mypass= '${dpass}';
			
			if(password.trim()==''){
	            alert("비밀번호를 입력해주세요");
	            document.dfrm.password.focus();
	        }else if(password!=mypass){
	        	alert("비밀번호를 확인해주세요");
				document.dfrm.password.value='';
				document.dfrm.password.focus();
	        }
			
	        	$.ajax({
	    			type:'post',
	    			async:true,
	    			url:'${pageContext.request.contextPath}/MellowTone/delete',
	    			data:{
	    				password:$('#password').val()
	    			},
	    			success:function(result){
	    				if(result == "SUCCESS")
	    					alert("회원탈퇴 성공!!");
	    					location.href="${pageContext.request.contextPath}/join/logout";
	    			}
	    		});
	        }
		
	</script>
	
	<style>

      .button1{
     border:0;
     height:35px;
     color:#fff;
     background-color: #545250;
     cursor: pointer;
     font-size: 18px;
     
   }
   
      .input_text{
     height:22px;
     background-color: #f1efe8;
   }
</style>

</head>
<!-- delete_check.jsp(회원탈퇴를 위한 비밀번호 입력폼) --> 
<body>
	<center>

	<form name="dfrm" method="POST" action="/MellowTone/delete">
	<table  cellpadding="8"  style=" border-collapse:collapse; " width="900px" >
            <tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="2" height="110px" align="center">회원탈퇴</td></tr>
      <tr>
         <td  height="150px" align="center" colspan="2" style="font-size: 18px;">
            ※귀하의 회원탈퇴를 위해서 다시 한 번 <br>
                비밀번호를 입력해주시길 바랍니다.
         </td>
      </tr>
      <tr style="font-size: 18px;">
         <td align="right"> 비밀번호 </td>
         <td> <input type="password" class="input_text" name="password"> </td>
      </tr>
      <tr>
         <td colspan="2" height="150px" align="center" ><input type="button" class="button1" value="확인" onclick="passCheck()">&nbsp;&nbsp;<input type="reset" value="취소" class="button1" onclick="cancel()"> </td>
      
      </tr>
      <tr height="100px"></tr>
   

   </table>
	</form>

	</center>
</body>
</html>