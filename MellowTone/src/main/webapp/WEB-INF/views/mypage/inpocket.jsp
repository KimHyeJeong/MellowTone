<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 담기</title>
	<script type="text/javascript">
	function goPocket(){
		opener.location.href="mypage.do?action=pocket_list";
		window.close();
	}
	
	</script>
	
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
</head>
<body>
	<center>
	<form>
		<table cellpadding="5">
		<tr>
			<td>
				${picture.name} 상품이 장바구니에 상품이 정상적으로 담겼습니다.
				
			</td>
		</tr>
		<tr>
			<td align="center">
				<img src="/MellowTest/image/addcart.png">
			</td>
		</tr>
		<tr>
		<td align="right">
		<hr>
		<input class="button2" type="button" value="장바구니이동" onclick="goPocket()"> <input class="button2" type="button" value="쇼핑계속하기" onclick="window.close()">
		</td>
		</tr>
		</table>
	</form>
	</center>
</body>
</html>