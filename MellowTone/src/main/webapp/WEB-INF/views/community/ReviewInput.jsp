<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

/* 첨부파일 css */
#imgInp{display: none;}
#fileName{ font-family: '맑은 고딕'; width:600px; height:25px;  border:solid #b9b9b9 1px; }
#fileFind{
 background: #704d1a;
 font-size:13px;
 padding:6px;
 color: white;
 font-family: '맑은 고딕';
 position: relative;
 cursor: pointer;
 

}



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

.button2 {
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

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
var check_file =0;
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
        check_file=1;  
       readURL(this);
    });

 });
 
function check(){
   
   var title = document.frm.title.value;
   var contents = document.frm.contents.value;
   if(title.trim()==''){
      alert("제목을 입력하세요");
   }else if(contents.trim() == ''){
      alert("내용을 입력하세요");
   }else if(check_file!=1){
      alert("사진을 업로드하세요");
   }else {
      document.frm.submit();
   }
}
</script>
</head>
<body>
   <center>
      <form action="review.do?action=insert" method="post" name="frm"
         enctype="multipart/form-data">
          <table cellpadding="8"
            style="font-size: 18px; border-collapse: collapse; line-height: 30px;"
            width="900px">
            <tr style="font-size: 30px; font-weight: bold;">
               <td align="center" class="border2" colspan="4" height="110px"
                  align="center">REVIEW</td>
            </tr>

            <tr>
               <td bgcolor="#dae6f4" class="border1" align="center" width="150px">작성자</td>
               <td class="border1" align="center">${id}</td>
            </tr>

           <tr>
               <td class="border1" align="center" bgcolor="#dae6f4" width="150px">첨부파일</td>

               <td align="center" class="border1"><input type="file" id="imgInp" name="file" accept=".gif, .jpg, .png" onchange="javascript: document.getElementById('fileName').value = this.value"> 
               <input type="text" id="fileName"> &nbsp; <label for="imgInp"><span id="fileFind">파일찾기</span></label>
                  &nbsp;<input type="button" class="button1" value="취소" id="filecancle" />
                  </td>
            </tr>

           
           <tr>
               <td bgcolor="#dae6f4" class="border1" align="center" width="150px">제목</td>
               <td class="border1" width="420px"><input type="text"
                  name="title"
                  style="width: 750px; height: 30px; margin: 0; border: 0;"></td>

            </tr>


             <tr>
               <td class="border1" colspan="2" align="center"> <img id="blah" src="#" />
               <textarea class="ttr" rows="27" cols="71" name="contents" id="contents"> </textarea></td>
            </tr>
           
           <tr>
               <td class="border1" colspan="2" align="right"><input
                  type="button" class="button2" value="등록" onclick="check()"/> <input type="button"
                  class="button2" value="취소" onclick="location.href='review.do'" /></td>
            </tr>
         
         <tr height="100px"></tr>
         
         </table>
      </form>
   </center>
</body>
</html>