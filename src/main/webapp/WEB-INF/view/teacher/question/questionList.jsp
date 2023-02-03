<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionList</title>
</head>
<body>
	<!-- 어떤 시험인지 명시 -->
	<h2>(시험회차 제목) 문제 목록</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/question/addQuestion">문제 추가</a>
	</div>
	<table>
		<tr>
			<th>문제</th>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>Q${q.questionIdx}. ${q.questionTitle}</td>
			</tr>		
		</c:forEach>
	</table>
</body>
</html>