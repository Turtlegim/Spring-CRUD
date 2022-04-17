<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<table border="1">
<caption>게시판 리스트</caption>
<tr>
</tr>
<tr>
	<th>게시판 제목</th>
</tr>
<c:forEach items="${list}" var="dto" varStatus="vs">
<tr>
	<td colspan="5">${dto.rownum}</td>
	<td><a href="${app}/main/board/${dto.no}/1/">${dto.name}</a></td>
</tr>
</c:forEach>
</table><br/>
<a href="newinsert">새 게시판 생성</a>
</body>
</html>