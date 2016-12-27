<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main_center</title>
<style>
#visual {
   margin: 0 auto;
   width: 1300px;
   height: 860px;
   background-color: #fff;
   position: relative;
}

a:visited {
   text-decoration: none;
   color: #333;
}

#section1 {
   position: absolute;
   margin-top: 20px;
   margin-left: 0px;
   width: 330px;
   height: 550px;
   background-color: orange;
   padding: 0;
}

#section1 div {
   position: absolute;
   margin: 0;
}

/*about */
/*about */
#section2{
   position:absolute;
   margin-top:20px;
   right:0px;
   width:330px;
   height:300px;
   background-color:#d0e7ee;
   padding:0; 
   transition:all 0.5s;
   
 
}

#section2:hover {
    position:absolute;
   background-color:#d0e7ee; 
   cursor:pointer; 
   margin-top:20px;
    right:0px; 
   background-color: #FFCCCC;
    width:335px;
    height:305px;
 /*    -webkit-transform:rotate(180deg); */
   animation: beat.4s infinite;
   
}

@keyframes beat {
            0%   { transform:rotate(10deg);}
            50% { transform:rotate(-10deg);}
            100%{ transform:rotate(10deg);}
}


#section2 div{
    position:absolute;
    margin: 0;
}



#section3 {
   position: absolute;
   margin-top: 340px;
   right: 0px;
   width: 330px;
   height: 500px;
   background-color: orange;
   padding: 0;
}

#section3 div {
   position: absolute;
   margin: 0;
}

#section4 {
   position: absolute;
   margin-top: 440px;
   margin-left: 350px;
   width: 330px;
   height: 400px;
   background-color: orange;
   padding: 0;
}

#section4 div {
   position: absolute;
   margin: 0;
}

#section5 {
   position: absolute;
   margin-top: 440px;
   right: 350px;
   width: 250px;
   height: 400px;
   background-color: #dbdad7;
   padding: 0;
   transition-duration: 0.4s;
}

#section6 {
   position: absolute;
   margin-top: 590px;
   margin-left: 0px;
   width: 330px;
   height: 250px;
   background-color: #e7e0c2;
   padding: 0;
   font-size: 40px;
   transition-duration: 0.4s;
}

#st5_text {
   margin-top: 100px;
   font-size: 75px;
}

#section5:hover {
   opacity: 0.4;
   font-size: 90px;
   color: #fff;
   text-decoration: none;
   padding-top: 80px;
   height: 170px;
}

#section6:hover {
   opacity: 0.4;
   font-size: 90px;
   color: #fff;
   text-decoration: underline;
   padding-top: 80px;
   height: 170px;
}

/*그림 위 커버-hover  */
#cover1 {
   color: #fff;
   font-size: 20px;
   width: 330px;
   height: 10px;
   background-color: #333;
   opacity: 0;
   transition: all 0.4s;
}

#cover3 {
   color: #fff;
   font-size: 20px;
   height: 500px;
   width: 10px;
   right: 0;
   background-color: #333;
   opacity: 0;
   transition: all 0.4s;
}

#cover4 {
   color: #fff;
   font-size: 20px;
   width: 330px;
   height: 0px;
   background-color: #333;
   opacity: 0;
   bottom: 0;
   transition: all 0.4s;
}

/* 슬라이드 */
.slider>* {
   margin: 0;
   padding: 0;
}

.slider>ul, .slider>ul li {
   list-style: none;
}

.img_list li img {
   width: 600px;
   height: 400px;
}

.slide_img {
   margin-top: 20px;
   margin-left: 350px;
   position: absolute;
   width: 600px;
   height: 400px;
}

.img_list {
   position: relative;
   height: auto;
}

.slider {
   overflow: hidden;
   position: relative;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
}

.slider li {
   float: left;
}

.btn_box {
   position: relative;
   width: 100%;
   height: 100%;
   z-index: 10;
}

.btn_box a {
   display: block;
   position: absolute;
   width: 35px;
   height: 35px;
   top: 50%;
}

.btn_box a.prev {
   left: 0px
}


.btn_box a.next {
   right: 10px;

}

a{
  text-decoration: none;
  color: #333;
}


