<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MellowTone에 오신걸 환영합니다</title>
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
</head>
<body>
   <center>
      <form action="mypage.do?action=login" method="post">
         <table cellpadding="8"
            style="font-size: 18px; border-collapse: collapse;" width="900px">
            <tr style="font-size: 30px; font-weight: bold;">
               <td class="border2" colspan="2" height="110px" align="center">
               환영합니다.</td>
            </tr>
            <tr>
               <td align="center">
               회원가입이 정상적으로 완료되었습니다. <br>
               멜로우톤과 함께 행복한 추억을<br>
                만드시길 바랍니다.
               </td>
            </tr>
            <tr>
               <td align="center"> 
               <input class="button1" type="submit" value="로그인">
               </td>
            </tr>
         </table>
      </form>
   </center>
</body>
</html>