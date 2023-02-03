<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD question</title>
</head>
<body>
	<h1>ADD question</h1>
	<form action="${pageContext.request.contextPath}/teacher/question/addQuestion" method="post">
		<table>
			<tr>
				<th>문제 번호</th>
				<td>
					<input type="number" name="questionIdx">
				</td>
			</tr>
			<tr>
				<th>문제</th>
				<td>
					<input type="text" name="questionTitle">
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>