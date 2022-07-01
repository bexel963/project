<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/022cf171a0.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="resources/css/boardDetail.css"/> 
	<style>
	   *{
            padding: 0;
            margin: 0;
        }
        ul, li{
            list-style: none;
        }
        button{
            background-color: white;
        }
        .container{
            width: 900px;
            margin: 100px auto;
            font-size: 12px;
            font-family: '돋움',Dotum,Helvetica,'Apple SD Gothic Neo',sans-serif;
        }
        .board_title{
            border-top: 2px solid #ccc;
            color: #333333;
            font-weight: bold;
            padding: 20px 5px;
        }
        .board_title .title{
            float: left;
        }
        .board_title .date{
            float: right;
        }
        .board_title::after{
            content: '';
            display: block;
            clear: both;
        }
        .board_info{
            border-top: 2px solid #ccc;
            padding: 10px 10px;
            background-color: #eee;
        }
        .board_info ul{
            display: flex;
            justify-content: flex-end;
        }
        .board_info ul li:nth-of-type(1){
            margin-right: auto;
            margin-left: 0;
            font-weight: bold;
        }
        .board_info ul li{
            margin-left: 30px;
        }
        .board_info ul span{
            margin-left: 5px;
            font-weight: bold;
        }
        .content{
            padding: 30px 20px 5px 20px;
            line-height: 30px;
        }
        .btn_box{
            display: flex;
            justify-content: center;
            margin-top: 60px;
        }
        .btn_box i{
            margin-right: 10px;
        }
        .btn_box button{
            margin: 0 10px;
        }
        .comment_title{
            margin-top: 40px;
            font-size: 14px;
        }
        .comment_title i{
        	margin-right: 10px;
        	color: #EE7B00;
        }
        .comment_content{
            background-color: #FFF9F2;
            margin: 15px 0;
            border-bottom: 1px solid #ccc;
        }
        .comment_content .writer{
            padding: 10px 0;
        }
        .comment_content span:nth-of-type(1){
            margin-right: 10px;
        }
        .comment_content .writer :nth-of-type(1){
            font-weight: bold;
        }
        .comment_content .content{
        	border-bottom: 1px solid white;
            margin-bottom: 20px;
        }
        .comment_write{
            display: flex;
            margin-top: 10px;
        }
        .comment_write textarea{
            flex-basis: 90%;
        }
        .comment_write button{
            flex-basis: 10%;
        }
        button{
            padding: 10px;
            margin: 0 10px;
            cursor: pointer;
            font-size: 15px;
        }
        .liked{
            color: #EE7B00;
            border: 2px solid #EE7B00;
            border-radius: 0.2em;
        }
        .nomal{
            color: #aaaaaa;
            border: 2px solid #aaaaaa;
            border-radius: 0.2em;
        }
        .check{
            color: #EE7B00;
            font-size: 15px;
            margin-right: 10px;
        }
        .btn_group{
            margin-top: 40px;
            display: flex;
            justify-content: center;
        }
        .btn_group button{
            border: 2px solid #ccc;
            border-radius: 0.2em;
            padding: 10px 20px;
            font-weight: bold;
        }
        .btn_group button:hover{
            border: 2px solid #EE7B00;
            color: #EE7B00;
        }
        textarea{
            padding: 10px;
        }
		#cBtnBox{
            width: 860px;
            height: 30px;
        }
        #cBtnBox button{
            float: right;
            padding: 0px 5px;
            cursor: pointer;
            font-size: 12px;
            color: #aaaaaa;
            border: 1px solid #aaaaaa;
            border-radius: 0.2em;
        }
        #cBtnBox button:hover{
            border: 2px solid #EE7B00;
            color: #EE7B00;
        }
        #amendBtn{
        	margin-left: 5px;
        }
        #line{
        	margin-top: 50px;
        }
	</style>
