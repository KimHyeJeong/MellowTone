<%@page import="org.springframework.beans.factory.support.SecurityContextProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글리스트</title>
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/jaehyuntest.css" title="blue" media="screen" />
<link rel="stylesheet" type="text/css" href="http://s1.cafe.daumcdn.net/cafe/_c21_/css/mEr9/321/20161123175651.91/20161123175556.27/20160602174211.21.css?grpid=mEr9" />
<link rel="stylesheet" href="http://s1.daumcdn.net/editor/releases/7.4.33-3/css/content_view.css" type="text/css" charset="utf-8"/>
 -->
<script type="text/javascript">
var userid;
$(document).ready(function(){
/*    $('#btn_search').on("click",   function(event) {
      self.location = "boardlist"
         + '${pageMaker.makeQuery(1)}'
         + "&searchType="
         + $("select option:selected").val()
         + "&keyword=" + $('#keywordInput').val()
         + "&tno=" + $('#tno').val();
   }); */
/*    $('#btn_search_mine').on("click",   function(event) {
      userid= "${sessionScope.userid}";
      if(userid=='')
         alert("로그인을 해야 사용할 수 있는 기능입니다.");
      else{
      self.location = "boardlist"
         + '${pageMaker.makeQuery(1)}'
         + "&searchType="
         + 'w'
         + "&keyword=" + userid
         + "&tno=" + $('#tno').val();
      }
   }); */
/*    $(".btn_icon_write").on("click", function(){
      userid= "${sessionScope.userid}";
      if(userid=='')
         alert("로그인을 하고 사용하시기 바랍니다.");
      else{
            var formObj = $("form[role='iniputform']");
            formObj.submit();
      }
         }); */
   $(".write").on("click", function(){
	   var formObj = $("form[role='iniputform']");
       formObj.submit();
   });
});
</script>

</head>
<body>
   <form role="iniputform" action="boardinput" method="get">
      <input type='hidden' id='tno' name='tno' value="${cri.tno}">
      <input type='hidden' name='page' value="${cri.page}">
      <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
   </form>
   <center>
      <div class="container">
         <div id="primaryContent">
            <table class="roundTable">
               <tbody class="pos_rel">
                  <tr>
                     <td class="tlb" nowrap="">&nbsp;</td>
                     <td class="tcb" nowrap="">&nbsp;</td>
                     <td class="trb" nowrap="">&nbsp;</td>
                  </tr>
                  <tr class="pos_rel">
                     <td class="lb" nowrap="">&nbsp;</td>
                     <td class="cb pos_rel">
                        <!-- content start -->
<%--                         <c:if test="${ (sessionScope.id !=null&&cri.tno>1)|| (cri.tno>=1&&sessionScope.id =='admin')}">
                        <div class="list_btn_areaT">
                           <a href="#"
                              onclick="caller('/_c21_/united_write?grpid=mEr9&amp;mgrpid=&amp;fldid=LNQb&amp;page=1'); return false;"
                              class="btn"><span class="btn_bg bg03"></span><span
                              class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span></a>
                        </div>
                        </c:if> --%>
                        <form name="listForm" method="post">
                           <input type="hidden" name="moveto" value=""> <input
                              type="hidden" name="changerolecode" value="">
                           <table class="bbsList">
                                 <col width="10%;">
                                 <col width="*%">
                                 <col width="15%;">
                                 <col width="15%;">
                                 <col width="5%;">
                                 <col width="5%;">
                              <%-- <caption>${title}</caption> --%>
                              <thead>
                                 <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th nowrap="nowrap">작성일</th>
                                    <th nowrap="nowrap">조회</th>
                                   <!--  <th nowrap="nowrap">추천</th> -->
                                 </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${board}" var="boardVO">
                                 <tr>
                                    <td class="num" nowrap="nowrap">${boardVO.bno}</td>
                                    <td class="subject">
                                       <a href='/MellowTone/boardpage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}&tno=${cri.tno}'>
                                          ${boardVO.title}[${boardVO.replycnt}]</a>
                                       <c:if test="${boardVO.image!=null}">
                                           <img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif" width="11" height="11" alt="사진첨부" class="icon_file_photo">
                                        </c:if>
                                    </td>
                                    <td class="nick" style="text-align: center;">
                                       ${boardVO.writer}
                                    </td>
                                    <td class="date" nowrap="nowrap">
                                    <fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd"/></td>
                                    <td class="count" nowrap="nowrap">${boardVO.viewcnt}</td>
