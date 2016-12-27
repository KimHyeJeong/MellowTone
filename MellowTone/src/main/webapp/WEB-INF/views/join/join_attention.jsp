<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원약관 동의</title>

<style>
.button1 {
	border: 0;
	height: 35px;
	color: #fff;
	background-color: #545250;
	cursor: pointer;
	font-size: 18px;
}

.border1 {
	border: solid #b9b9b9 1px;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}
</style>
<script type="text/javascript">
	function cancel() {
		location.href = "/MellowTone/login";
	}
</script>
</head>
<body>
	<center>
		<form method="post" action="/MellowTone/joinform">
			<table cellpadding="8" style="border-collapse: collapse;" 
				width="500px">
				<tr>
					<td height="110px"></td>
				</tr>
				<tr>
					<th class="border1" style="font-size: 20px">회원약관</th>
				</tr>
				<tr>
					<td class="border1" align="center">제 1 조 (목적)<br> 이 약관은 멜로우톤이 제공하는 장소 및
						시간 관련 제반 <br> 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 <br> 책임사항,
						기타 필요한 사항을 규정함을 목적으로 합니다.<br> 제 2 조 (정의)<br> 이 약관에서 사용하는
						용어의 정의는 다음과 같습니다.<br> ①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기<br>
						등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할
					</td>
				</tr>
				<tr height="50px"></tr>
				<tr>
					<th class="border1" style="font-size: 20px">개인정보취급방침</th>
				</tr>
				<tr>
					<td  class="border1" align="center">정보통신망법 규정에 따라 멜로우톤에 회원가입 신청하시는 <br> 분께
						수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적<br> ,개인정보의 보유 및 이용기간을 안내 드리오니
						자세히 읽은 후 <br> 동의하여 주시기 바랍니다.<br> 1. 수집하는 개인정보<br>
						이용자는 회원가입을 하지 않아도 작가 소개, 예약보기 등 <br> 대부분의 포토 서비스를 회원과 동일하게
						이용할 수 있습니다.
					</td>
				</tr>
				<tr height="50px"></tr>
				<tr>
					<td colspan="2" align="center"><input class="button1"
						type="submit" value="동의">&nbsp;&nbsp;<input
						class="button1" type="button" value="동의하지않음" onclick="cancel()">
					</td>
				</tr>
				<tr>
					<td height="100px"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>