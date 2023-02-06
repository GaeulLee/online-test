<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentTestList</title>
</head>
<body>
	<!-- studentMenu include -->
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	
	<h2>test list</h2>
	<table>
		<tr>
			<th>시험일정</th>
			<th>시험명</th>
			<th>응시가능여부</th>
		</tr>
		<c:forEach var="t" items="${testList}">
			<c:if test="${t.testDate < now}">
				<tr>
					<td>${t.testDate}</td>
					<td>${t.testTitle}</td>
					<td>내 점수</td>
				</tr>
			</c:if>
			<c:if test="${t.testDate == now}">
				<tr>
					<td>${t.testDate}</td>
					<td>${t.testTitle}</td>
					<td>
						<a href="${pageContext.request.contextPath}/student/addPaper?testNo=${t.testNo}">응시하기</a>
					</td>
				</tr>
			</c:if>
			<c:if test="${t.testDate > now}">
				<tr>
					<td>${t.testDate}</td>
					<td>${t.testTitle}</td>
					<td>응시 불가</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>