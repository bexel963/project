<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/boardList.css"/>   
<title>게시판 목록</title>

</head>
<body>
	<div class="category-title">
		<div class="text">게시판</div>
	</div>
	<div class="container">
		<div class="search-box"><br>
			<form class="input-group mb-3" action="<c:url value='/boardList'/>" method="get">
				<div class="input-group-append">
					<select class="form-control" name="option">       
						<option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : "" }>제목+내용</option>
						<option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목</option>
						<option value="W" ${ph.sc.option=='W' ? "selected" : "" }>작성자</option>
					</select>
				</div>
				<input type="text" class="form-control" name="keyword" placeholder="Search" value = ${ph.sc.keyword}>
				<div class="input-group-append">
                	<button class="btn btn-success" type="submit">찾기</button>  
            	</div>
        	</form>
    	</div>
    	<table class="table">
	        <thead>
		        <tr>
		            <th width="50">NO</th>
		            <th width="500">제목</th>
		            <th width="100">글쓴이</th>
		            <th width="90">날짜</th>
		            <th width="50">조회</th>
		            <th width="50">추천</th>    
		        </tr>
	        </thead>
	        <tbody>
	        <c:forEach var="board" items="${list}">
	            <tr>
	                <td class="link"><a href="<c:url value="/boardDetail${ph.sc.queryString}&bno=${board.bno}"/>">${board.bno}</a></td>
	                <td class="link"><a href="<c:url value="/boardDetail${ph.sc.queryString}&bno=${board.bno}"/>"><c:out value='${board.title}'/></a></td>
	                <td>${board.writer}</td>
	                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.reg_date}"/></td>
	                <td>${board.view_cnt}</td>
	                <td>5</td>
	            </tr>
            </c:forEach>
	        </tbody>
    	</table><br>
	    <ul class="pagination justify-content-center">
			<c:if test="${ph.showPrev}">
            	<a href="<c:url value="/boardList${ph.sc.getQueryString(ph.beginPage-1)}"/>"><li class="page-item">이전</li></a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            	<a class="${i==ph.sc.page ? 'paging-active' : ''}" href="<c:url value="/boardList${ph.sc.getQueryString(i)}"/>"><li class="page-item">${i}</li></a>
            </c:forEach>
            <c:if test="${ph.showNext}">
           		<a href="<c:url value="/boardList${ph.sc.getQueryString(ph.endPage+1)}"/>"><li class="page-item">다음</li></a>
           	</c:if>
	    </ul>
	    <a href="<c:url value='/boardWrite'/>"><button type="button" class="write-btn btn btn-success">글쓰기</button></a>
	    <input type="hidden" name="user" value="${sessionScope.id}">
	</div>
	
	<script>
		$('.write-btn').click(function(){
			var user = $('input[name=user]').val();
			if(user == ''){
				alert('로그인 후 이용하세요.');
				return true;
			}
		})
		let msg = "${msg}";	// get방식이라 모델에 있는게 파라미터로 전달이 된다.
		if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
		if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
		if(msg=="WRT_OK") alert("게시글이 등록되었습니다.");
		if(msg=="AMEND_OK") alert("게시글이 수정되었습니다.");
	</script>
</body>
</html>