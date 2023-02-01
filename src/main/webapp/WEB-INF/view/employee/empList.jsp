<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>EMPLOYEE LIST</h1>
	<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
	<table>
		<tr>
			<th>empId</th>
			<th>empName</th>
			<th>edit</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.empId}</td>
				<td>${e.empName}</td>
				<td><a href="${pageContext.request.contextPath}/employee/deleteEmp?empNo=${e.empNo}">사원삭제</a></td><!-- 수정 -->
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		
		<span>${currentPage}</span>
		
		<c:if test="${currentPage == endPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < endPage}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${endPage}">마지막</a>
	</div>
</body>
</html>