<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>sidebar</title>
<style>
  #sideBar {
   float:left;
   margin-left:20px;
   width:270px; 
   background-color:#fff
      }

   .sideBar_Menu {
    text-align: center;  
    height:60px;
   }
   
   
   .sideBar_Menu a{
   font-weight: bolder;
   color:#000;
   text-decoration:none;
   font-size: 18px;
  
   
   
   }
   
   .sideBar_Menu :hover{
   color:#ccc; 
   }
   
   
   #sideBar_Title{
      height:110px;
      font-size:30px;
      font-weight:bold;
   }
   
   
</style>
</head>


   
   <!--p:title /li:subtitle 배열에 넣고 타이틀에 따른 소제목 받아서 뿌리기 -->
<body>
   <center>
   <table id="sideBar">
   <tr id="sideBar_Title"><td align="center">${title }</td></tr>
   <tr><td><hr style="border:#666 dashed 1.5px ;"></hr></td></tr>
   <c:forEach items="${list }" var="sidebar">
         <tr class="sideBar_Menu"><td><a href="${sidebar.url }" >${sidebar.name }</a></td></tr>
   </c:forEach>
      
   </table>
   </center>
</body>
</html>