<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Register</title>
    <style>
    	* { box-sizing:border-box; }
        form {
            width:630px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 2px solid #212121;
            border-radius: 10px;
        }
        .input-field {
            width: 430px;
            height: 35px;
            border : 1px solid #212121;
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        
        label {
            width: 400px;
            height: 20px;
            margin: 6px 0;
            font-weight: bold;
        }
        button {
            background-color: #263343;
            color : white;
            width:430px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
            cursor: pointer;
        }
        button:hover{
        	color: red;
        }
        .title {
            font-size : 30px;
            margin: 40px 0 30px 0;
        }
        .msg {
            height: 20px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        
        .sns-chk {
            margin-top : 5px; 
        }
        .sns-chk label,
        .sns-chk input{
        	cursor: pointer;
        }
        .id-box{
        	display: flex;
        	width: 430px;
        }
        .id-box .input-field{
        	flex-basis: 80%;
        }
        .id-box #dup-check{
        	flex-basis: 20%;
        	height: 35px;
        	margin: 0;
        	cursor: pointer;
        }
    </style>
</head>
<body>
   <form action="<c:url value="/register/save"/>" method="POST">
	    <div class="title">????????? ???????????????</div>
	    <div id="msg" class="msg"></div>  
	    <label for="">?????????</label>
	    <div class="id-box">
		    <input class="input-field" id="id-field" type="text" name="id" placeholder="8~12????????? ?????????????????? ?????? ??????(??? ????????? ?????????)">
		    <button id="dup-check" type="button">????????????</button>
	    </div>
	    <label for="">????????????</label>
	    <input class="input-field"type="text" name="pwd" placeholder="">
	    <label for="">???????????? ??????</label>
	    <input class="input-field" type="text" name="pwd2" placeholder="">
	    <label for="">??????</label>
	    <input class="input-field" type="text" name="name">
	    <label for="">??????</label>
	    <input class="input-field" type="text" name="address" placeholder="????????????" style="margin-bottom: 2px;">
	    <input class="input-field" type="text" name="address" placeholder="???????????????">
	    <label for="">?????????</label>
	    <input class="input-field" type="text" name="phone" placeholder="010-xxxx-xxxx">
	    <label for="">?????????</label>
	    <input class="input-field" type="text" name="email" placeholder="example@fastcampus.co.kr"> 
	    <label for="">??????</label>
	    <input class="input-field" type="text" name="birth" placeholder="2020-12-31">
	    
	    <button id="regis_btn">?????? ??????</button>
   </form> 
   <script>
   	   $('#regis_btn').click(function(){
   		   
   		   var name = $('input[name=name]').val();
   		   var address = $('input[name=address]').val();
   		   var phone = $('input[name=phone]').val();
   		   var email = $('input[name=email]').val();
   		   var birth = $('input[name=birth]').val();
   		   
	   	   var pwdReg = /[a-zA-Z0-9]{7,11}/;
	       
	       if(!dup){
	    	   alert('????????? ?????? ????????? ????????????.');
	    	   return false;
	       }
	       
	       var pw1 = $('input[name=pwd]').val();
		   var pw2 = $('input[name=pwd2]').val();
		   
		   var pwdConfirm = pwdReg.test(pw1);
		   
		   if(!pwdConfirm){
			   setMessage('??????????????? ?????????????????? ?????? ?????? 8~12?????? ????????? ?????????.');
	    	   return false;
		   }
		   if(pw2 == ''){
			   setMessage('??????????????? ????????? ?????????.');
	    	   return false;
		   }
		   if( pw1 != pw2 ){
			   alert("??????????????? ???????????? ????????????.");
			   $('input[name=pwd]').val('');
			   $('input[name=pwd2]').val('');
			   $('.msg').text('');
			   return false;
		   }
		   if(name=='' || address=='' || phone=='' || email=='' || birth==''){
			   alert('????????? ?????? ??????????????????.');
			   return false;
		   }
		   
   	   })
	   
   	   var dup = false;	
	   $('#dup-check').click(function(){
	   		
		   	var id = $('#id-field').val();
	   	   	var idReg = /^[a-zA-Z][a-zA-Z0-9]{7,11}$/;
	   		var idConfirm = idReg.test(id);
	   		
   			var obj = $(this);
   			var id = $('input[name=id]').val();
       		if(id == ''){
       			alert('???????????? ???????????????');
       			return;
       		}
       		if(!idConfirm){
       			alert('???????????? 8~12????????? ?????????????????? ?????? ??????(??? ????????? ?????????) ????????? ?????????.');
       			return;
       		}
       		var data = { 'id' : id };	
       		$.ajax({
				url : '<%=request.getContextPath()%>/dupCheck',
				type : 'post',
				data : data,
				success : function(data){	
					if(data == 'user'){
						alert('?????? ????????? ????????? ?????????.');
						$('#id-field').val('');
					}else{
						alert('?????? ????????? ????????? ?????????.');
						dup = true;
					}
				},
				error : function(){
					console.log('??????');
				}
			})	
	   	})
	   	$('input[name=id]').change(function(){ // id?????? ????????? ???????????? ?????? ????????????.
	   		dup = false;
	   	})
       function setMessage(msg){
		   $('#msg').html(`<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`);
           //document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
       }
   </script>
</body>
</html>