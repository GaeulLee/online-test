<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentHome</title>
</head>
<body>
	<!-- studentMenu include -->
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	
	<div>
		<h2>지난 시험 목록</h2>
		<table>
			<tr>
				<th>시험일정</th>
				<th>시험명</th>
			</tr>
			<c:forEach var="pt" items="${pastTList}">
				<tr>
					<td>${pt.testDate}</td>
					<td>${pt.testTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<h2>오늘 시험 목록</h2>
		<table>
			<tr>
				<th>시험일정</th>
				<th>시험명</th>
			</tr>
			<c:forEach var="ct" items="${currentTList}">
				<tr>
					<td>${ct.testDate}</td>
					<td>${ct.testTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<h2>예정 시험 목록</h2>
		<table>
			<tr>
				<th>시험일정</th>
				<th>시험명</th>
			</tr>
			<c:forEach var="ft" items="${futureTList}">
				<tr>
					<td>${ft.testDate}</td>
					<td>${ft.testTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>