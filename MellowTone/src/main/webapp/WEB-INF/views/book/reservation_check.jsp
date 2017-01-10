<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function cancel(){
			location.href="../main.do";
		}
	</script>
</head>
<body>
	<form method="post" action="../main.do">
	<table align="center" cellspacing= "1" cellpadding= "2" bgcolor ="#e6f6e6">
		<caption>예약 확인/취소</caption>
			<tr>
				<td align="center">
					귀하의 에약일은 <br>
					<font color="green">x년 x월 x일</font> 입니다.
				</td>
			</tr>
			<tr>
				<td align="center">
					이용에 차질이 없으시길 바랍니다.<br>
					<font color="red">※환불은 예약일정일로부터 3일 전까지 가능합니다.</font>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="홈으로"> <input type="reset" value="취소하기" onclick="cancel()"></td>
			</tr>
	</table>
	</form>
</body>
</html>