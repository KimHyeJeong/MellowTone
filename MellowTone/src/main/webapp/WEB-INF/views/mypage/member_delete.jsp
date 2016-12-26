<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
	<script type="text/javascript">
		
		function logout(){
			  location.href="./join/logout.jsp";
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

</style>
<!-- member_delete.jsp(회원탈퇴)  --> 
</head>
<body>
<center>

<form method="post" action="./main.do">
	<table  cellpadding="8"  style=" border-collapse:collapse; " width="900px" height="600px">
   <tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="2" height="110px" align="center">회원 탈퇴</td></tr>
   <tr>
   <td align="center" style="font-size:18px;"> 
   회원탈퇴가 정상적으로 완료되었습니다.<br><br>
   이용해주셔서 진심으로 감사드립니다. </td>
   </tr>
   <tr>
      <td align="center" height="80px"> <input type="submit" class="button1" value="홈으로"> </td>
   </tr>
   <tr height="100px"></tr>
	</table>
</form>

</center>
</body>
</html>