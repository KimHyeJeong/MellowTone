<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.border1 {
   border: solid #b9b9b9 1px;
   border-top: 0;
}

.border2 {
   border: solid #b9b9b9 1px;
   border-top: 0;
   border-left: 0;
   border-right: 0;
}

.button1 {
   border: 0;
   height: 28px;
   color: #fff;
   background-color: #704d1a;
   cursor: pointer;
   font-size: 13px;
}

.view1, .view2, .view3 {
   border: 0;
   height: 30px;
   color: #fff;
   background-color: #545250;
   cursor: pointer;
   font-size: 18px;
}

.ttr {
   width: 900px;
   height: 500px;
   margin: 0;
   border: 0;
   
}

</style>


<script type="text/javascript">
<%-- $(document).ready(function(){
	$(".view2").hide();	
	$("#fileselect").hide();
	$('#update').click(function(){
	<%
	ReviewDTO dto = (ReviewDTO)request.getAttribute("dto");
	String buf_writer = dto.getWriter();
	String buf_id =  (String)session.getAttribute("id");
	if(buf_writer.equals(buf_id)){
	%>
		$('#title').attr("readonly", false);
		$('#content').attr("readonly", false);
		$('#content').focus();
		$(".view1").hide();	
		$(".view2").show();	
		$("#fileselect").show();
	<%}else {%>
		alert("수정할 권한이 없습니다.")
	<%}%>
	});
	

	   function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader(); 
	            reader.onload = function (e) {
	            
	            	$("#blah").show();			
	                $('#blah').attr('src', e.target.result);
	            }                   
	            reader.readAsDataURL(input.files[0]);
	        }
	    }

	    $("#imgInp").change(function(){
	        readURL(this);
	    });

		$('#delete').click(function(){
			<%
			if(buf_writer.equals(buf_id)){
			%>
				location.href='review.do?action=delete&no='+${param.no};
			<%}else { %>
			alert("삭제할 권한이 없습니다");
		<%}%>
		});
});
	var contents = document.frm.contents.value;
		if(title.trim()==''){
			alert("제목을 입력하세요");
		}else if(contents.trim() == ''){
			alert("내용을 입력하세요");
		}else if(check_file!=1){
			alert("사진을 업로드하세요");
		}else {
			document.frm.submit();
		} --%>
  </script>
</head>
<body>
<center>

<form action="review.do?action=update&no=${param.no}&page=${param.page}"  method="post" enctype="multipart/form-data" name="frm">
   <table cellpadding="8"
            style="font-size: 18px; border-collapse: collapse; line-height: 30px;"
            width="900px">
      <tr style="font-size: 30px; font-weight: bold;"><td  class="border2" colspan="4" height="110px" align="center">REVIEW</td></tr>

       <tr>
         <td bgcolor="#dae6f4" class="border1"  width="150x" align="center">작성자</td>
         <td class="border1"  width="250px" align="center">${dto.writer}</td>
         <td bgcolor="#dae6f4" class="border1"  width="150x" align="center">작성일</td>
         <td class="border1" align="center">${dto.gdate}</td>
      </tr>

        <tr id="fileselect">
         <td  class="border1" colspan="4"><input type="file" id="imgInp" name="file" accept=".gif, .jpg, .png">
         <input type="button" value="취소" id="filecancle" /></td>
      </tr>

      <tr>
         <td bgcolor="#dae6f4" class="border1" align="center" width="150px">제목</td>
         <td colspan="3" align="center"  class="border1" ><input type="text" readonly="readonly" style=" width: 600px; height: 30px; margin: 0; border: 0;" id="title" name="title" value="${dto.title}"></td>
      </tr>
      <tr height="350px">
        <td colspan="4" align="center"  class="border1" ><img id="blah" src="${dto.image }" />
        
         <textarea class="ttr" readonly="readonly" id="content" name="contents">${dto.contents}</textarea></td>
      </tr>

      <tr>
         <td colspan="4" align="right" class="border1">
         <input type="button" value="수정" id="update" class="view1"/>
         <input type="button" value="삭제" class="view1" id="delete"/>
         
         <input type="button" value="완료" class="view2" onclick="check()" />
         <input type="button" value="취소" class="view2" onclick="location.href='review.do?action=select&no='+${param.no}+'&page='+${param.page}"/>
         
         <input type="button" value="목록" class="view3" onclick="location.href='review.do?action=list&page='+${param.page}"/>
         
         </td>
         
      </tr>   
         <tr height="100px"></tr>
      
   </table>
</form>
</center>
</body>
</html>