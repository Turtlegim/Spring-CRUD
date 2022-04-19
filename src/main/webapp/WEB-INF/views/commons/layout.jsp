<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
	<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<table class="table table-striped">
		<tbody>
			<tr>
				<td><tiles:insertAttribute name="header" /></td>
			</tr>
			<tr>
				<td><tiles:insertAttribute name="body" /></td>
			</tr>
			<tr>
				<td><tiles:insertAttribute name="footer" /></td>
			</tr>
		</tbody>
	</table>
</body>
</html>