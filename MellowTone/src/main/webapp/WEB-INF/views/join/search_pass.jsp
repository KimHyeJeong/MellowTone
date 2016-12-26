<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
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

.button2 {
   border: 0;
   height: 27px;
   color: #fff;
   background-color: #704d1a;
   cursor: pointer;
}
</style>
<script type="text/javascript">
   function cancel() {
      location.href = "mypage.do?action=login";
   }
</script>
</head>
<body>
   <center>
      <form method="post" action="mypage.do?action=success_pass">
         <table cellpadding="8" cellspacing="0"
            style="margin: 0; font-size: 18px;" width="900px">
            <tr style="font-size: 30px; font-weight: bold;">
               <td class="border2" colspan="2" height="110px" align="center">비밀번호
                  찾기</td>
            </tr>
            <tr>
               <td width="360px" align="right">아이디</td>
               <td><input type="text"  class="input_text" size="19" name="userid"></td>
            </tr>
            <tr>
               <td align="right">이름</td>
               <td><input type="text" class="input_text"  size="19" name="username"></td>
            </tr>
            <tr>
               <td width="360px" align="right">이메일</td>
               <td><input type="text" class="input_text" size="40"
                  name="email">&nbsp; <input type="button" class="button2"
                  value="인증번호 받기" onclick="num_check()"></td>
            </tr>
            <tr>
               <td width="360px" align="right">인증번호</td>
               <td><input type="text" class="input_text" name="num"></td>
            </tr>
            <tr>
               <td height="50px" colspan="2" align="center"><input type="submit" value="확인" class="button1">
                  <input type="reset" value="취소" class="button1" onclick="cancel()"></td>
            </tr>
                 <tr height="200px"></tr>
         </table>
      </form>
   </center>
</body>
</html>