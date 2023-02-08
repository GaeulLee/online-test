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
	
	<h2>내가 본 시험 목록</h2>
	<table>
		<tr>
			<th>시험날짜</th>
			<th colspan="2">시험명</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testDate}</td>
				<td>${t.testTitle}</td>
				<td>
					<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/student/paperOne?testNo=${t.testNo}'">
						점수확인
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>