<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paperOne</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	
</script>
</head>
<body>
	<!-- studentMenu include -->
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	
	<h2>점수 확인</h2>
	<table>
		<tr>
			<th>(${testDate}) ${testTitle}</th>
		</tr>
		<tr>
			<td>점수 : ${totalScore}점</td>
		</tr>
		
		<c:forEach var="p" items="${list}">
			<tr>
				<th>Q${p.questionIdx}. ${p.questionTitle}</th>
			</tr>
			<tr>
				<td>
					<div>정답 : ${p.exampleIdx}번 ${p.exampleTitle}</div>
					<c:forEach var="w" items="${wrongList}">
						<c:if test="${p.questionNo == w.questionNo}">
							<div>${w.exampleIdx}번 ${w.exampleTitle}</div>
						</c:if>
					</c:forEach>
					<div>내 답 : ${p.answer}번</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>