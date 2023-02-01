<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentList</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>STUDENT LIST</h1>
	<div>
		<a href="${pageContext.request.contextPath}/student/addStudent">학생등록</a>
	</div>
	<table>
		<tr>
			<th>studentId</th>
			<th>studentName</th>
			<th>edit</th>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.studentId}</td>
				<td>${s.studentName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/student/removeStudent?studentNo=${s.studentNo}">학생삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/student/studentList?currentPage=1">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		
		<span>${currentPage}</span>
		
		<c:if test="${currentPage == endPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < endPage}">
			<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${endPage}">마지막</a>
	</div>
</body>
</html>