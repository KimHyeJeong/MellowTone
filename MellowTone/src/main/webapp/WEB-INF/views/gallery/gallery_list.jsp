<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

   <center>
      <table align="center" cellpadding="8">
      <tr height="110px">
      <td style="text-align:center; font-size: 30px; font-weight: bold; " colspan="4">${semititle }</td>
      </tr>
      <c:forEach items="${gallery }" var="gallery" varStatus="status">
      <c:if test="${status.index%3==0}">
            <tr>
      </c:if>
      <td>
			<center>
			<img src="${gallery.path }"><br>
			<strong> ${gallery.name }</strong>
			<p> ${gallery.content }</p>
			</center>
		</td>
			<c:if test="${status.index%3==2}">
				</tr>
			</c:if>

		</c:forEach>
		</table>
	</center>
</body>
</html>