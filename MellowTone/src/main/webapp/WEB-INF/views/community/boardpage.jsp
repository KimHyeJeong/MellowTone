<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/jaehyuntest.css" title="blue" media="screen" />
<link rel="stylesheet" type="text/css" href="http://s1.cafe.daumcdn.net/cafe/_c21_/css/mEr9/321/20161123175651.91/20161123175556.27/20160602174211.21.css?grpid=mEr9" />
<link rel="stylesheet" href="http://s1.daumcdn.net/editor/releases/7.4.33-3/css/content_view.css" type="text/css" charset="utf-8"/>
<script>
var bno =${boardVO.bno};
var replypage = 1;
function modifyreply(rno){
	var replytext = $('#modifytext-'+rno).val();
	var userid ="${sessionScope.userid}";  
	  $.ajax({
			type:'put',
			url:'/board_replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					getPageList(replypage);
				}
		}});
}	
function modifycancle(rno){ 
	$('#_cmt_contents-'+rno).attr("style","display:block");
	$('#_cmt_button-'+rno).attr("style","display:block");
	$('#_cmt_reply_editor-'+rno).attr("style","display:none");
	//$('#modifytext-'+rno).empty();
}
function modifyform(rno){
	$('#_cmt_contents-'+rno).attr("style","display:none");
	$('#_cmt_button-'+rno).attr("style","display:none");
	$('#_cmt_reply_editor-'+rno).attr("style","display:block");
	//$('#modifytext-'+rno).value(replytext);
}
function removereply(rno){
	  $.ajax({
			type:'delete',
			url:'/board_replies/delete',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			dataType : 'text',
			data : JSON.stringify({ //클라이언트 ---> 서버
				//JSON.stringify()함수 : JSON변환 함수
				bno : bno,
				rno : rno
			}),
			success : function(result) {
				getPageList(replypage);
				$('#cmtCnt').empty();
				$('#cmtCnt').append(result);
			}
		});
	}
	function getPageList(page) {
		var	userid= "${sessionScope.userid}";
	
		$('#replies').empty();
		$.ajax({
					url : '/board_replies/' + bno + '/' + page,
					success : function(data) {
						var str = "";
						$(data.list).each(
										function() {
											str += "<div class='comment_pos' style='background-color: rgb(247, 247, 247);'>"
													+ "<div class='id_admin '>"
													+ "<span> <img src='http://i1.daumcdn.net/cafeimg/cf_img2/bbs2/roleicon/d_level_25.gif' width='13' height='13'>"
													+ this.replyer
													+ "</span> <span  class='comment_date txt_sub p11 ls0'>"
													+ "12:32 <img src='http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif' alt='new' width='8' height='12' class='icon_new'>"
													+ "</span>"
													+ "</div>"
													+ "<div class='comment'>"
													+ "<span id='_cmt_contents-"+this.rno+"' class='comment_contents'"
                    								+"style='display: block;flaot:left;text-align: left;'>"
													+ this.replytext
													+ "</span>"
													+ "</div>"
													if(this.replyer ==userid){
													+ "<div id='_cmt_button-"+this.rno+"' class='txt_btn p11'" 
                    								+"style='display: block'>"
													+ "<span class='bar2 cmt_button_reply'>|</span>"
													+ "<a href='javascript:;' onclick='modifyform("
													+ this.rno
													+ ")' class='p11'>"
													+ "수정</a> <span class='bar2'>|</span>"
													+ "<a href='javascript:;'onclick='removereply("
													+ this.rno
													+ ")' class='p11'> 삭제</a>"
													+ "</div>"
													}
													+ "<div class='cl'>&nbsp;</div>"
													+ "<!-- 수정폼  -->"
													+ "<div id='_cmt_reply_editor-"+this.rno+"'  class='longtail_editor longtail_reply layout_modify'"
                    			+"style='display: none;'>"
													+ "<span class='write_nominate_mentions b' style='display: none;'></span>"
													+ "<div class='longtail_editor_layout'>"
													+ "<table>"
													+ "<tbody>"
													+ "<tr>"
													+ "<td class='longtail_comment inp'>"
													+ "<div class='longtail_comment_wrap'>"
													+ "<textarea id='modifytext-"+this.rno+"'class='inp scroll txt_sub' name='comment_view'rows='3' cols='56'></textarea>"
													+ "</div>"
													+ "</td>"
													+ "<td class='longtail_editor_btn'>"
													+ "<a href='javascript:;'onclick='modifyreply("
													+ this.rno
													+ ")' class='btn submit_content_sub'style='display: block;'>"
													+ "<span class='btn_bg bg05'></span>"
													+ "<span class='btn_txt bt05 w02'>수정</span>"
													+ "</a>"
													+ "<a href='javascript:;' onclick='modifycancle("
													+ this.rno
													+ ")' class='btn cancel_content'style='display: block;'>"
													+ "<span class='btn_bg bg05'></span>"
													+ "<span class='btn_txt bt05 w02'>취소</span>"
													+ "</a></td>"
													+ "</tr>"
													+ "</tbody>"
													+ "</table>"
													+ "</div>"
													+ "</div>"
													+ "</div>"
													+ "<!-- 인풋타입히든 -->"
													+ "<div id='commentData-"+this.rno+"'></div>"
													+ "<div class='dotline line_sub'>&nbsp;</div>";
										});//each
						$('#replies').html(str);
						printPaging(data.pageMaker);
					}
				});//ajax
			}
				function printPaging(pageMaker) {	//페이징뿌리기
					var str = "";
					if (pageMaker.prev) { // '<<' 버튼
						str += "<a href='javascript:;' onclick=''>"
					+"<span class='num_prev'> <span class='arrow'>◀</span>"
					+"<span class='txt_sub'>이전</span>"
					+"</span>"
					+"</a>";
					}
					for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) { //1 2 3 4 버튼
						var strClass = pageMaker.cri.page == i ? 'class=num_box txt_point u b'	: 'num_box';
						str += "<a href='javascript:;' onclick='getPageList("+i+")'class='"+strClass+"'>" + i
								+ "</a>";
					}
					if (pageMaker.next&& pageMaker.endPage > 0) { // '>>' 버튼
						str += "<a href='javascript:;'>"
								+"<span class='num_next'> <span class='txt_sub'>다음</span>"
								+"<span class='arrow'>▶</span>"
								+"</span>"
								+"</a>";
					}
					$('.paging').empty();
					$('.paging').append(str);
				}
	
	$(document).ready(function() {
						var userid = "${sessionScope.userid}";
						$('#searchBtn').on(
								"click",
								function(event) {
									self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ $('#keywordInput').val();
								});

						$("#replyAddBtn").click(function() {
							var replytext = $('#newReplyText').val();
							$.ajax({
								url : '/board_replies',//URL요청
								type : 'post', //method요청방식
								headers : {
									"Content-Type" : "application/json" //서버에게 데이터 JSON으로 넘기겠음!!
								},
								dataType : 'text', //생략가능(클라이언트 <--- 서버)
								data : JSON.stringify({ //클라이언트 ---> 서버
									//JSON.stringify()함수 : JSON변환 함수
									bno : bno,
									replyer : userid,
									replytext : replytext
								}),
								success : function(result) { //요청 성공시 콜백함수
									getPageList(1);
									$('#newReplyText').val('');
									$('#cmtCnt').empty();
									$('#cmtCnt').append(result);
								}
							});
						});//replyAddBtn

						function readURL(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
								reader.onload = function(e) {
									//$("#blah").attr('style','clear: none; float: none; display:block;');
									$('#blah').attr('src', e.target.result);
								}
								reader.readAsDataURL(input.files[0]);
							}
						}//readURL()--
						var replycheck = 0;
						$("#member_cmt").on("click",function() {
									if (replycheck == 0) {
										$("#comment_box_bg-127961").attr(
												"style", "display:block");
										getPageList(1);
										replycheck = 1;
									} else {
										$("#comment_box_bg-127961").attr(
												"style", "display:none");
										$('#replies').empty();
										replycheck = 0;
									}
								});
						$("#goodBtn").on("click", function() {
							$.ajax({
								url : '/board_good/good',//URL요청
								type : 'post', //method요청방식
								headers : {
									"Content-Type" : "application/json" //서버에게 데이터 JSON으로 넘기겠음!!
								},
								data : JSON.stringify({ //클라이언트 ---> 서버
									//JSON.stringify()함수 : JSON변환 함수
									bno : bno,
									userid : userid,
								}),
								success : function(result) { //요청 성공시 콜백함수
									alert(result.status);
									$('#recommendCnt').empty();
									$('#recommendCnt').append(result.goodnum);
								}
							});
						});

						$("#submitBtn").on("click", function() {
							var formObj = $("form[role='form']");
							formObj.attr("method", "post");
							formObj.attr("action", "boardupdate");
							formObj.submit();
						});

						$("#imgInp").change(function() {
							readURL(this);
						});
						$("#inputBtn").on("click", function() {
							var formObj = $("form[role='listform']");
							formObj.attr("method", "get");
							formObj.attr("action", "boardinput");
							formObj.submit();
						});

						$("#cancleBtn").on("click", function() {
							var formObj = $("form[role='listform']");
							formObj.attr("method", "get");
							formObj.attr("action", "boardpage");
							formObj.submit();
						});
						$("#updateBtn")
								.on(
										"click",
										function() {
											$('#fileselect').attr('style',
													"display: block;");
											$('#title_div').attr('style',
													"display: none;");
											$('#title_div2').attr('style',
													"display: block;");
											$('#page').attr('style',
													"display: none;");
											$('#contents')
													.attr('style',
															"border:1; display: block; width:1120px; height:350px;");
											$('#contents').focus();
											$('#updateBtn').attr('style',
													"display: none;");
											$('#removeBtn').attr('style',
													"display: none;");
											$('#inputBtn').attr('style',
													"display:none");
											$('.list_paging').attr('style',
													"display: none;");
											$('#comment_wrap').attr('style',
													"display: none;");
											$('#commentDiv-127961').attr(
													'style', "display: none;");
											$('.prenext_paging').attr('style',
													"display: none;");

											$('#submitBtn').attr('style',
													"display: block;");
											$('#cancleBtn').attr('style',
													"display: block;");
										});
						$("#removeBtn").on("click", function() {
							var formObj = $("form[role='listform']");
							formObj.attr("method", "delete");
							formObj.attr("action", "boardremove");
							formObj.submit();
						});
						$("#listBtn").on("click", function() {
							var formObj = $("form[role='listform']");
							formObj.attr("method", "get");
							formObj.attr("action", "boardlist");
							formObj.submit();
						});
					});
