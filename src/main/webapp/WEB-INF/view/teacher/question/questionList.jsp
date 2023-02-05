<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionList</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>${testTitle} 문제 목록</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/question/addQuestion?testNo=${testNo}">문제 추가</a>
	</div>
	<table>
		<tr>
			<th>문제</th>
			<th>편집</th>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/example/exampleList?questionNo=${q.questionNo}">
						Q${q.questionIdx}. ${q.questionTitle}
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/question/modifyQuestion?questionNo=${q.questionNo}&testNo=${testNo}">
						수정
					</a>
					<a href="${pageContext.request.contextPath}/teacher/question/removeQuestion?questionNo=${q.questionNo}&testNo=${testNo}">
						삭제
					</a>
				</td>
			</tr>		
		</c:forEach>
	</table>
</body>
</html>