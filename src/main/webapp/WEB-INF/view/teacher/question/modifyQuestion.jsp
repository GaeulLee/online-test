<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify question</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>문제 수정</h2>
	<form action="${pageContext.request.contextPath}/teacher/question/modifyQuestion" method="post">
		<input type="hidden" name="testNo" value="${testNo}">
		<input type="hidden" name="questionNo" value="${oldQuestion.questionNo}">
		<table>
			<tr>
				<th>문제 번호</th>
				<td>
					<input type="number" name="questionIdx" value="${oldQuestion.questionIdx}">
				</td>
			</tr>
			<tr>
				<th>문제</th>
				<td>
					<textarea name="questionTitle" rows="7" cols="70">${oldQuestion.questionTitle}</textarea>
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