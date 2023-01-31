<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>사원 추가</h1>
	<form action="${pageContext.request.contextPath}/employee/addEmp" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="empName">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="empId">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="empPw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>