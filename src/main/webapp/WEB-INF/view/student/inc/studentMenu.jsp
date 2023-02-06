<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/student/studentHome">홈</a>
	<!-- 지난 시험, 오늘 볼 시험 , 앞으로 볼 시험(날짜로 분기) -->
	
	<!-- 오늘날짜를 기준으로 시험 참여 가능 여부 분기 -->
	<!--
		지나간 시험(table : test) 리스트 + 점수 -> 점수 확인버튼 -> 제출 답안지 확인(O/X)(table : paper)
			+ 이번 시험 회차의 평균 점수, 응시자 수, 내 등수 등등 추가 정보
		오늘 날짜 시험 리스트는 응시버튼 -> 시험지 출력(table : question(문제) JOIN example(보기)) -> 답안 제출(table : paper)
		누가 몇회의 어떤 시험의 여러 문제의 답
	-->
	<a href="${pageContext.request.contextPath}/student/studentTestList">시험응시</a>
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호 변경</a> <!-- 비빌번호 수정 -->
	<a href="${pageContext.request.contextPath}/student/logout">로그아웃</a>
</div>
