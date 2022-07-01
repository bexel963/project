<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script src="https://kit.fontawesome.com/022cf171a0.js" crossorigin="anonymous"></script>
   	<link rel="stylesheet" href="resources/css/loginForm.css"/>
   	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
     <style>
	* { box-sizing:border-box; }
       a { 
       		text-decoration: none; 
       		color: black;
       	}
       	a:hover{
       		color: red;
       	}
        form {
            width:400px;
            height:500px;
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
        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid #212121;
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        button {
            background-color: #263343;
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin: 30px 0 10px 0;
            cursor: pointer;
        }
        #signUpbtn{
        	margin: 0;
        }
        #title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }
        #msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        .find{
        	margin-top: 10px;
        }
        .find label{
        	float: left;
        	padding-right: 45px;
        	cursor: pointer;
        }
        .find label input{
        	cursor: pointer;
        }
        .find label:hover{
        	color: red;
        }
        .find a{
        	display: block;
        	float: right;
        	padding-left: 45px;
        }
        .find::after{
        	clear: both;
			content: '';
			display: block;
        }
        .signUpbtn{
        	background-color: #263343;   
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            padding: 12px 0 0 114px;
            cursor: pointer;
        }
        button:hover{
        	color: red;
        }
        .signUpbtn:hover{
        	color: red;
        }
        .signUpbtn a{
        	color : white;
        	margin: 0 auto;	
        }
     </style>
</head>
<body>
    <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
    	<i class="fa-light fa-house"></i>
        <h3 id="title">Login</h3>
        <div id="msg">
		    <c:if test="${not empty param.msg}">
				<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>            
		    </c:if>        
		</div>
        <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>
        <input type="password" name="pwd" placeholder="비밀번호">
        <input type="hidden" name="toURL" value="${param.toURL}">
        <div class="find">
        	<label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label>
            <a href="">비밀번호 찾기</a>
        </div>
        <button>로그인</button>
        <button id="signUpbtn" type="button">회원가입</button>
        <script>
 
	        $('#signUpbtn').on("click", function(){
				location.href = "<c:url value='/register'/>";
			});

            function formCheck(frm) {
                 let msg ='';
     
                 if(frm.id.value.length==0) {
                     setMessage('id를 입력해주세요.', frm.id);
                     return false;
                 }
     
                 if(frm.pwd.value.length==0) {
                     setMessage('password를 입력해주세요.', frm.pwd);
                     return false;
                 }
                 return true;
            }
     
            function setMessage(msg, element){
                 document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
     
                 if(element) {
                     element.select();
                 }
            }
            let msg = "${msg}";
            if(msg=="LOGIN_ERR") alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            if(msg=="LOGIN_ERR_toBoard") alert("로그인 후 이용하세요.");
        </script>
    </form>
</body>
</html>