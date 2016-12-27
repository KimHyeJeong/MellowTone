<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Item Dress list</title>
</head>
<body>
   <center>
      
      <table align="center" cellpadding="8">
      <tr height="110px">
      <td style="text-align:center; font-size: 30px; font-weight: bold; " colspan="4">${semititle }</td>
      </tr>
         <c:forEach items="${item }" var="item" varStatus="status">
            <c:if test="${status.index%3==0}">
               <tr>
            </c:if>
            <td>
               <center>
                  <a href="/MellowTone/item_detail?item=${item.name}"> <img
                     src="${item.listpath }" width="300px" height="400px"></a>
                  <p>${item.name }</p>
                  <strong> ${item.price }원</strong>
               </center>
            </td>
            <c:if test="${status.index%3==2}">
               </tr>
            </c:if>

         </c:forEach>
         <tr height="100px"></tr>
      </table>
   </center>
</body>
</html>