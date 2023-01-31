<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Emp</title>
</head>
<body>
	<h1>사원 로그인</h1>
	<form action="${pageContext.request.contextPath}/employee/loginEmp" method="post">
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
					<button type="submit">로그인</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>