</style>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
   $(function() {

      var img_wd = $(".img_list li img").width();//가로길이
      var img_ht = $(".img_list li img").height();//세로길이
      $(".img_list").width(
            $(".img_list li").width() * $(".img_list li").size())//사진 수 x 가로길이=총 가로길이 
      $(".img_list li:last").prependTo(".img_list");//미리붙이기
      $(".img_list").css({
         "margin-left" : -img_wd,//마진주기
         "top" : -img_ht
      });

      //오른쪽으로 이동
      $(".next").click(
            function() {
               $(".next").hide();
               $(".img_list").animate(
                     {
                        marginLeft : parseInt($(".img_list").css(
                              "margin-left"))
                              - img_wd + "px"
                     }, function() {
                        $(".img_list li:first").appendTo(".img_list");
                        $(".img_list").css("margin-left", -img_wd)
                        $(".next").show();
                     })
            });

      //왼쪽으로 이동
      $(".prev").click(
            function() {
               $(".prev").hide();
               $(".img_list").animate(
                     {
                        marginLeft : parseInt($(".img_list").css(
                              "margin-left"))
                              + img_wd + "px"
                     }, function() {
                        $(".img_list li:last").prependTo(".img_list");
                        $(".img_list").css("margin-left", -img_wd)
                        $(".prev").show();
                     });
            });

      var timer = setInterval(function() {
         $(".next").click();
      }, 3000);

      $(".slide_img").on("mouseenter", function() {
         clearInterval(timer)
      }).on("mouseleave", function() {
         timer = setInterval(function() {
            $(".next").click();
         }, 3000);

      });

   });//ready

   var no;//가져오는 번호

   //내려오는 커버
   function down1(no) {

      if (no == 1) {
         var c = document.getElementById('cover1');
         c.style.height = 550 + "px";
         c.style.opacity = 0.8;
      } else if (no == 3) {
         var c = document.getElementById('cover3');
         c.style.width = 330 + "px";
         c.style.opacity = 0.8;
      } else if (no == 4) {
         var c = document.getElementById('cover4');
         c.style.height = 400 + "px";
         c.style.opacity = 0.8;
      }
   }//down1

   //올라가는 커버
   function up1(no) {
      if (no == 1) {
         var c = document.getElementById('cover1');
         c.style.height = 10 + "px";
         c.style.opacity = 0;
      } else if (no == 3) {
         var c = document.getElementById('cover3');
         c.style.width = 10 + "px";
         c.style.opacity = 0;
      } else if (no == 4) {
         var c = document.getElementById('cover4');
         c.style.height = 0+ "px";
         c.style.opacity = 0;
      }
   } //up1
</script>

</head>

<body>
   <div id="visual">

      <div class="slide_img">
         <div class="slider">
            <div class="btn_box">
               <a href="#" class="prev"><img src="/resources/image/main_prev.png"></a> 
               <a href="#" class="next"><img src="/resources/image/main_next.png"></a>
            </div>
            <ul class="img_list">
               <li><img src="/resources/image/img2.jpg"></li>
               <li><img src="/resources/image/img3.jpg"></li>
               <li><img src="/resources/image/img4.jpg"></li>
               <li><img src="/resources/image/img5.jpg"></li>
            </ul>
         </div>
      </div>


      <a href="gallery.do?action=1">
         <div id="section1" onmouseover="down1(1)" onmouseout="up1(1)">
            <div>
               <img src="/resources/image/gallery.jpg" width="330px"
                  height="550px">
            </div>
            <div id="cover1">
               <table
                  style="margin-top: 150px; line-height: 40px; font-size: 14px;">
                  <tr>
                     <td align="center" height="40px" style="font-size: 25px;">Gallery</td>
                  </tr>
                  <tr>
                     <td height="80px"></td>
                  </tr>
                  <tr>
                     <td>실내, 자연광, 실외로 분류하여 <br>사진을 보여드리고 있습니다.
                     </td>
                  </tr>
                  <tr>
                     <td></td>
                  </tr>

               </table>


            </div>
         </div>
      </a> 
      
      
      
      <a href="/MellowTone/Produce">
         <div id="section2">
            <div>
               <img src="/resources/image/about.png" width="330px"
                  height="300px">
            </div>
            <div></div>
         </div>
      </a> 
      
      
      
      
      <a href="/MellowTone/item?no=8">
         <div id="section3" onmouseover="down1(3)" onmouseout="up1(3)">
            <div>
               <img src="/resources/image/item_img.jpg" width="330px"
                  height="500px">
            </div>
            <div id="cover3">
               <table
                  style="margin-top: 100px; line-height: 40px; font-size: 14px;">
                  <tr>
                     <td align="center" height="40px" style="font-size: 25px;">Item</td>
                  </tr>
                  <tr>
                     <td height="50px"></td>
                  </tr>
                  <tr>
                     <td align="center">저희 MellowTest을 이용하시면</td>
                  </tr>
                  <tr>
                     <td align="center">여성 드레스, 남성 턱시도 부터</td>
                  </tr>
                  <tr>
                     <td align="center">간단한 소품까지</td>
                  </tr>
                  <tr>
                     <td align="center">모두 대여해 드립니다.</td>
                  </tr>

               </table>

            </div>
         </div>
      </a> <a href="reservation.do?action=booking">
      
         <div id="section4" onmouseover="down1(4)" onmouseout="up1(4)" style="overflow: hidden;">
            <div>
               <img src="/resources/image/cal.jpg" width="330px"
                  height="400px">
            </div>
            <div id="cover4">
               <table
                  style="margin-top:80px; line-height: 40px; font-size: 14px;">
                  <tr>
                     <td align="center" height="40px" style="font-size: 25px;">Reservation</td>
                  </tr>
                  <tr>
                     <td height="40px"></td>
                  </tr>
                  <tr>
                     <td align="center">촬영하시고자 하는 날짜와</td>
                  </tr>
                  <tr>
                     <td align="center">대여하시는 아이템까지</td>
                  </tr>
                  <tr>
                     <td align="center">함께 예약 가능합니다.</td>
                  </tr>
                  <tr>
                     <td align="center"></td>
                  </tr>

               </table>
            </div>
         </div>
         
         
      </a> <a href="community.do?action=qa">
         <div id="section5" onClick="move_Page(5)">
            <div id="st5_text">Q&A</div>
         </div>
      </a> 
      
      <a href="community.do?action=notice">
         <div id="section6" onClick="move_Page(6)">
            <div id="st6_text">Event</div>
         </div>
      </a>


   </div>

</body>

</html>