</head>
<body>
	    <div class="container">
	        <div class="board_title">
	        	<input type="hidden" name="bno" value="${dto.bno}">
	            <div class="title"><span><c:out value='${dto.title}'/></span></div>
	            <div class="date"><span><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.reg_date}"/></span></div>
	        </div>
	        <div class="board_info">
	            <ul>
	                <li>작성자 : ${dto.writer}</li>
	                <li>url : ${url}</li>
	                <li>조회</li><span>${dto.view_cnt}</span>
	                <li>추천</li><span>${dto.like_cnt}</span>
	                <li>댓글</li><span>${dto.comment_cnt}</span>
	                <li>게시물번호</li><span>${dto.bno}</span>
	            </ul>
	        </div>
	        <div class="content" style="font-size: 14px;">
	            <span>
	                ${dto.content}
	            </span>
	        </div>
	        <div class="btn_box">
	        	<input id="likeInfo" type="hidden" value="${likeInfo}">
	            <button class="like_btn nomal"><i class="fas fa-thumbs-up"></i>추천</button>
	        </div>
	      	<div id="comment_content"></div>
	        <div style="font-weight: bold;" id="line"><i class="fas fa-check check"></i><span>댓글 쓰기</span></div>
	        <div class="comment_write">
	            <textarea name="" id="comment_regis" cols="30" rows="10"></textarea>
	            <button id="comment_regisBtn">등록</button>
	        </div>
	        <div class="btn_group">
	            <button id="writeBtn">글쓰기</button>
	            <c:set var="loginUser" value="${sessionScope.id}"/>
	            <input type="hidden" id="loginUser" value="${sessionScope.id}">
	            <c:if test="${sessionScope.id == dto.writer}">
		            <button id="amendBtn">수정</button>
		            <button id="removeBtn">삭제</button>
	            </c:if>
	            <button id="listBtn">목록</button>
	        </div>
	    </div>
    <script>
    	$(document).ready(function(){
    		var likeInfo = $('#likeInfo').val();
    		var id = $('#loginUser').val();
    		if(likeInfo == 1){
    			$('.like_btn').removeClass('nomal').addClass('liked');
    		}else{
    			$('.like_btn').removeClass('liked').addClass('nomal');
    		}
    		 $(".like_btn").on("click", function(){
    			 $.ajax({
                     type:'POST',      
                     headers : { "content-type": "application/json"},
                     url: '<%=request.getContextPath()%>/like',  
                     data : JSON.stringify({bno:bno, userId:id, liked:likeInfo}),
                     success : function(result){
                    	 if(result == 1){
                    		alert('추천했습니다.');
                 			$('.like_btn').removeClass('nomal').addClass('liked');
                 			$('#likeInfo').val(1);
                 			likeInfo = 1;
                 		}else{
                 			alert('추천을 취소했습니다.');
                 			$('.like_btn').removeClass('liked').addClass('nomal');
                 			$('#likeInfo').val(0);
                 			likeInfo = 0;
                 		}
                     },
                     error   : function(){ alert("error") } 
                 }); 
    			 
    			
    		 })
    		 
    		 let toHtml = function(comments){
    			 
		   			let loginUser = $("#loginUser").val();

    	        	let tmp = '';
    	        	
    	        	tmp += '<div class="comment_title">'
    	        	tmp += 		'<i class="fas fa-comment"></i><span>댓글</span>'
    	        	tmp += 		'<span style="font-weight: bold;">' + comments[comments.length-1] + '</span>'
    	        	tmp += '</div>'
    	        	
    	  			for(let i=0 ; i<comments.length-1 ; i++){
    	  				tmp += '<div class="comment_content">'
       	        		tmp += 		'<div class="writer">'
       	        		tmp += 			'<span>' + comments[i].commenter + '</span>'	
       	        		if(comments[i].reg_date != comments[i].up_date){
       	        			tmp +=		'<span>' + moment(comments[i].up_date).format('YYYY MM DD HH:mm:ss') + '</span>'
       	        		}else{
	       	        		tmp +=		'<span>' + moment(comments[i].reg_date).format('YYYY MM DD HH:mm:ss') + '</span>'   	        			
       	        		}
       	        		tmp += 		'</div>'
       	        		tmp +=		'<div class="content">'
       	        		tmp +=			'<span>' + comments[i].comment + '</span>'
       	        		tmp +=		'</div>'
       	        		if(loginUser == comments[i].commenter){
		       	        	tmp +=		'<div id="cBtnBox">'
		       	        	tmp +=			'<button id="cAmendBtn">수정</button>'
		       	        	tmp +=			'<button id="cDelBtn">삭제</button>'
		       	        	tmp +=		'</div>'       	        			
       	        			tmp += '<input type="hidden" id="cnoBox" value=' + comments[i].cno + '>'
       	        		}
       	        		tmp += '</div>'
    	  			}
    	        	
    	        	
    	        	return tmp;
    	      }
    		 
         	let bno = ${dto.bno};
        	let showList = function(bno){
        		$.ajax({
                    type:'GET',      
                    url: '/app/comments?bno='+bno,  
//                  dataType : 'text', 						// 전송받을 데이터의 타입, 생략하면 기본값은 json이다.
//                  data : JSON.stringify(person),  		// 서버로 전송할 데이터. stringify()로 직렬화 필요. - dataType이 json이면 이거 필요 없다.
                    success : function(result){
                    	$('#comment_content').html(toHtml(result));		// result는 서버가 전송한 데이터
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                }); 
        	}
    		 
        	showList(bno);
        	
    		 $('#comment_regisBtn').click(function(){
             	
             	let comment = $("#comment_regis").val();
             	if(comment.trim() == ''){
             		alert('댓글을 입력해 주세요');
             		$("#comment_regis").focus()
             		return;
             	}
             	$.ajax({
                     type:'POST',       // 요청 메서드
                     url: '/app/comments?bno='+bno,  // 요청 URI
                     headers : { "content-type": "application/json"}, // 요청 헤더
                     data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                     success : function(result){
 						alert(result);
 						showList(bno);
                     },
                     error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                 }); 
             });
    		 
 			$("#comment_content").on("click", "#cDelBtn", function(){	
              	//alert("클릭");
 				let cno = $(this).parent().next("#cnoBox").val();
 				$.ajax({
 	                type:'DELETE',      
 	                url: '/app/comments/'+cno+'?bno='+bno,  
 	                success : function(result){
 	                	alert(result);
 	                	showList(bno);
 	                },
 	                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
 	            }); 			
             })
             
             $("#comment_content").on("click", "#cAmendBtn", function(){
            	
            	let cno = $(this).parent().next("#cnoBox").val();
            	let comment = $(this).parent().prev().text();
            	
            	$(this).html('등록');
            	$(this).attr("id", "reWriteBtn")
            	$(this).parent().prev().html('<textarea name="" id="comment_regis" style="width: 800px; height: 150px;">' + comment + '</textarea>');
            	$(this).parent().prev().find("#comment_regis").focus();
            	
            	$("#reWriteBtn").on("click", function(){
            		
            		let comment = $("#comment_regis").val();
                	
                	if(comment.trim() == ''){
                		alert('댓글을 입력해 주세요');
                		$("#comment_regis").focus()
                		return;
                	}
                	$.ajax({
                        type:'PATCH',       // 요청 메서드
                        url: '/app/comments/'+cno,  // 요청 URI
                        headers : { "content-type": "application/json"}, // 요청 헤더
                        data : JSON.stringify({cno:cno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success : function(result){
    						alert(result);
    						showList(bno);
                        },
                        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                    }); 
            	})

            })
            
    		$('#listBtn').on("click", function(){
    			
    			location.href = "<c:url value='/boardList'/>?page=${page}&pageSize=${pageSize}";
    		});
			$('#writeBtn').on("click", function(){
    			
    			location.href = "<c:url value='/boardWrite'/>";
    		});
			$('#amendBtn').on("click", function(){
    			
    			location.href = "<c:url value='/boardAmend'/>?bno=${dto.bno}";
    		});
			$('#removeBtn').on("click", function(){
    			if(!confirm("정말로 삭제하시겠습니까?")) return;
    			let form = $('form');
    			form.attr("action", "<c:url value='/boardRemove'/>?page=${page}&pageSize=${pageSize}");
    			form.attr("method", "post");
    			form.submit();
    		});
    	})
    </script>
</body>
</html>