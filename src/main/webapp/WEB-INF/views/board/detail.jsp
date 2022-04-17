<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script type="text/javascript">
function replyDelete(boardno, orderno){
	let param = {
			"re_no":  boardno,
			"seq_first": orderno
	}
	var jsonparam = JSON.stringify(param);
	console.log(param);
    $.ajax({
        type: 'POST',
        url : 'replyDelete',
        data : jsonparam,
        dataType : 'json',
        success : function() {
        	location.reload();
        }
    });
}


</script>
</head>
<body>
<table border="1" style="width: 500px;">
	<caption>게시물 상세보기</caption>
<tr>
	<th>번호</th>
	<td>${boardDTO.no}</td>
</tr>
<tr>
	<th>제목</th>
	<td>${boardDTO.title}</td>
</tr>
<tr>
	<th>작성자</th>
	<td>${boardDTO.name}</td>
</tr>
<tr>
	<th>내용</th>
	<td>${boardDTO.content}</td>
</tr>
<tr>
	<th>작성일</th>
	<td><fmt:formatDate value="${boardDTO.regdate}" type="both" /></td>
</tr>
<tr>
	<th>조회수</th>
	<td>${boardDTO.readcount}</td>
</tr>
</table><br/>

<ol style="width: 450px;">
	<c:forEach items ="${reply}" var ="reply" varStatus="vs">
	<fmt:formatDate value="${reply.regdate}" type="date" pattern="yyyy년 MM월 dd일 HH:mm:ss" var="replyDate"/>
	<li>
		<div>
			<p >${reply.name} / ${replyDate}</p>
			<div>
			<form method="post" action="replyDelete" style="cursor: pointer; float: right;">
				<input id="button" type="submit" value="X" />
				<input type="hidden" name="seq_first" value="${reply.seq_first}" />
			</form>
			<%-- <button id="reply_delete_btn" style="float: right;margin-right: 150px;margin-left: 50px;cursor:pointer;" onclick="replyDelete(<c:out value="${boardDTO.no}"/>,<c:out value="${vs.count}"/>);">X</button> --%>
			<p>${reply.re_context}</p>
		</div>
	</li>
	</c:forEach>
</ol>
<div> 
	<form method="post">
		<p>
			<label>작성자</label><input type ="text" name="name" required="required">
		</p>
		<p>
			<textarea rows ="5" cols="50" name="re_context" required="required"></textarea>
		</p>
		<p>
			<input type = "hidden" name="re_no" value="${boardDTO.no}">
			<button type = "submit">댓글 등록</button>
		</p>
	</form>
		
</div>


<a href="../">글 목록</a> |
<a href="update">수정하기</a> |
<a href="delete">삭제하기</a>
</body>
</html>