<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherList</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>TEACHER LIST</h1>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/addTeacher">강사등록</a>
	</div>
	<table>
		<tr>
			<th>teacherId</th>
			<th>teacherName</th>
			<th>edit</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.teacherId}</td>
				<td>${t.teacherName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/removeTeacher?teacherNo=${t.teacherNo}">강사삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/teacherList?currentPage=1">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/teacherList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		
		<span>${currentPage}</span>
		
		<c:if test="${currentPage == endPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < endPage}">
			<a href="${pageContext.request.contextPath}/teacher/teacherList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/teacher/teacherList?currentPage=${endPage}">마지막</a>
	</div>
</body>
</html>