<%--                                     <td class="recommend_cnt" nowrap="nowrap">${boardVO.goodcnt}</td> --%>
                                 </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                           <!-- end bbsList -->
                        </form>

                        <div class="list_btn_area">
                           <c:if test="${ (sessionScope.userid !=null&&cri.tno<=3)|| (cri.tno>3&&sessionScope.userid =='admin')}">
                           <a href="#"
                              onclick="caller('/_c21_/united_write?grpid=mEr9&amp;mgrpid=&amp;fldid=LNQb&amp;page=1'); return false;"
                              class="btn"><span class="btn_bg bg03"></span><span
                              class="btn_txt bt03 w07 b"><span class="btn_icon_write">글쓰기</span></span></a>
                              </c:if>
                           <div class="paging ">
                              <c:if test="${pageMaker.prev}">
                                 <a   href="boardlist${pageMaker.makeSearch(pageMaker.startPage - 1) }&tno=${cri.tno}">
                                    <span class="num_prev"> <span class="arrow">◀</span>
                                       <span class="txt_sub">이전</span>
                                    </span> 
                                 </a>
                              </c:if>
                              <c:forEach begin="${pageMaker.startPage }"   end="${pageMaker.endPage }" var="idx">
                                 <a href="boardlist${pageMaker.makeSearch(idx)}&tno=${cri.tno}" class="<c:out value="${pageMaker.cri.page == idx?'num_box txt_point u b':'num_box'}"/>">${idx}</a>
                              </c:forEach>
                              <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                 <a href="boardlist${pageMaker.makeSearch(pageMaker.endPage +1) }&tno=${cri.tno}">
                                    <span class="num_next"> 
                                       <span class="txt_sub">다음</span><span class="arrow">▶</span>
                                    </span>
                                 </a>
                              </c:if>
                           </div>
                           <!-- end paging -->
                        </div> <!-- end list_btn_area -->

                        <div class="search_box_wrap search_box_bottom" style="margin-left: 30%;">
                           <div class="search_box_floated_elem searchBox_bbsList_bottom">

                              <select id="item" name="searchType"  class="inp">
                                 <option value="n"
                                    <c:out value="${cri.searchType == null?'selected':''}"/>>
                                    전체보기</option>
                                 <option value="t"
                                    <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                                    Title</option>
                                 <option value="c"
                                    <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
                                    Content</option>
                                 <option value="w"
                                    <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
                                    Writer</option>
                              </select>
                              <div class="suggest">
                                 <input type="text" value="" name="keyword" size="50px;"style="height: 20px; width: 300px;" id="keywordInput"
                                    autocomplete="off" class="inp query" />
                              </div>
                              <a href="javascript:;" class="btn_search" id="btn_search"
                                 ><img src="http://i1.daumcdn.net/cafeimg/cf_img2/img_blank2.gif"
                                 width="37" height="21" alt="검색"></a>
                              <a   href="javascript:;" id="btn_search_mine">내가 쓴 글</a>
                              <input type="button" class="write" value="글쓰기">
                           </div>
                           <!-- end cafeSearchBox -->
                        </div>
                     </td>
                     <td class="rb" nowrap="">&nbsp;</td>
                  </tr>
                  <tr>
                     <td class="blb" nowrap="">&nbsp;</td>
                     <td class="bcb" nowrap=""></td>
                     <td class="brb" nowrap="">&nbsp;</td>
                  </tr>
               </tbody>
            </table>
            <!-- end roundTable -->
         </div>
      </div>

   </center>
</body>
</html>