</script>
</head>
<body>
<div class="container">
    <form role="listform" method="post" action="boardlist">
    	<input type='hidden' name='bno' value="${boardVO.bno}">
        <input type='hidden' name='tno' value="${cri.tno}">
        <input type='hidden' name='page' value="${cri.page}">
        <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
        <input type='hidden' name='searchType' value="${cri.searchType}">
    	<input type='hidden' name='keyword' value="${cri.keyword}">
    </form>
	<form role="form" method="post" enctype="multipart/form-data" action="boardupdate">
		                  
		<input type='hidden' name='bno' value="${boardVO.bno}">
		<input type='hidden' name='tno' value="${cri.tno}">
		<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">

		<div class="list_btn_area list_btn_top list_btn_bbs_read">
		<c:if test="${cri.tno>3 || sessionScope.userid =='admin'}">
			<a href="javascript:;" class="btn" id="searchBtn">
				<span class="btn_bg bg03"></span>
				<span class="btn_txt bt03 w07 b"><span class="btn_icon_write" style="margin-right: 5px;">글쓰기 </span></span>
			</a>
		</c:if>
		<c:if test="${sessionScope.userid==boardVO.writer || sessionScope.userid =='admin'}">
			<a href="javascript:;" class="btn" id="updateBtn">
				<span class="btn_bg bt03" style="width: ;"> </span>
				<span class="btn_txt bt03 w03" style="float: left; width: 35px;text-align: left;">수정</span>
			</a>
			<a href="javascript:;" class="btn" id="removeBtn">
				<span class="btn_bg bt03"></span>
				<span class="btn_txt bt03 w23" style="text-align: left;width: 35px;">삭제</span>
			</a>
		</c:if>
			<span class="list_paging">
			<a href="javascript:;" id="listBtn">목록</a>
			<c:if test="${prevbno!=null}">
				<span class="bar2">|</span> 
				<a href="/phonefo/boardpage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType }&keyword=${cri.keyword}&bno=${prevbno}&tno=${cri.tno}" class="prevBtn">
				<span class="arrow">▲</span>윗글</a>
			</c:if>
			<c:if test="${nextbno!=null}">
				<span class="bar2">|</span>
				<a href="/phonefo/boardpage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType }&keyword=${cri.keyword}&bno=${nextbno}&tno=${cri.tno}" class="nextBtn">
				<span class="arrow">▼</span>아랫글</a>
			</c:if>
			</span>
		</div>
		<!-- end list_btn_area -->
		<div class="cl">&nbsp;</div>
		<div class="article_subject line_sub">
			<div class="subject" id="title_div" style="display:block;">
				<span class="headcate"> </span> <span class="b" style="float: left;">제목</span><span
					class="bar2" style="float: left;">|</span><span style="float: left;"> ${boardVO.title}</span> <br>
			</div>
			<div class="subject" id="title_div2" style="display:none;">
				<span class="headcate"> </span> <span class="b"style="float: left;">제목</span><span
					class="bar2" style="float: left;">|</span> <input type="text" name="title" style="width:500px; float: left;" value="${boardVO.title}"/> <br>
			</div>
		</div>
		<!-- end article_subject -->
		<div class="article_writer">
			<span class="p12">작성자:${boardVO.writer}</span>
			<span class="bar2">|</span><span class="p11">조회  ${boardVO.viewcnt}</span>
			<span class="bar2">|</span><span class="p11">추천	0</span>
			<span class="bar2">|</span><span class="p11 ls0">${boardVO.regdate}</span> 
		</div>
		<div class="form-group" id="fileselect" style="display:none">
            <label for="imgInp"><span id="fileFind">파일 첨부</span></label>&nbsp;
        	<input type="file" id="imgInp" name="file" accept=".gif, .jpg, .png" style="display: none"onchange="javascript: document.getElementById('filename').value = this.value"> 
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
									<c:if test="${boardVO.image!=null}">
										<img src="${boardVO.image}"
											class="txc-image"  border="0"
											actualwidth="70" width="70" exif="{}" data-filename="..png"
											style="clear: none; float: none;"
											id="blah">
									</c:if>
									<c:if test="${boardVO.image==null}">
										<img
											class="txc-image"  border="0"
											actualwidth="70" width="70" exif="{}" data-filename="..png"
											style="clear: none; float: none;"
											id="blah">
									</c:if>
									</p>
									<p>
										<br>
									</p>
									<p><div id="page" style="display: block;float: left;">${boardVO.content}</div>
										<textarea name="content" id="contents" style="border:0; display: none;">${boardVO.content}</textarea>
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
		<!-- end bbs_contents -->

		<!-- 모바일 작성글인 경우 카페 앱 소개 링크  -->
				<a href="javascript:;" class="btn" id="submitBtn" style="display:none">
				<span class="btn_bg bt03"></span>
				<span class="btn_txt bt03 w03">완료</span>
			</a>
			<a href="javascript:;" class="btn" id="cancleBtn" style="display:none">
				<span class="btn_bg bt03"></span>
				<span class="btn_txt bt03 w23">취소</span>
			</a>	
		<div class="comment_scrap" id="comment_wrap">
			<p class="comment_view fl">
				<span class="comment_cnt" id="comment_cnt">
					<a href="javascript:;" id="member_cmt"	class="comment_on txt_point">댓글 <span id="cmtCnt">${boardVO.replycnt}</span>
					</a>
				</span>
			</p>
			<div id="shareMenu" class="fr">
				<a class="bbs_recommend fl line_sub" href="javascript:;" id="goodBtn" style="height: 30px;">
					<img src="http://i1.daumcdn.net/cafeimg/cf_img4/img/ico_recommend.gif" width="11" height="13" alt="추천하기">
					<span id="recommendCnt" class="txt_point">${boardVO.goodcnt}</span>
				</a>
			</div>
		</div>


		<div id="commentArea-127961" class="commentBox ">	<!-- 회색배경영역 -->
			<div class="admin_boxT linebg">&nbsp;</div>
			<div id="commentDiv-127961" class="commentDiv bg_sub">	<!-- 애도 회색배경영역? -->
				<div id="replies" class="commentPagingDiv"> <!-- 댓글포위치부분? -->
					<!-- 댓글시작  -->
					
				</div>
				<div class="paging">

				</div>
					<!-- 댓글 입력 Form -->
				<div id="comment_box_bg-127961" style="display:none">
					<div id="replyWrite-127961" class="longtail_editor longtail_reply">
						<div class="longtail_editor_layout">
							<table>
								<tbody>
									<tr>
										<td class="longtail_comment inp">
											<div class="longtail_comment_wrap">
												<textarea class="inp scroll" id="newReplyText" rows="3"cols="56"></textarea>
											</div>
										</td>
										<td class="longtail_editor_btn">
											<a href="#"	onclick="return false;" class="btn submit_content">
												<span class="btn_bg bg01" style="width:10%"></span>
												<span class="btn_txt bt01 b" id="replyAddBtn">등록&emsp;</span>
											</a>
										</td>
									</tr>
									<tr class="longtail_menu_row">
										<td>&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
					<!-- // 댓글 입력 Form끝 -->
			</div>
			<!-- end commentDiv -->
		</div>
		<!-- end commentBox -->
		<!-- end list_btn_area -->
		<div class="cl">&nbsp;</div>

		<!-- 새롭게 추가된 윗글/아랫글 -->
		<div class="prenext_paging">
			<ul>
				<c:if test="${prevbno!=null}">
				<li>
					<span class="prenext_title">
						<a href="/phonefo/boardpage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType }&keyword=${cri.keyword}&bno=${prevbno}&tno=${cri.tno}">
							<span class="arrow">▲</span>윗글</a>
						&nbsp;&nbsp; <span class="bar2">|</span>&nbsp;
						<a class="title" href="/phonefo/boardpage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType }&keyword=${cri.keyword}&bno=${prevbno}&tno=${cri.tno}">
						${prevtitle}</a>
					</span>
					<span class="txt_sub p11 ls0 prenext_date">2016.12.02</span></li>
				</c:if>
				<c:if test="${nextbno!=null}">
				<li>
					<span class="prenext_title">
						<a href="/phonefo/boardpage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType }&keyword=${cri.keyword}&bno=${nextbno}&tno=${cri.tno}">
							<span class="arrow">▼</span>아랫글</a>
						<span class="bar2">|</span>&nbsp;
						<a class="title" href="/phonefo/boardpage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType }&keyword=${cri.keyword}&bno=${nextbno}&tno=${cri.tno}">
						${nexttitle}</a>
					</span>
					<span class="txt_sub p11 ls0 prenext_date">2016.12.02</span>
				</li>
				</c:if>
			</ul>
		</div>
	</form>
</div>
</body>
</html>
