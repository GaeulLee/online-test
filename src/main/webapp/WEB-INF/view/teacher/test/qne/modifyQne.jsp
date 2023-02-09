<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyQne</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#modiBtn').click(function(){
			$('#modiForm').submit();
		});
	});
</script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>${test.testTitle} 문제 수정</h2>
	<form action="${pageContext.request.contextPath}/teacher/test/qne/modifyQne" method="post" id="modiForm">
		<input type="hidden" name="testNo" value="${test.testNo}">
		<input type="hidden" name="questionNo" value="${question.questionNo}">
		<!-- 문제 입력 -->
		<table>
			<tr>
				<th>문제번호</th>
				<td><input type="number" name="questionIdx" id="questionIdx" value="${question.questionIdx}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>문제</th>
				<td><textarea name="questionTitle" id="questionTitle" rows="5" cols="50">${question.questionTitle}</textarea></td>
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
				<td><input type="text" name="exampleTitle" value="${eList.get(0).exampleTitle}" class="exampleTitle"></td>
				<td>
					<c:if test="${eList.get(0).exampleOx == '정답'}">
						<select name="exampleOx">
							<option value="오답">오답</option>
							<option value="정답" selected>정답</option>
						</select>
					</c:if>
					<c:if test="${eList.get(0).exampleOx == '오답'}">
						<select name="exampleOx">
							<option value="오답" selected>오답</option>
							<option value="정답">정답</option>
						</select>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>2번</td>
				<td><input type="text" name="exampleTitle" value="${eList.get(1).exampleTitle}" class="exampleTitle"></td>
				<td>
					<c:if test="${eList.get(1).exampleOx == '정답'}">
						<select name="exampleOx">
							<option value="오답">오답</option>
							<option value="정답" selected>정답</option>
						</select>
					</c:if>
					<c:if test="${eList.get(1).exampleOx == '오답'}">
						<select name="exampleOx">
							<option value="오답" selected>오답</option>
							<option value="정답">정답</option>
						</select>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>3번</td>
				<td><input type="text" name="exampleTitle" value="${eList.get(2).exampleTitle}" class="exampleTitle"></td>
				<td>
					<c:if test="${eList.get(2).exampleOx == '정답'}">
						<select name="exampleOx">
							<option value="오답">오답</option>
							<option value="정답" selected>정답</option>
						</select>
					</c:if>
					<c:if test="${eList.get(2).exampleOx == '오답'}">
						<select name="exampleOx">
							<option value="오답" selected>오답</option>
							<option value="정답">정답</option>
						</select>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>4번</td>
				<td><input type="text" name="exampleTitle" value="${eList.get(3).exampleTitle}" class="exampleTitle"></td>
				<td>
					<c:if test="${eList.get(3).exampleOx == '정답'}">
						<select name="exampleOx">
							<option value="오답">오답</option>
							<option value="정답" selected>정답</option>
						</select>
					</c:if>
					<c:if test="${eList.get(3).exampleOx == '오답'}">
						<select name="exampleOx">
							<option value="오답" selected>오답</option>
							<option value="정답">정답</option>
						</select>
					</c:if>
				</td>
			</tr>
		</table>
		<button type="button" id="modiBtn">문제수정</button>
	</form>
</body>
</html>