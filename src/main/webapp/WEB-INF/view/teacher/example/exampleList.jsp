<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exampleList</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>보기 목록</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/example/addExample">보기 추가</a>
	</div>
	<table>
		<tr>
			<th>보기</th>
			<th>정답여부</th>
			<th>편집</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>A${e.exampleIdx}. ${e.exampleTitle}</td>
				<td>${e.exampleOx}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/example/modifyExample?exampleNo=${e.exampleNo}&questionNo=${questionNo}">수정</a>
					<a href="${pageContext.request.contextPath}/teacher/example/removeExample?exampleNo=${e.exampleNo}&questionNo=${questionNo}">삭제</a>
				</td>
			</tr>		
		</c:forEach>
	</table>
</body>
</html>