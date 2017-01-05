<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 확인</title>
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
<!-- member_check.jsp(회원정보 확인) --> 
<body>
   <center>
   <div id="background">
   
      <form method="post" name="frm" action="/MellowTone/main">
         <table  cellpadding="8"  style=" border-collapse:collapse; line-height:50px;" width="900px" >
            <tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="2" height="110px" align="center">회원정보확인</td></tr>
            <tr style="font-size:18px;">
               <td class="border1" width="150px" > 아이디</td>
               <td class="border1" width="390px"><input type="text" class="input_text" size="19" name="id" id="id" value="${LoginUser.id }" readonly></td>
               
            </tr>
            <tr style="font-size:18px;">
               <td class="border1"> 성 명</td>
               <td class="border1"><input type="text" class="input_text" size="19" name="username" id="username" value="${LoginUser.name }" readonly></td>
            </tr>
            <tr  style="font-size:18px; line-height:22px;" >
               <td class="border1"  rowspan="3"> 주  소</td>
               <td ><input type="text" class="input_text" size="3" name="zip1" id="zip1" value="${firstPost[0]}" readonly> - <input type="text" class="input_text" size="3" name="zip2" id="zip2" value="${firstPost[1]}" readonly></td>
            </tr> 
            <tr style="font-size:18px; line-height:22px;" >
               <td><input type="text" class="input_text" size="60" name="address1" id="address1" value="${LoginUser.address1 }" readonly></td> 
            </tr>
            <tr style="font-size:18p; line-height:22px;">
               <td class="border1"><input type="text" class="input_text" size="60" name="address2" id="address2" value="${LoginUser.address2 }" readonly></td>
            </tr>
            
            <tr style="font-size:18px;">
               <td class="border1"> 연락처</td>
               <td class="border1"><input type="text" name="phone"  size="5" class="input_text" id="phone" value="${firstPhone[0] }" readonly>
                  - <input type="text"  class="input_text" size="5" name="phone1" id="phone1" value="${firstPhone[1] }" readonly> - <input type="text" class="input_text" size="5" name="phone2" id="phone2" value="${firstPhone[2] }" readonly>
            </tr>
            <tr style="font-size:18px;">
               <td class="border1" > 이메일</td>
               <td class="border1"><input type="text" class="input_text" size="20" name="email1" id="email1" value="${firstEmail[0] }" readonly> @ <input type="text" class="input_text" size="30" name="email2" id="email2" value="${firstEmail[1] }" readonly>
            </tr>
            <tr height="50px"></tr>
            <tr>
               <td class="border2" colspan="2" align="right"><input type="button" class="button2" value="주문내역" style="font-size:18px;">&nbsp;&nbsp;&nbsp; <input type="button" class="button2"value="내가쓴글보기" style="font-size:18px;"></td>
            </tr>
            <tr>
               <td colspan="2" align="right"><input type="submit" class="button1" value="확인" style="font-size:18px;"><br>
            </tr>
            <tr height="100px"></tr>
         </table>
      </form>
   </div>
   </center>
</body>
</html>