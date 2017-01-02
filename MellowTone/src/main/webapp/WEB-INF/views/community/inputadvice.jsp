<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1대1문의</title>
<link rel="stylesheet" type="text/css" href="/resources/css/jaehyuntest.css" title="blue" media="screen" />
<link rel="stylesheet" type="text/css" href="http://s1.cafe.daumcdn.net/cafe/_c21_/css/mEr9/321/20161123175651.91/20161123175556.27/20160602174211.21.css?grpid=mEr9" />
<link rel="stylesheet" href="http://s1.daumcdn.net/editor/releases/7.4.33-3/css/content_view.css" type="text/css" charset="utf-8"/>
<script>
$(document).ready(function(){
   $("#blah").hide();   

   function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
     
               $("#blah").show();   
              $('#blah').attr('src', e.target.result);
                
                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                //(아래 코드에서 읽어들인 dataURL형식)
            }                   
            reader.readAsDataURL(input.files[0]);
            //File내용을 읽어 dataURL형식의 문자열로 저장
        }
    }//readURL()--

    
    //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
    $("#imgInp").change(function(){

       	readURL(this);
  
    });
    
	var formObj = $("form[role='addform']");
	$("#listBtn").on("click", function(){
		var title = $('#title').val();
		var content = $('#contents').val();
		if(title=='')
			alert("제목을 입력하세요");
		else if(content=='')
			alert("내용을 입력하세요");
		else{
			formObj.submit();
		}
	});
 });
 

</script>
</head>
<body>
	<div class="container">
		<form role="listform" method="post" action="boardlist">
			<input type='hidden' name='bno' value="${boardVO.bno}"> <input
				type='hidden' name='tno' value="${cri.tno}"> <input
				type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
				type='hidden' name='searchType' value="${cri.searchType}"> <input
				type='hidden' name='keyword' value="${cri.keyword}">
		</form>
		<form role="addform" method="post" enctype="multipart/form-data" action="adviceinputpage">

			<!-- end list_btn_area -->
			<div class="cl">&nbsp;</div>
			<div class="article_subject line_sub">

				<div class="subject" id="title_div2">
				<div style="float:left;">
				<p><span class="b">분류</span><span
						class="bar2">|</span>						
						<select name="category" style="width: 60px;">
							<option value="에러1">에러1</option>
							<option value="에러2">에러2</option>
							<option value="에러3">에러3</option>
							<option value="에러4">에러4</option>
							</select>

					</p></div><br><br>
					<span class="headcate"></span>  <p><span class="b" style="float: left;">제목</span><span
						class="bar2" style="float: left;">|</span> <input type="text" name="title"
						style="width: 96%;float: left;" value="${boardVO.title}" /></p><br>
				</div>
			</div>
			<div class="form-group" id="fileselect">
				<label for="imgInp"><span id="fileFind">파일 첨부</span></label>&nbsp; <input
					type="file" id="imgInp" name="file" accept=".gif, .jpg, .png"
					style="display: none"
					onchange="javascript: document.getElementById('ddd').value = this.value">
			</div>
			<!-- end article_writer -->
			<div id="bbs_contents" class="bbs_contents">
				<div class="bbs_contents_inbox">
					<div id="user_contents" name="user_contents"
						class="user_contents tx-content-container scroll ">
						<table class="protectTable" id="protectTable">
							<tbody>
								<tr>
									<td>
										<!-- clix_content 이 안에 본문 내용 외에 다른 내용을 절대 넣지 말 것  <script
										type="text/javascript">//<![CDATA[
										document.write(removeRestrictTag());
										//]]></script> -->
										<p style="text-align: center;">
											<img src="${boardVO.image}" class="txc-image" border="0"
												actualwidth="70" width="70" exif="{}" data-filename="..png"
												style="clear: none; float: none;" id="blah">
										</p>
										<p>
											<br>
										</p>
										<p>
											<textarea name="content" id="contents"
												style="border: 1; display: block; width: 1120px; height: 350px;"></textarea>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="clearTable">
							<tbody>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!--  <script type="text/javascript">//<![CDATA[
				redefineLink();
				//]]></script>-->
				</div>
			</div>
			<div class="cl">&nbsp;</div>

		<div class="box-footer" style="margin-left: 45%;">
			<button type="submit" class="btn btn-warning" id="addBtn">등록하기</button>
			<input type="button" class="btn btn-warning" id="listBtn"
				value="돌아가기">
		</div>
		</form>

	</div>
	<!-- /.content-wrapper -->
</body>

</html>