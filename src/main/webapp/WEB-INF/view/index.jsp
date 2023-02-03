<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<!-- 사원 로그인 -->
	<h2>사원 로그인</h2>
	<form action="${pageContext.request.contextPath}/loginEmp" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="empId">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" name="empPw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">LOGIN</button>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 강사 로그인 -->
	<h2>강사 로그인</h2>
	<form action="${pageContext.request.contextPath}/loginTeacher" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="teacherId">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" name="teacherPw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">LOGIN</button>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 학생 로그인 -->
	<h2>학생 로그인</h2>
	<form action="${pageContext.request.contextPath}/loginStudent" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="studentId">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" name="studentPw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">LOGIN</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>