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
    font-size: 30px;
}
</style>
<body>
<form method="post">
<table class="table table-striped">
<caption>게시판 생성</caption>
<tr>
	<th>게시판 이름</th>
	<td><input type="text" name="name" required="required"/></td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="submit" value="등록하기" /></td>
</tr>
</table>
</form>
</body>
</html>