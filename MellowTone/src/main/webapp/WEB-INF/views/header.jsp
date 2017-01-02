
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MAIN</title>
<style>


/*헤더*/
#header{
   margin:0 auto;
   width:1300px;
   height:150px;
  background:#FEF5D3;
  position:relative;
  
 }

#logo{
   margin:0 auto;
   width: 300px;
   height: 150px;
}

#member{
   top: 20px;
   right: 30px;
   text-align:center;
   position:absolute;
   font-size:11px;

}


#member a{
   color:#333;
   text-align:center;
   text-decoration:none;
   
}
#member a:hover{
   color:#ccc; 
    
   }




/* 주메뉴 부분 */
#navi{
   margin:0 auto;
   width:1300px;
   height:60px;
  background:#F0DCB9;
  

  
}

#menu {

   width:1000px;
   margin:0 auto;
}

#menu ul{ 

   margin:0 auto;
   float:left;
   text-align:center;
   position:relative;
   
   }
   
#menu ul li{
   display:inline-block; 
   text-align:center;
   width:150px;
}

#menu ul li a{
   color:#333;
   display:block;
   font-size:14px;
   font-weight:bold;
   line-height:60px;
   margin:0;
   text-align:center;
   text-decoration:none;
   
   }
   
   
#menu ul li a:hover{
    color:#fff; 
    background:#BFB397;
   }
   
#menu li ul {
   position:absolute;
   list-style:none;
   display:none;
   z-index: 13;
   
   

}

#menu li ul li{
   margin-left:-40px;
   width:150px;
   display:list-item;
   background-color:#F4F4F4 !important;
   position:relative;
}


#menu li ul li a{
   font-size: 12px;
   
}

</style>
<script>
var smallMenu;
var el=null;

function processClick(el){
 smallMenu=document.getElementsByClassName("smallMenu").item(el).style.display="list-item";

 
}//마우스 올렸을떄

function upMenu(el){
  smallMenu=document.getElementsByClassName("smallMenu").item(el).style.display="none";
}//마우스 벗어날 떄

function logout(){
	   location.href="${pageContext.request.contextPath}/join/logout";
	}

</script>

</head>
<body>


<div id="header" align="center">
<div id="logo" align="center"><a href="/MellowTone/main"><img src="/resources/image/logo.png" width="300" height="150" /></a></div>
<div id="member">
 <%
if( session.getAttribute("login")==null){ %>
   <a href="/MellowTone/login">Login</a>&nbsp;&nbsp;&nbsp;
   <a href="/MellowTone/join">Join</a>&nbsp;&nbsp;&nbsp;
<%}else {%> 
   <%= "♥ " %> ${login.name} <%="님 환영합니다 ♥" %>&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="#" onclick="logout()">Logout</a>&nbsp;&nbsp;&nbsp;
   <a href="/MellowTone/mypage">Mypage</a>&nbsp;&nbsp;&nbsp;
   
<%} %>
</div>
</div>
<div id="navi">
  <div id="menu">
    <ul>
       <li><a href="/MellowTone/produce" onMouseOver="processClick(0)" onMouseOut="upMenu(0)" >PRODUCE</a>
               <ul class="smallMenu" onMouseOver="processClick(0)" onMouseOut="upMenu(0)">
                    <li> <a href="/MellowTone/produce">Self Wedding</a></li> 
                    <li> <a href="#mellowtone">MellowTone</a></li>
                    <li> <a href="#photographer">PhotoGrapher</a></li>
                </ul>   
                </li>    
       <li><a href="/MellowTone/picture?no=4" onMouseOver="processClick(1)" onMouseOut="upMenu(1)">PICTURE</a>
                <ul class="smallMenu" onMouseOver="processClick(1)" onMouseOut="upMenu(1)">
                    <li> <a href="/MellowTone/picture?no=4" >Regular Snap</a></li> 
                    <li> <a href="/MellowTone/picture?no=5" >Natural Light Snap</a></li>
                    <li> <a href="/MellowTone/picture?no=6" >Studio Snap</a></li> 
                    <li> <a href="/MellowTone/picture?no=7" >Outer Snap</a></li> 
                </ul>
                </li>
        <li><a href="/MellowTone/item?no=8" onMouseOver="processClick(2)" onMouseOut="upMenu(2)">ITEM</a>
                <ul class="smallMenu" onMouseOver="processClick(2)" onMouseOut="upMenu(2)">
                    <li> <a href="/MellowTone/item?no=8" >Dress</a></li> 
                    <li> <a href="/MellowTone/item?no=9" >Tuxedo</a></li>
                    <li> <a href="/MellowTone/item?no=10" >Acessory</a></li> 
                </ul>
                </li>
        <li><a href="/MellowTone/gallery?no=11" onMouseOver="processClick(3)" onMouseOut="upMenu(3)">GALLERY</a>
                <ul class="smallMenu" onMouseOver="processClick(3)" onMouseOut="upMenu(3)">
                    <li> <a href="/MellowTone/gallery?no=11" >Regular Snap</a></li> 
                    <li> <a href="/MellowTone/gallery?no=12" >Natural Light Snap</a></li>
                    <li> <a href="/MellowTone/gallery?no=13" >Studio Snap</a></li> 
                    <li> <a href="/MellowTone/gallery?no=14" >Outer Snap</a></li> 
                </ul>
                </li> 
               
        <li><a href="reservation.do?action=book" onMouseOver="processClick(4)" onMouseOut="upMenu(4)">RESERVATION</a>
                <ul class="smallMenu" onMouseOver="processClick(4)" onMouseOut="upMenu(4)">
                    <li> <a href="reservation.do?action=book" >Booking</a></li> 
                    <li> <a href="reservation.do?" >Confirmation</a></li>
                </ul>
                </li>
        <li><a href="/MellowTone/boardlist?tno=1" onMouseOver="processClick(5)" onMouseOut="upMenu(5)">COMMUNITY</a>
                 <ul class="smallMenu" onMouseOver="processClick(5)" onMouseOut="upMenu(5)">
                    <li> <a href="/MellowTone/boardlist?tno=1" >Notice</a></li> 
                    <li> <a href="/MellowTone/boardlist?tno=2" >Q&amp;A</a></li>
                    <li> <a href="/MellowTone/boardlist?tno=3" >Review</a></li> 
                </ul>
                </li>
    </ul>
  </div>
</div>


</body>
</html>