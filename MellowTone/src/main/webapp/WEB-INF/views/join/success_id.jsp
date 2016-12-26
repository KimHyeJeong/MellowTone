<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<style>

.button1 {
   border: 0;
   height: 35px;
   color: #fff;
   background-color: #545250;
   cursor: pointer;
   font-size: 18px;
}
</style>

<script type="text/javascript">
   function cancel() {
      location.href = "mypage.do?action=login";
   }

   function search_pass() {
      location.href = "mypage.do?action=findPass";
   }
</script>
</head>
<body>
   <center>
      <form action="mypage.do?action=login" method="post">
         <table cellpadding="8"
            style="font-size: 18px; border-collapse: collapse;" width="900px">
            <tr style="font-size: 30px; font-weight: bold;">
               <td class="border2" colspan="2" height="110px" align="center">아이디
                  찾기</td>
            </tr>

            <tr>
               <td align="center">인증에 성공하셨습니다.<br> 귀하의 아이디는 xxx입니다.<br>
                  이용해 주셔서 감사합니다~ ^^*
               </td>
            </tr>
            <tr height="50px">
               <td align="center"><input type="submit" class="button1" value="로그인">
                  <input type="button" class="button1" value="비밀번호 찾기" onclick="search_pass()">
                  <input type="button" class="button1" value="닫기" onclick="cancel()"></td>
            </tr>
            <tr height="200px"></tr>
         </table>
      </form>
   </center>
</body>
</html>