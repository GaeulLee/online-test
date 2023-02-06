<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD question</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addQBtn').click(function(){
			
			if($('#testNo').val() == '0'){
				alert('등록할 시험을 먼저 선택해주세요.');
				return;
			}
			
			if($('#questionIdx').val() == ''){
				alert('문제 번호를 입력해주세요.');
				return;
			}
			
			if($('#questionTitle').val() == ''){
				alert('문제를 입력해주세요.');
				return;
			}
			
			$('#addQForm').submit();
		});

	});
</script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>시험 문제 추가</h2>
	<form action="${pageContext.request.contextPath}/teacher/question/addQuestion" method="post" id="addQForm">
		<table>
			<tr>
				<th>시험 선택</th>
				<td>
					<select name="testNo" id="testNo">
						<option value="0">문제 등록할 시험 선택</option>
						<c:forEach var="t" items="${testList}">
							<option value="${t.testNo}">${t.testTitle}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>문제 번호</th>
				<td>
					<input type="number" name="questionIdx" id="questionIdx">
				</td>
			</tr>
			<tr>
				<th>문제</th>
				<td>
					<textarea name="questionTitle" rows="7" cols="70" id="questionTitle"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="addQBtn">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>