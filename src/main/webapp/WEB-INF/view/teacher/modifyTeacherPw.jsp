<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyTeacherPw</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>${loginTeacher.teacherName}님 비밀번호 수정</h1>
	<div>${errMsg}</div>
	<form action="${pageContext.request.contextPath}/teacher/modifyTeacherPw" method="post">
		<table>
			<tr>
				<th>현재 PW</th>
				<td>
					<input type="password" name="oldPw">
				</td>
			</tr>
			<tr>
				<th>바꿀 PW</th>
				<td>
					<input type="password" name="newPw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>