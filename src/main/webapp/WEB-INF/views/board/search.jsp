<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<title>Insert title here</title>
</head>

<body>
<script type = "text/javascript">

</script>
	<div class=search_sort>
		<form id="searchForm" name="searchForm" method="get" action="${app}/main/board/${new_no}/${pg}/search">
			<span class="select01" onChange={this.onChange.bind(this)}>
				<select name="searchType" id="searchType" class="sel_type">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="name">이름</option>
				</select>
			</span>
			<input type="text" name='searchword' placeholder="검색어를 입력해주세요." id="searchWord" value="${searchword}" >
			<button type="submit" id='btn_search' class=" btn_search">검색</button>
		</form>

	</div>

	<table border="1">
		<caption>게시물 리스트</caption>
		<tr>
			<td colspan="5">현재 페이지 : ${pg} / 전체 페이지 수 : ${pageCount}</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="dto" varStatus="vs">
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" type="date" pattern="yyyyMMdd" var="nowDate"/>
		<fmt:formatDate value="${dto.regdate}" type="date" pattern="yyyyMMdd" var="postDate"/>
		<tr>
			<td>${recordCount - vs.index - ((pg-1) * pageSize)}</td>
			<td><a href="${dto.no}/">${dto.title}</a></td>
			<td>${dto.name}</td>
			<td>
				<c:if test="${nowDate - postDate == 0}">
					<fmt:formatDate value="${dto.regdate}" pattern="HH:mm:ss" type="time" />
				</c:if>
				<c:if test="${nowDate - postDate != 0}">
					<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" type="date" />
				</c:if>
			</td>
			<td>${dto.readcount}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<c:if test="${startPage != 1}">
				[<a href="../${startPage - 1}/search?searchType=${searchType}&searchword=${searchword}">이전블럭</a>]
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="p">
				<c:if test="${p == pg}">${p}</c:if>
				<c:if test="${p != pg}">
					<a href="../${p}/search?searchType=${searchType}&searchword=${searchword}">${p}</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage != pageCount}">
				[<a href="../${endPage + 1}/search?searchType=${searchType}&searchword=${searchword}">다음블럭</a>]
			</c:if>
			</td>
		</tr>
	</table>
	<br />
	<a href="insert">글쓰기</a>
	<a href="${app}/main">목록으로</a>
</body>
</html>