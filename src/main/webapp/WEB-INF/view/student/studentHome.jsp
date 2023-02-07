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
			<c:if test="${pastTList == null}">
				<tr>
					<td>지난 시험이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${pastTList != null}">
				<c:forEach var="pt" items="${pastTList}">
					<tr>
						<td>${pt.testDate}</td>
						<td>${pt.testTitle}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	
	<div>
		<h2>오늘 시험 목록</h2>
		<table>
			<tr>
				<th>시험일정</th>
				<th>시험명</th>
			</tr>
			<c:if test="${currentTList == null}">
				<tr>
					<td>오늘 볼 시험이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${currentTList != null}">
				<c:forEach var="ct" items="${currentTList}">
					<tr>
						<td>${ct.testDate}</td>
						<td>${ct.testTitle}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	
	<div>
		<h2>예정 시험 목록</h2>
		<table>
			<tr>
				<th>시험일정</th>
				<th>시험명</th>
			</tr>
			<c:if test="${futureTList == null}">
				<tr>
					<td>예정된 시험이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${futureTList != null}">
				<c:forEach var="ft" items="${futureTList}">
					<tr>
						<td>${ft.testDate}</td>
						<td>${ft.testTitle}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	
</body>
</html>