<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
/* html{overflow-y:scroll; width:100%;}
#wrap{width:1300px; margin: 0 auto} */
body, html {
   margin: 0 auto;
   width: 100%;
   height: 100%;
}

body {
   background-color: #fff;
   text-align: center;
   *word-break: break-all;
   -ms-word-break: break-all
}

html {
   overflow-y: scroll;
}

#wrap {
   width: 1300px;
   margin: 0 auto;
}

#top {
   z-index: 5;
}

#main_Center {
   width: 100px;
   margin: 0 auto;
}

#popup1 {
   /* display: none; */
   width: 100%;
   height: 100%;
   background-color: #333;
   display: none;
   position: fixed;
   z-index: 20;
   cursor: pointer;
}

#prev_bt {
   position: absolute;
   left: 0;
   border-style: none;
   background: none;
   border-style: none;
   cursor: pointer;
}

#next_bt {
   position: absolute;
   right: 0;
   border-style: none;
   background: none;
   cursor: pointer;
}

#bigimage {
   margin-left: 50%-;
   width: auto;
   height: auto;
   position: fixed;
   display: none;
   z-index: 21;
   cursor: pointer;
}

</style>
<script type="text/javascript" src="/MellowTest/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
   var num;
   var total;

   
   $(function() {
      $('#bigimage').click(function() {
         fly();
      });
   });

   function a1(no, size) {
      num = no;
      total = size;
      
      if (num == 1) {
         $('#prev_bt').hide();
         $('#next_bt').show();
      } else if (num != 1 && num != total) {
         $('#prev_bt').show();
         $('#next_bt').show();
      } else {
         $('#prev_bt').show();
         $('#next_bt').hide();
      }

      var w = document.documentElement.clientWidth / 2;
      var h = document.documentElement.clientHeight / 2;
      var bigimage = document.getElementById("bigimage");
      var prev_bt = document.getElementById("prev_bt");
      var next_bt = document.getElementById("next_bt");
       
      bigimage.src = $("input[id=" + no + "]").val();
      
     bigimage.onload=function(e){
        var x = w - bigimage.width / 2;
       var y = h - bigimage.height / 2;
       prev_bt.style.marginTop = h-65+"px";
       next_bt.style.marginTop = h-65+"px";
      document.getElementById("popup1").style.display = "block";
        document.getElementById("popup1").style.opacity = "0.7";
        bigimage.style.marginLeft = x + "px";
        bigimage.style.marginTop = y + "px";
        bigimage.style.display = "block";
        }
   }

   $("#bigimage").change(function(){
      alert("체크");

   });
   
   function fly() {
      document.getElementById("popup1").style.display = "none";
      document.getElementById("bigimage").style.display = "none";
      
   }

   function prev_bt() {
      num--;
      //alert('prev_bt: ' + num)
      //alert('total: ' + total)

      if (num < 1) {
         num++;
         $('#prev_bt').hide();
         return;
      }
      if (num == 1 || num < 1) {
         $('#prev_bt').hide();
         $('#next_bt').show();
      } else if (num != 1 && num != total) {
         $('#prev_bt').show();
         $('#next_bt').show();
      } else if (num == total || num > total) {
         $('#prev_bt').show();
         $('#next_bt').hide();
      }

      a1(num, total);
   }

   function next_bt() {
      num++;
      //alert('next_bt: ' + num)
      //alert('total: ' + total)

      if (num > total) {
         num--;
         $('#next_bt').hide();
         return;
      }

      if (num == 1 || num < 1) {
         $('#prev_bt').hide();
         $('#next_bt').show();
      } else if (num != 1 && num != total) {
         $('#prev_bt').show();
         $('#next_bt').show();
      } else if (num == total || num > total) {
         $('#prev_bt').show();
         $('#next_bt').hide();
      }

      a1(num, total);
   }
</script>
</head>

<body>
   <div id="popup1">
      <button id="prev_bt" type="button" onclick="prev_bt()">
         <img src="./gallery_slide_image/left.png" />
      </button>
      <button id="next_bt" type="button" onclick="next_bt()">
         <img src="./gallery_slide_image/right.png" />
         </button>
   </div>

   <div id="popbox">
      <img id="bigimage"  onClick="fly()"/>      
   </div>
   <div id="wrap">
      <table cellpadding="0" cellspacing="0">
        <tr id="top">
             <td  align="center" colspan="2"><jsp:include page="header.jsp" flush="true"/></td>
        </tr>
        <tr id="main_Center">
        <%
      
        
        if(request.getAttribute("body").equals("/main/main.jsp") || request.getAttribute("body").equals("/join/join_attention.jsp")
              || request.getAttribute("body").equals("/join/join_form.jsp")
              || request.getAttribute("body").equals("/join/join_success.jsp")
              || request.getAttribute("body").equals("/join/login_form.jsp")
              || request.getAttribute("body").equals("/join/search_id.jsp")
              || request.getAttribute("body").equals("/join/success_id.jsp")
              || request.getAttribute("body").equals("/join/search_pass.jsp")
              || request.getAttribute("body").equals("/join/success_pass.jsp")
              ){ %>
           <td  align="center" colspan="2"><jsp:include page="${body}" flush="true"/></td>
        <%}else{ %>
           <td valign="top" width="300px"><jsp:include page="sidebar.jsp" /></td>
           <td width="1000px"><jsp:include page="${body}" /></td>
        <%} %>
        </tr>
        
         <tr>
             <td class="footer" align="center" colspan="2" ><jsp:include page="footer.jsp" /></td>
         </tr>
   </table>
   </div>
</body>
</html>