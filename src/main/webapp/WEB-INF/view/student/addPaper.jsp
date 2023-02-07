<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addPaper</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<c:forEach var="q" items="${qList}" varStatus="i">
	<script>
		$(document).ready(function(){
			
			const index = '<c:out value="${i.index}"/>';
			const nameForExampleInput = 'input[name=answer'+index+']:radio';
			const answerCheckResult = 'input[name=answer'+index+']:radio:checked';
			const classChecked = '.answer'+index+':checked';
			const idGetAnswer = '#getAnswer'+index;
			
			// console.log('index '+index);
			// console.log('nameForExampleInput '+nameForExampleInput);
			// console.log('classChecked '+classChecked);
			// console.log('idGetAnswer '+idGetAnswer);
			
			$(nameForExampleInput).change(function(){
				$(idGetAnswer).attr("value", $(classChecked).val());
				// var test = $(classChecked).val();
				// console.log(test);
			});
			
			$('#addPaperBtn').click(function(){
				
				if($(answerCheckResult).length == 0){
					$('#msg').text('모든 문제에 답을 해주세요.');
					console.log('msg');
				} else {
					$('#addPaperForm').submit();
				}
				
			});
			
		});
	</script>
	
</c:forEach>
</head>
<body>
	<!-- studentMenu include -->
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>

	<h2>${testTitle}(${testDate})</h2>
	<span id="msg">${err}</span>
	<form action="${pageContext.request.contextPath}/student/addPaper" method="post" id="addPaperForm">
		<table border="1">
			<c:forEach var="q" items="${qList}" varStatus="i">
				<input type="hidden" name="questionNo" value="${q.questionNo}">
				<input type="hidden" name="answer" id="getAnswer${i.index}">
				<input type="hidden" name="testNo" value="${testNo}">
				<tr>
					<!-- 문제 -->
					<th>Q${q.questionIdx}. ${q.questionTitle}</th>
				</tr>
				<tr>
					<td>
						<!-- 보기 -->
						<c:forEach var="e" items="${eList}">
							<c:if test="${q.questionNo == e.questionNo}">
								<div>
									<label>
										<input type="radio" name="answer${i.index}" class="answer${i.index}" id="putAnswer${i.index}" value="${e.exampleIdx}">
										 A${e.exampleIdx}. ${e.exampleTitle}
									</label>
								</div>
							</c:if>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" id="addPaperBtn">시험지 제출</button>
	</form>
</body>
</html>