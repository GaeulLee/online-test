<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD example</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>문제 보기 추가</h2>
	<form action="${pageContext.request.contextPath}/teacher/example/addExample" method="post">
		<input type="hidden" name="questionNo" value="${questionNo}">
		<table>
			<tr>
				<th>보기 번호</th>
				<td>
					<input type="number" name="exampleIdx">
				</td>
			</tr>
			<tr>
				<th>보기</th>
				<td>
					<textarea name="exampleTitle" rows="7" cols="70"></textarea>
				</td>
			</tr>
			<tr>
				<th>정답 여부</th>
				<td>
					<select name="exampleOx">
						<option value="오답">오답</option>
						<option value="정답">정답</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>