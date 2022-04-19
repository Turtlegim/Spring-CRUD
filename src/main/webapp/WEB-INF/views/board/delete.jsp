<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
caption {
    text-align: center;
    font-size: xx-large;
}
</style>
<body>
<form method="post">
<table class="table table-striped">
<caption>게시물 삭제</caption>
<tr>
	<th>글번호</th>
	<td>${no}<input type="hidden"/></td>
</tr>

<tr>
	<th>비밀번호</th>
	<td><input type="password" name="password" required="required" autofocus="autofocus"/>
		<p style="color: red;">* 처음 글 작성시 입력했던 비밀번호를 입력하세요 !</p>
	</td>
</tr>

</table>
</form>
</body>
</html>