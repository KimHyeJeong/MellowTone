<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Picture Detail</title>
<style>


   .button2{
     border:0;
     height:35px;
     font-size: 18px;
     color:#fff;
     background-color: #704d1a;
     cursor: pointer;
   }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    
   function bt_click(){
      if(${picture.no}==4){
         location.href="/MellowTone/gallery?no=11";
      }else if(${picture.no}==5){
         location.href="/MellowTone/gallery?no=12";
      }else if(${picture.no}==6){
         location.href="/MellowTone/gallery?no=13";
      }else if(${picture.no}==7){
         location.href="/MellowTone/gallery?no=14";
      }
   }
   
   function pocketWin(){
      var id ="${login.id}";
      
      <%if (session.getAttribute("login") == null){ %>
          alert("로그인을 해야 사용할수있습니다");
          location.href="/MellowTone/login";
      <%}else{%>
            window.open('${pageContext.request.contextPath}/mypage/inpocket?no=${param.no}','pocket','width=450,height=300,top=50,left=700,right=200');
         <%}%>
      } 
</script>
</head>
<body>
   <center>
   
   <table align="center" cellspacing="0"  cellpadding="8" width="900px">
      <tr height="110px">
      <td style="text-align:center; font-size: 30px; font-weight: bold;" colspan="4">${picture.name }</td>
      </tr>
      
      <tr class="background">
         <td align="center"  ><img src="${picture.path }" width="95%"/></td></tr>
            
            <tr><td style="font-size:26px;" align="center"><strong>:) ${picture.name }</strong></td></tr>
            <tr><td height="150px" style="font-size:18px;" align="center">${picture.content }</td></tr>
            <tr><td style="font-size:18px;" align="center">금액 : ${picture.price }원</td></tr>   
            <tr height="90px"><td align="center">
               <input type="button" class="button2" value="Gallery 이동" onclick="bt_click()">&nbsp;
                    <input type="button" class="button2" value="장바구니" onclick="pocketWin()">
            </td></tr>
            <tr height="100px"></tr>
         </table>
   </center>
</body>
</html>