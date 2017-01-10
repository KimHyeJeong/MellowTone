<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기 2단계</title>
	<script type="text/javascript">
		function cancel(){
			location.href="/MellowTone/book";
		}
	</script>
</head>
<body>
	<center>
	<form method="post" action="./reservation.do?action=last">
		<table align = "center" cellspacing= "1" cellpadding= "2" bgcolor ="#e6f6e6" >
  	<tr>
  		<th align="center">1단계</th>
  		<th align="center"><font color="red">2단계</font></th>
  		<th align="center">3단계</th>
  	</tr>
  	<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>판매가</th>
				<th>합계</th>
				<th>삭제</th>
			</tr>
			<tr>
				<td align="center">Dress</td>
				<td align="center">2</td>
				<td align="center">70,000</td>
				<td align="center">140,000</td>
				<td align="center">X</td>
			</tr>
			<tr>
		<td colspan="5" align="center">총 결제 금액 : </td> 
		</tr>
		<tr>
		<td colspan="5" align="center"><input type="reset" value="취소" onclick="cancel()">     <input type="submit" value="결제하기">
		</td></tr>
		</table>
		</form>
	</center>
</body>
</html>