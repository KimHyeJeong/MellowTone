<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

   
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
   
      .button2{
     border:0;
     height:35px;
     color:#fff;
     background-color: #545250;
     cursor: pointer;
     font-size: 18px;
   }

</style>
<script type="text/javascript">

   function check(){
      
      <%if (session.getAttribute("id") != null){ %>
      document.frm.submit();
      <%}else{ %>
         alert("로그인을 해야 글을 작성할 수 있습니다");   
      <%}%>
         

   }
</script>
</head>
<body>
<center>
<form action="faq.do?action=insertpage" method="post" name="frm">
   <table cellpadding="8" style=" font-size:18px; border-collapse:collapse; line-height:30px;" width="900px" >
            <tr style="font-size: 30px; font-weight: bold;"><td align="center" class="border2" colspan="6" height="110px" align="center">Q & A</td></tr>
      <tr height="35px"  bgcolor="#dae6f4">
         <th class="border1" width="50px" >번호</th>
         <th class="border1"  width="150px">분류</th>
         <th class="border1"  width="350px">제목</th>
         <th class="border1" width="50px"></th>
         <th class="border1"  width="150px">작성자</th>
         <th class="border1"  width="150px">작성일</th>
      </tr>
      <core:forEach items="${faq}" var="faq" varStatus="stat">
      <tr>
         <td class="border1"  align="center">${stat.count + (page-1)*10}</td>
         <td class="border1"  align="center">${faq.category}</td>
         <td class="border1"  align="left"><a href="faq.do?action=select&no=${faq.no}&page=${page}" >${faq.title}</a></td>
         <td class="border1"  align="right">
         <core:if test="${faq.visible==1}">
         <img src="/MellowTest/image/lock.png"" height="30px" style="opacity: 0;">
         </core:if>
         <core:if test="${faq.visible==0 }">
         <img src="/MellowTest/image/lock.png"" height="30px" style="opcity:1;">
         </core:if>
         </td>
         <td class="border1"  align="center">${faq.writer}</td>
         <td class="border1"  align="center">${faq.gdate}</td>
      </tr>
      </core:forEach>
   <tr><td colspan="6" height="50px" align="right"><input type="button" value="글쓰기" class="button2" onclick="check()"></td></tr>
   <tr><td  colspan="6" align="center">
   <core:if test="${page==1}">이전</core:if>
   <core:if test="${page>1}"><a href="faq.do?&action=list&page=${page-1}">이전</a></core:if>
   <core:if test="${page==pageCount}">다음</core:if>
   <core:if test="${page<pageCount}"><a href="faq.do?action=list&page=${page+1}">다음</a></core:if>
   </td></tr>
    <tr height="100px"></tr>
   </table>
</form>   
   
   
</center>
</body>
</html>