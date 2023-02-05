<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify example</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>문제 보기 수정</h2>
	<form action="${pageContext.request.contextPath}/teacher/example/modifyExample" method="post">
		<input type="hidden" name="exampleNo" value="${oldExample.exampleNo}">
		<input type="hidden" name="questionNo" value="${questionNo}">
		<table>
			<tr>
				<th>보기 번호</th>
				<td>
					<input type="number" name="exampleIdx" value="${oldExample.exampleIdx}">
				</td>
			</tr>
			<tr>
				<th>보기</th>
				<td>
					<textarea name="exampleTitle" rows="7" cols="70">${oldExample.exampleTitle}</textarea>
				</td>
			</tr>
			<tr>
				<th>정답 여부</th>
				<td>
					<select name="exampleOx">
						<c:if test="${oldExample.exampleOx == '정답'}">
							<option value="오답">오답</option>
							<option value="정답" selected>정답</option>
						</c:if>
						<c:if test="${oldExample.exampleOx == '오답'}">
							<option value="오답" selected>오답</option>
							<option value="정답">정답</option>
						</c:if>
					</select>
					
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>