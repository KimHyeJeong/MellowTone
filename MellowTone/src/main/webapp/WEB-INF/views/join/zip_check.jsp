<%@page import="com.phoenix.main.domain.PostVO"%>
<%@page import="com.phoenix.main.persistence.PostDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String search = request.getParameter("addr") == null ? "힣" : request.getParameter("addr");

PostDAO dao = new PostDAO();
ArrayList<PostVO> list = dao.getAddrs(search); 
request.setAttribute("list",list);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소검색</title>
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
     height:31px;
     background-color: #f1efe8;
   }
</style>

<script type="text/javascript" src="../js/jquery-1.min.js"></script>
   <script type="text/javascript">
      function zip_put(i){
         
          var post = $('#post_'+i).text();
            var addr = $('#addr_'+i).text();
            
            var post1 = post.substring(0,3);
            var post2 = post.substring(3,6);
            opener.Jfrm.zip1.value = post1;
            opener.Jfrm.zip2.value = post2;
            opener.Jfrm.address1.value= addr;
            window.close();
            opener.Jfrm.address2.focus();
      }
   </script>
</head>
<body>
    <center>
   <form action="/MellowTone/zip_check" name=Zfrm >
      주소검색 : <input type="text" name="addr" class="input_text" /> &nbsp;<input type="submit" class="button1" value="검색"><br>
      <p style="font-size: 14px;">*예) 서울특별시 금천구, 인천광역시 서구와(과) 같이 적어주시기 바랍니다.</p>
      
      <table cellspacing="0" style="border: 1px solid #cccccc;">
         <tr>
            <td bgcolor="#cccccc" style="border: 1px solid #cccccc;" align="center" width="130px">우편번호</td>
            <td bgcolor="#cccccc" style="border: 1px solid #cccccc;" align="center" width="600px">주소</td>
         </tr>
         <% for(int i=0; i < list.size(); i++){ %>
               <tr>
                  <td style="border: 1px solid #cccccc;" align="center" onclick="zip_put(<%=i%>)" id="post_<%=i%>"><a href="#"><%=list.get(i).getZipcode() %></a></td>
                        <td style="border: 1px solid #cccccc; padding-left:10px;" align="left" onclick="zip_put(<%=i%>)" id="addr_<%=i%>"><a href="#"><%=list.get(i).getAddrs() %></a></td>
                  
               </tr>
               
         <% } %>
      </table>
   </form>
   </center>
</body>
</html>