package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.PaperService;
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaperController {
	@Autowired TestService testService;
	@Autowired QuestionService questionService;
	@Autowired ExampleService exampleService;
	@Autowired PaperService paperService;
	
	// 응시한 시험 상세보기
	@GetMapping("/student/paperOne")
	public String paperOne(Model model, HttpSession session
						, @RequestParam(value="testNo") int testNo) {
		
		// 세션에서 학생 no 받기
		Student student = (Student)session.getAttribute("loginStudent");
		int studentNo = student.getStudentNo();
		
		// 서비스 호출
		Test test = testService.getTestOne(testNo); // 시험 정보를 위한 서비스
		List<Map<String, Object>> list = paperService.getPaperByTestNoAndStudentNo(testNo, studentNo); // 문제와 정답인 보기
		List<Example> wrongList = exampleService.getWrongExampleList(testNo, studentNo);
		
		// 정답과 학생의 답 비교하여 점수계산
		int[] exampleIdx = new int[list.size()];
		int[] answer = new int[list.size()];
		int scorePerQuestion = 20;
		int totalScore = 0;
		for(int i = 0; i<list.size(); i++) {
			// 1) list에 담긴 exampleIdx와 answer를 각각의 배열에 담기
			exampleIdx[i] = Integer.parseInt(list.get(i).get("exampleIdx").toString());
			answer[i] = Integer.parseInt(list.get(i).get("answer").toString());
			
			// 2) 두 배열 비교
			if(exampleIdx[i] == answer[i]) {
				totalScore = totalScore + scorePerQuestion;
			}
		}
		
		// 모델에 담아 뷰로 넘기기
		model.addAttribute("testTitle", test.getTestTitle());
		model.addAttribute("testDate", test.getTestDate());
		model.addAttribute("list", list);
		model.addAttribute("wrongList", wrongList);
		model.addAttribute("totalScore", totalScore);
		
		return "student/paperOne";
	}
	
	// 응시할 시험 불러오기(답안 등록)
	@GetMapping("/student/addPaper")
	public String addPaper(Model model, HttpSession session
						, @RequestParam(value="testNo") int testNo) {
		
		 // 시험 응시 여부 확인
		Student student = (Student)session.getAttribute("loginStudent");
		List<Map<String, Object>> list = paperService.getPaperByTestNoAndStudentNo(testNo, student.getStudentNo());
		if(!list.isEmpty()) {
			log.debug("\u001B[32m"+"잘못된 접근 : 시험 답안 데이터 있음");
			model.addAttribute("err", "이미 응시한 시험입니다.");
			
			return "redirect:/student/studentTestList";
		}
		
		// 서비스 호출
		Test test = testService.getTestOne(testNo);
		List<Map<String, Object>> eList = exampleService.getExampleByTestNo(testNo);
		List<Map<String, Object>> qList = questionService.getQuestionByTestNo(testNo);
		
		model.addAttribute("testNo", testNo);
		model.addAttribute("testTitle", test.getTestTitle());
		model.addAttribute("testDate", test.getTestDate());
		model.addAttribute("eList", eList);
		model.addAttribute("qList", qList);
		
		return "student/addPaper";
	}
	@PostMapping("/student/addPaper")
	public String addPaper(HttpServletRequest request, Model model, HttpSession session) {
		
		int testNo = Integer.parseInt(request.getParameter("testNo"));
		String[] questionNo = request.getParameterValues("questionNo");
		String[] answer = request.getParameterValues("answer");
		
		Student student = (Student)session.getAttribute("loginStudent");
		int studentNo = student.getStudentNo();
		
		log.debug("\u001B[32m"+"studentNo --------> "+studentNo);
		log.debug("\u001B[32m"+"questionNo.length --------> "+questionNo.length);
		log.debug("\u001B[32m"+"answer.length --------> "+answer.length);
		log.debug("\u001B[32m"+"answer[0] --------> "+answer[0]);
		
		// 서비스 호출
		for(int i=0; i<answer.length; i++) {
			
			int questionNoInt = Integer.parseInt(questionNo[i]);
			int answerInt = Integer.parseInt(answer[i]);
			
			Paper paper = new Paper();
			paper.setStudentNo(studentNo);
			paper.setQuestionNo(questionNoInt);
			paper.setAnswer(answerInt);
			
			int resultRow = paperService.addPaper(paper);
			if(resultRow == 0) {
				log.debug("\u001B[32m"+i+"번째 답안 입력 실패");
				model.addAttribute("err", "답안지 전송에 실패하였습니다.");
				return "redirect:/student/addPaper?testNo="+testNo;
			}
		}
		log.debug("\u001B[32m"+"모든 답안 입력 성공");
		
		return "redirect:/student/studentHome";
	}
}
