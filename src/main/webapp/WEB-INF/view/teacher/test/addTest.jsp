<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD TEST</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>ADD TEST</h1>
	<form action="${pageContext.request.contextPath}/teacher/test/addTest" method="post">
		<table>
			<!-- 시험 -->
			<tr>
				<th>시험명</th>
				<td>
					<input type="text" name="testTitle">
				</td>
				<th>시험 날짜</th>
				<td>
					<input type="date" name="testDate">
				</td>
			</tr>
			
			<!-- 문제 -->
			<tr>
				<th colspan="1">문제 번호</th>
				<td colspan="3">
					<input type="number" name="questionIdx" value="1" disabled>
				</td>
			</tr>
			<tr>
				<th colspan="1">문제</th>
				<td colspan="3">
					<textarea name="questionTitle" rows="7" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4"><button type="button" >문제 추가</button></td>
			</tr>
			
			<!-- 보기 -->
			<tr>
				<th colspan="1">보기 번호</th>
				<td colspan="3">
					<input type="number" name="exampleIdx" value="1" disabled>
				</td>
			</tr>
			<tr>
				<th colspan="1">보기</th>
				<td colspan="3">
					<textarea name="exampleTitle" rows="7" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4"><button type="button" >보기 추가</button></td>
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