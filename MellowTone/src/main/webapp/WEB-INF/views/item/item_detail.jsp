<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Item Dress Wedd</title>
<style>
/* #position {
   position: absolute;
   left: 433px;
} */

   .button2{
     border:0;
     height:35px;
     font-size:18px;
     color:#fff;
     background-color: #704d1a;
     cursor: pointer;
   }
</style>
<script type="text/javascript">

<%-- function pocketWin(){
         
      
      <%if (session.getAttribute("id") != null){ %>
         window.open('pocket.do?action=add_item&name=${item.name}','pocket', 'width=450,height=300,top=50,left=700,right=200');
      <%}else{ %>
         alert("�α����� �ؾ� ����Ҽ��ֽ��ϴ�");   
      <%}%>
   } --%>
function cancel(){
	location.href="item.do?action=dress";
}
</script>
</head>
<!-- row-fluid : ����ó��(���� �ȿ��� �� ĭ�� ó��), ��������� �ǹ�, ���������� �þ�ų� �پ�� ǥ�õ�
    thumbnail : �̹����� �۰� ������ ����, <a>����� �������� ��� -->
<body>
   <center>
   <table align="center" cellpadding="8" width="900px">
      <tr height="110px">
      <td style="text-align:center; font-size: 30px; font-weight: bold;" colspan="4">${item.name}</td>
      </tr>
      
      <tr class="background">
         <td align="center"  ><img src="${item.detailpath }" width="95%"/></td></tr>
            
            <tr><td style="font-size:26px;" align="center"><strong>:)${item.name}</strong></td></tr>
            <tr><td style="font-size:18px;" align="center">${item.content }</td></tr>
            <tr><td style="font-size:18px;" align="center">�뿩 : ${item.price }��</td></tr>
            <tr height="90px"><td align="center">
               <input type="button" class="button2" value="��ٱ���"  onclick="pocketWin()" style="font-size: 18px;">&nbsp;
               <input type="button" class="button2" value="�ڷΰ���" onclick="cancel()" style="font-size: 18px;">
            </td></tr>
            <tr height="100px"></tr>
         </table>
   </center>
</body>
</html>