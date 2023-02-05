<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY TEST</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>MODIFY TEST</h1>
	<form action="${pageContext.request.contextPath}/teacher/test/modifyTest" method="post">
		<input type="hidden" name="testNo" value="${oldTest.testNo}">
		<table>
			<tr>
				<th>시험 제목</th>
				<td>
					<input type="text" name="testTitle" value="${oldTest.testTitle}">
				</td>
			</tr>
			<tr>
				<th>시험 날짜</th>
				<td>
					<input type="date" name="testDate" value="${oldTest.testDate}">
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>