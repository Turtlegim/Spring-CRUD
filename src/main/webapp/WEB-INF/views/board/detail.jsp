<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script type="text/javascript">
	function replyDelete(boardno, orderno) {
		let param = {
			"re_no" : boardno,
			"seq_first" : orderno
		}
		var jsonparam = JSON.stringify(param);
		console.log(param);
		$.ajax({
			type : 'POST',
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
<style>
 
 .input-group.mb-3 {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px;
}
.input-group-prepend {
    width: 66px
}

textarea {
    width: 940px !important;
    height: 140px !important;
}

.basic_btn {
    display: block;
    text-align: right;
}
th {
    max-width: 1px;
}

.title {
    margin: 7px 0 10px 10px;
    font-size: 30px;
    font-weight: bold;
}
 
</style>
<body>
	<br/>
	<div class="container">
		<div class ="title"> 
				๐&nbsp;&nbsp;${boardDTO.title}
		</div>
	<table class="table table-striped">
		<tr hidden="true">
			<th>๋ฒํธ</th>
			<td>${boardDTO.no}</td>
		</tr>
		<tr>
			<th>์์ฑ์</th>
			<td>${boardDTO.name}</td>
		</tr>
		<tr>
			<th>๋ด์ฉ</th>
			<td>${boardDTO.content}</td>
		</tr>
		<tr>
			<th>์์ฑ์ผ</th>
			<td><fmt:formatDate value="${boardDTO.regdate}" type="both" /></td>
		</tr>
		<tr>
			<th>์กฐํ์</th>
			<td>${boardDTO.readcount}</td>
		</tr>
	</table>
	<br />

	<ol style="width: 450px;">
		<c:forEach items="${reply}" var="reply" varStatus="vs">
			<fmt:formatDate value="${reply.regdate}" type="date"
				pattern="yyyy๋ MM์ dd์ผ HH:mm:ss" var="replyDate" />
			<li>
				<div>
					<p>${reply.name} / ${replyDate}</p>
					<div>
						<form method="post" action="replyDelete"
							style="cursor: pointer; float: right;">
							<input id="button" type="submit" value="X" class="btn btn-outline-secondary"/> <input
								type="hidden" name="seq_first" value="${reply.seq_first}" />
						</form>
					</div>
					<%-- <button id="reply_delete_btn" style="float: right;margin-right: 150px;margin-left: 50px;cursor:pointer;" onclick="replyDelete(<c:out value="${boardDTO.no}"/>,<c:out value="${vs.count}"/>);">X</button> --%>
					<p>${reply.re_context}</p>
				</div>
			</li>
		</c:forEach>
	</ol>
			<br/>
	<div>
		<form method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">์์ฑ์</span>
				</div>
				<input type="text" class="form-control" name="name" required="required" placeholder="๋๊ธ ์?๋ชฉ" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<p>
				<textarea rows="5" cols="50" name="re_context" required="required"></textarea>
			</p>
				<div class = "basic_btn">
				<input type="hidden" name="re_no" value="${boardDTO.no}">
				<button type="submit">๋๊ธ ๋ฑ๋ก</button>
				</div>
		</form>
	</div>


	<a href="../">๊ธ ๋ชฉ๋ก</a> |
	<a href="update">์์?ํ๊ธฐ</a> |
	<a href="delete">์ญ์?ํ๊ธฐ</a>
	</div>
</body>
</html>