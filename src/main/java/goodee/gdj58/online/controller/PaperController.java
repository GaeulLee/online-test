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
	
	// 응시할 시험 불러오기(답안 등록)
	@GetMapping("/student/addPaper")
	public String addPaper(Model model
						, @RequestParam(value="testNo") int testNo) {
		
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
