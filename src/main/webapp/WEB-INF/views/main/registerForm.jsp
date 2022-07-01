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
	    <div class="title">정보를 입력하세요</div>
	    <div id="msg" class="msg"></div>  
	    <label for="">아이디</label>
	    <div class="id-box">
		    <input class="input-field" id="id-field" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합(첫 글자는 영문자)">
		    <button id="dup-check" type="button">중복확인</button>
	    </div>
	    <label for="">비밀번호</label>
	    <input class="input-field"type="text" name="pwd" placeholder="">
	    <label for="">비밀번호 확인</label>
	    <input class="input-field" type="text" name="pwd2" placeholder="">
	    <label for="">이름</label>
	    <input class="input-field" type="text" name="name">
	    <label for="">주소</label>
	    <input class="input-field" type="text" name="address" placeholder="기본주소" style="margin-bottom: 2px;">
	    <input class="input-field" type="text" name="address" placeholder="나머지주소">
	    <label for="">핸드폰</label>
	    <input class="input-field" type="text" name="phone" placeholder="010-xxxx-xxxx">
	    <label for="">이메일</label>
	    <input class="input-field" type="text" name="email" placeholder="example@fastcampus.co.kr"> 
	    <label for="">생일</label>
	    <input class="input-field" type="text" name="birth" placeholder="2020-12-31">
	    
	    <button id="regis_btn">회원 가입</button>
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
	    	   alert('아이디 중복 검사를 해주세요.');
	    	   return false;
	       }
	       
	       var pw1 = $('input[name=pwd]').val();
		   var pw2 = $('input[name=pwd2]').val();
		   
		   var pwdConfirm = pwdReg.test(pw1);
		   
		   if(!pwdConfirm){
			   setMessage('비밀번호는 영대소문자와 숫자 조합 8~12자리 이어야 합니다.');
	    	   return false;
		   }
		   if(pw2 == ''){
			   setMessage('비밀번호를 확인해 주세요.');
	    	   return false;
		   }
		   if( pw1 != pw2 ){
			   alert("비밀번호가 일치하지 않습니다.");
			   $('input[name=pwd]').val('');
			   $('input[name=pwd2]').val('');
			   $('.msg').text('');
			   return false;
		   }
		   if(name=='' || address=='' || phone=='' || email=='' || birth==''){
			   alert('정보를 모두 입력해주세요.');
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
       			alert('아이디를 입력하세요');
       			return;
       		}
       		if(!idConfirm){
       			alert('아이디는 8~12자리의 영대소문자와 숫자 조합(첫 글자는 영문자) 이어야 합니다.');
       			return;
       		}
       		var data = { 'id' : id };	
       		$.ajax({
				url : '<%=request.getContextPath()%>/dupCheck',
				type : 'post',
				data : data,
				success : function(data){	
					if(data == 'user'){
						alert('이미 가입된 아이디 입니다.');
						$('#id-field').val('');
					}else{
						alert('가입 가능한 아이디 입니다.');
						dup = true;
					}
				},
				error : function(){
					console.log('실패');
				}
			})	
	   	})
	   	$('input[name=id]').change(function(){ // id값이 바뀌면 중복검사 다시 해야한다.
	   		dup = false;
	   	})
       function setMessage(msg){
		   $('#msg').html(`<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`);
           //document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
       }
   </script>
</body>
</html>