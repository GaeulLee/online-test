<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testList</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>TEST LIST</h1>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/test/addTest">시험 추가</a>
	</div>
	<table>
		<tr>
			<th>시험 날짜</th>
			<th>시험 제목</th>
			<th>편집</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testDate}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/question/questionList?testNo=${t.testNo}">${t.testTitle}</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/test/modifyTest?testNo=${t.testNo}">수정</a>
					<a href="${pageContext.request.contextPath}/teacher/test/removeTest?testNo=${t.testNo}">삭제</a>
				</td>
			</tr>		
		</c:forEach>
	</table>
</body>
</html>