<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/plain; charset=UTF-8" />
<title>우편 검색</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css" />
<script type="text/javascript" src="../../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
/* function parent(d){
    alert(d);
    var v = val.value;

    if(!opener) return;
   
  } */
  function myClick(){
      alert(눌렀다);
/*        var tb = document.getElementById("tb");

       alert(tb.rows[1].cells[4].innerText);
   */
  };
     $(function(){
         $("#list tr").live("click",function(){
        
             var  zipsp=$(this,"td").eq(0).text();
             //alert(zipsp);
             var zipsp2 = zipsp.split("-");
             var zipfirst=zipsp2[0];
             var zipsp3=zipsp2[1].split(":");
             //alert(zipsp3[0]);
             var ziplast=zipsp3[0];
             var addfinal = zipsp3[1];
             opener.document.zipform.zip1.value=zipfirst;
             opener.document.zipform.zip2.value=ziplast;
             opener.document.zipform.address.value=addfinal;
             self.closed();
            
        
         });
        $("#zipBtnDB").click(function(){
            //alert("눌렀따");
           
            var dong=$.trim($("#zipDBSC").val());
            if(dong==null||dong==""){
                alert("동이름을 입력해주세요.");
                return;
            }
           
            $.ajax({
                "url" : "zipSc3.jsp",
                "type" : "get",
                "dataType": "json",
                "data" : {"dong":dong},
                "success" : function(data){
                    var str = "<table border='1' bordercolor='blue'>";
                    str +="<tr >";
                    $.each(data,function(i,v){
                        str +="<td>"+v.zipcode +":</td>";
                        str +="<td>"+v.sido +" ";
                        str +=v.gugun +" ";
                        str +=v.dong +" ";
                        str +=v.ri +" ";
                        str +=v.bldg +" ";
                        str +=v.bunji +" ";
                        str +="</td></tr>";
                    });
                    str +="</table>";
                    $("#list").html(str);
                   
                },
                "error" : function(info, xhr){
                    if(info.readyState == '4'){
                     alert('문제가 발생했습니다.\n상태코드 : ' + info.status+ '\n\n' + info.responseText);
                    }
                    else{
                     alert('문제가 발생했습니다.\n잠시후 다시 시도해 주세요.\n 상태코드 : ' +info.status);
                    }
                   }
            });
             
           
/*              $.getJSON(
                "zipSc3.jsp",
                "lowAdd="+lowAdd,
                function(data){
                    alert(data);
                    var str = "<table border='1' bordercolor='blue'>";
                    $.each(data,function(i,v){
                        str +="<tr><td>"+(i+1)+"번</td> ";
                        str +="<td>"+v.zipcode +" </td>";
                        str +="<td>"+v.sido +" ";
                        str +=v.gugun +" ";
                        if(v.ri   !=null)str +=+v.ri +" ";
                        if(v.bldg !=null)str +=+v.bldg +" ";
                        if(v.bunji!=null)str +=+v.bunji +" ";
                        str +="</td></tr>";
                    });
                    str +="</table>";
                    $("#showZip").html(str);
                }
            );  */
           
        });
    });
</script>

</head>
<body>
<table>
<tr>
    <td>동검색</td><td><input type="text" id="zipDBSC" size="8" /> ex) '대흥동'
    <input type="button" id="zipBtnDB" value="검색"/></td>
</tr>

</table>


<div id="list" class="zipList">

</div>




</body>
</html>