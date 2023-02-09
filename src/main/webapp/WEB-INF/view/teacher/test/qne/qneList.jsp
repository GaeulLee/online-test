<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qneList</title>
</head>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>${test.testTitle} 문제</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/test/qne/addQne?testNo=${test.testNo}">문제 추가</a>
	</div>
	<table>
		<tr>
			<th>문제번호</th>
			<th>문제</th>
			<th>편집</th>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>${q.questionIdx}번</td>
				<td>${q.questionTitle}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/test/qneOne/modifyQne?questionNo=${q.questionNo}&testNo=${testNo}">
						수정
					</a>
					<a href="${pageContext.request.contextPath}/teacher/test/qneOne/removeQne?questionNo=${q.questionNo}&testNo=${testNo}">
						삭제
					</a>
				</td>
			</tr>		
		</c:forEach>
	</table>
</body>
</html>