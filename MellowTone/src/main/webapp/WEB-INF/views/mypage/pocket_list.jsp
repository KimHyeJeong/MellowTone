<%@page import="pocket.beans.Pocket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.border1 {
   border: solid #b9b9b9 1px;
   border-top: 0;
   border-left: 0;
   border-right: 0;
}

.border2 {
   border: solid #b9b9b9 2px;
   border-top: 0;
   border-left: 0;
   border-right: 0;
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
     height:20px;
     font-size:15px;
     color:#fff;
     background-color: #704d1a;
     cursor: pointer;
   }
   
      .button3{
     border:0;
     height:20px;
     width:20px;
     font-size:15px;
     color:#333;
     background:none;
     cursor: pointer;
   }
</style>
<script type="text/javascript">
	var name;
	var count;
	
	function up(no){
		name=no;
		location.href="pocket.do?action=count_up&name="+name;
	}
	function down(no,num){
		name=no;
		count=num;
		if(count>1){
			location.href="pocket.do?action=count_down&name="+name;
		}
	}
	function del(no){
		name=no;
		location.href="pocket.do?action=count_delete&name="+name;
		
	}
</script>
</head>
<!-- pocket_list.jsp(장바구니 목록) -->
<body>
   <center>
    <table cellpadding="8"  style=" border-collapse:collapse;font-size:18px; line-height:60px;" width="900px" >
            <tr style="font-size: 30px; font-weight: bold;"><td class="border2" colspan="4" height="110px" align="center">장바구니</td></tr>
         <tr>
            <th align="center" class="border2">상품명</th>
            <th align="center" class="border2">수량</th>
            <th align="center" class="border2">판매가</th>
            <th class="border2"></th>

         </tr>
         <c:forEach items="${list2 }" var="pocket">
				<tr>
					 <td align="center" class="border1"><a href="${pocket.url}" >${pocket.name }</a></td>
					 <td align="center" class="border1">${pocket.count }&nbsp;&nbsp;&nbsp;
					  <input type="button" value="▲" class="button3" onclick="up('${pocket.name}')">
					  <input type="button" value="▼" class="button3" onclick="down('${pocket.name}',${pocket.count})"></td>
					 <td align="center" class="border1">${pocket.price }</td>
					 <td align="center" class="border1"> <input type="button" value="삭제" class="button2" onclick="del('${pocket.name}')"></td>
				</tr>
			</c:forEach>
         <tr>
         <%
			List<Pocket> list3 = (List) request.getAttribute("list2");
			int total = 0;
			for (int i = 0; i < list3.size(); i++) {
				int Alltotal = list3.get(i).getPrice()*list3.get(i).getCount();
				total += Alltotal;
			}
		%>
         <td height="50px" align="center" colspan="4" class="border1">총 결제 금액 : <%=total%></td></tr>
            <tr><td align="center" colspan="4" >
            <input type="submit"   value="결제하기" class="button1"> &nbsp;<input type="reset" value="취소" class="button1">
            </td></tr>
            <tr height="100px"></tr>
      </table>
   </center>
</body>
</html>