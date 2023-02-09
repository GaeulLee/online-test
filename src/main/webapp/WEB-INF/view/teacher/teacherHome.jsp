<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherHome</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<div>
		<h2>최근 등록된 시험</h2>
		<table>
			<tr>
				<th>시험일자</th>
				<th>시험</th>
			</tr>
			<c:forEach var="t" items="${tList}">
				<tr>
					<td>${t.testDate}</td>
					<td>${t.testTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<h2>최근 등록된 문제</h2>
		<table>
			<tr>
				<th>문제</th>
			</tr>
			<c:forEach var="q" items="${qList}">
				<tr>
					<td>${q.questionIdx}번 ${q.questionTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>