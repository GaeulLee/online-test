<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addQne</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			$('#addForm').submit();
		});
	});
</script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>${test.testTitle} 문제추가</h2>
	<form action="${pageContext.request.contextPath}/teacher/test/qne/addQne" method="post" id="addForm">
		<input type="hidden" name="testNo" value="${test.testNo}">
		<!-- 문제 입력 -->
		<table>
			<tr>
				<th>문제번호</th> <!-- db에서 testNo로 해당 시험의 questionIdx max값+1, 리스트가 비어있으면 1 -->
				<td><input type="number" name="questionIdx" id="questionIdx" value="${maxQueIdx}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>문제</th>
				<td><textarea name="questionTitle" id="questionTitle" rows="5" cols="50"></textarea></td>
			</tr>
		</table>
		
		<!-- 보기 입력 -->
		<!-- 정답 오답 : 정답의 갯수는 1개, 오답이 4개이면 안됨 -->
		<table>
			<tr>
				<th colspan="2">보기</th>
				<th>정답유무</th>
			</tr>
			<tr>
				<td>1번</td>
				<td><input type="text" name="exampleTitle" class="exampleTitle"></td>
				<td>
					<select name="exampleOx">
						<option value="오답">오답</option>
						<option value="정답">정답</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>2번</td>
				<td><input type="text" name="exampleTitle" class="exampleTitle"></td>
				<td>
					<select name="exampleOx">
						<option value="오답">오답</option>
						<option value="정답">정답</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>3번</td>
				<td><input type="text" name="exampleTitle" class="exampleTitle"></td>
				<td>
					<select name="exampleOx">
						<option value="오답">오답</option>
						<option value="정답">정답</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>4번</td>
				<td><input type="text" name="exampleTitle" class="exampleTitle"></td>
				<td>
					<select name="exampleOx">
						<option value="오답">오답</option>
						<option value="정답">정답</option>
					</select>
				</td>
			</tr>
		</table>
		<button type="button" id="addBtn">문제등록</button>
	</form>
</body>
</html>