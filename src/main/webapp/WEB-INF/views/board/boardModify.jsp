<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <link rel="stylesheet" href="resources/css/boardRegis.css"/> 

</head>
<body>
    <div class="container">
        <div class="category-title">
            <div class="text">게시글 수정</div>
        </div>
        <div class="body after">
            <form action="<c:url value='goBoardAmend'/>" method="post">	
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value="${dto.title}">
                    <input type="hidden" name="bno" value="${dto.bno}">
                </div>
                <div class="form-group">
                    <label for="writer">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer" readonly value="${sessionScope.id}">
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea style="display:none;" class="form-control"  id="content" name="content"></textarea>
                </div>
                <div id="summernote" class="content-box">${dto.content}</div>
                <button type="submit" class="btn">등록</button>
            </form>
            <a href="<c:url value='boardList'/>">
            	<button type="button" class="btn">목록</button><br><br>
            </a>
        </div>
    </div>
	<script>
        $('#summernote').summernote({
            placeholder: '내용 입력',
            tabsize: 2,
            height: 300
        });
        $('form').submit(function(){
            var content = $('#summernote').summernote('code');
            $('textarea[name=content]').val(content);
        })
        

    </script>
</body>
</html>