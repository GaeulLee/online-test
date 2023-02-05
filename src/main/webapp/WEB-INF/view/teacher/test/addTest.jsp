<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD TEST</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>ADD TEST</h1>
	<form action="${pageContext.request.contextPath}/teacher/test/addTest" method="post">
		<table>
			<tr>
				<th>시험 제목</th>
				<td>
					<input type="text" name="testTitle">
				</td>
			</tr>
			<tr>
				<th>시험 날짜</th>
				<td>
					<input type="date" name="testDate">
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