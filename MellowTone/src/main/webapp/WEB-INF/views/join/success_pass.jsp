<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
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
<body>
   <center>
      <form action="mypage.do?action=login" method="post">
         <table  cellpadding="8"  style="font-size:18px; border-collapse:collapse; " width="900px"  >
            <tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="2" height="110px" align="center">비밀번호 찾기</td></tr>
            
            <tr>
               <td colspan="2" align="center" style="padding-bottom: 40px;">인증이 완료되었습니다.<br>
               새 비밀번호를 입력해주시길 바랍니다.</td>
            </tr>
            <tr>
               <td align="right" width="450px">새로운 비밀번호</td>
               <td><input type="password" class="input_text" size="20" name="newpass"></td>
            </tr>
            <tr>
               <td  align="right">새로운 비밀번호 확인</td>
               <td><input type="password" class="input_text" size="20" name="passcheck"></td>
            </tr>
            <tr>
               <td height="50px" colspan="2" align="center"> <input type="submit" class="button1" value="확인"> </td>
            </tr>
            <tr height="200px"></tr>
         </table>
      </form>
   </center>
</body>
</html>