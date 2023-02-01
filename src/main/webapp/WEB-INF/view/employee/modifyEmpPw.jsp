<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyEmpPw</title>
</head>
<body>
	<h1>${loginEmp.empName}님 비밀번호 수정</h1>
	<form action="${pageContext.request.contextPath}/employee/modifyEmpPw" method="post">
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