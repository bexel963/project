<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ?  'Login' : 'Logout'}"/>
<c:set var="loginInfo" value="${sessionScope.id==null ?  'Logout' : 'Login'}"/>
<c:set var="gradeInfo" value="${sessionScope.grade}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		pageContext.setAttribute("nowTime", sf.format(nowTime));
	%>
	<style>
		body{
            margin: 0;
            font-family: 'Source Sans Pro';
            font-weight: bold;        
        }
        .navbar_menu a,
        .navbar_logo a,
        .logbar_menu a{
            text-decoration: none;
            color: white;
        }
        a:hover{
        	text-decoration: none;
            color: red;
        }
        ul,li{
            list-style: none;
            padding: 0;
        }
        .logcontainer{
            background-color: #212121;
        }
        .logbar{
            width: 1400px;
            height: 50px;
            margin: 0 auto;
        }
        .logbar .time{
            float: left;
            line-height: 50px;
            padding-left: 15px;
            color: white;
        }
        .logbar .logbar_menu{
            float: right;
            padding-top: 12px;
        }
        /* .logbar::after{                       
            content: '';
            display: block;
            clear: both;
        } */
        .logbar .logbar_menu>li{
            display: inline-block;
            padding: 0 20px;
        }
        .logbar .logbar_menu>li:hover,
        .navbar .navbar_menu li:hover{
            background-color: #d49466;
            border-radius: 4px;
            cursor: pointer;
        }
        .navcontainer{
            background-color: #424242;
        }
        .navbar{
            width: 1400px;
            height: 70px;
            margin: 0 auto;
        }
        .navbar .navbar_logo{
            float: left;
            line-height: 60px;
            color: white;
        }
        .navbar .navbar_logo i{
            margin-right: 10px;
        }
        .navbar .navbar_menu{
            float: right;
            line-height: 35px;
        }
        .navbar .navbar_menu li{
            display: inline-block;
            padding: 0 20px;
        }
        .xxx{
            background-color: #263343;
            height: 2px;
        }
	</style>
</head>
<body>
    <div class="logcontainer">
        <div class="logbar">
            <div class="time">${nowTime}</div>
            <ul class="logbar_menu">
                <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                <c:if test="${loginInfo=='Logout'}">
                	<li><a href="<c:url value='/register'/>">SignUp</a></li>
                </c:if>
                <li><a href="">MyInformation</a></li>
            </ul>
        </div>
    </div>
    <div class="xxx"></div>
    <div class="navcontainer">
        <nav class="navbar">
            <div class="navbar_logo">
                <i class="fab fa-accusoft"></i>
                <a href="#">Shop</a>
            </div>
            <ul class="navbar_menu">
                <li><a href="<c:url value='/'/>">HOME</a></li>
                <li><a href="">CATEGORY</a></li>
                <li><a href="">HOT10</a></li>
                <li><a href="">MY BOX</a></li>
                <li><a href="<c:url value='/boardList'/>" id="board-btn">BOARD</a></li>
                <c:if test="${gradeInfo == 0}">
                	<li><a href="">ADM</a></li>
                </c:if>
            </ul>
        </nav>
    </div> 
</body>
</html>