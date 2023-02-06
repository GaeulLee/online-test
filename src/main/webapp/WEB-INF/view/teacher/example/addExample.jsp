<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD example</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addEBtn').click(function(){
			
			if($('#questionNo').val() == '0'){
				alert('등록할 시험을 먼저 선택해주세요.');
				return;
			}
			
			if($('#exampleIdx').val() == ''){
				alert('문제 번호를 입력해주세요.');
				return;
			}
			
			if($('#exampleTitle').val() == ''){
				alert('문제를 입력해주세요.');
				return;
			}
			
			if($('#exampleOx').val() == ''){
				alert('문제를 입력해주세요.');
				return;
			}
			
			$('#addEForm').submit();
		});

	});
</script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>문제 보기 추가</h2>
	<form action="${pageContext.request.contextPath}/teacher/example/addExample" method="post" id="addEForm">
		<table>
			<tr>
				<th>문제 선택</th>
				<td>
					<select name="questionNo" id="questionNo">
						<option value="0">보기 등록할 문제 선택</option>
						<c:forEach var="q" items="${questionList}">
							<option value="${q.questionNo}">${q.testTitle}-Q${q.questionIdx}.${q.questionTitle}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>보기 번호</th>
				<td>
					<input type="number" name="exampleIdx" id="exampleIdx">
				</td>
			</tr>
			<tr>
				<th>보기</th>
				<td>
					<textarea name="exampleTitle" rows="7" cols="70" id="exampleTitle"></textarea>
				</td>
			</tr>
			<tr>
				<th>정답 여부</th>
				<td>
					<select name="exampleOx" id="exampleOx">
						<option value="오답">오답</option>
						<option value="정답">정답</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="addEBtn">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>