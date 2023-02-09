package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Questioncontroller {
	@Autowired QuestionService questionService;
	@Autowired TestService testService;

	// ******************************** 학생 기능

	
	
	// ******************************** 강사 기능
	
	// 시험 문제 삭제
	@GetMapping("/teacher/question/removeQuestion")
	public String removeExample(Model model
			, @RequestParam(value="testNo") int testNo
			, @RequestParam(value="questionNo") int questionNo) {
		
		int row = questionService.removeQuestion(questionNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"문제 삭제 실패");
		} else {
			log.debug("\u001B[32m"+"문제 삭제 성공");
		}
		
		return "redirect:/teacher/question/questionList?testNo="+testNo;
	}
	
	// 시험 문제 수정
	@GetMapping("/teacher/question/modifyQuestion")
	public String modifyQuestion(Model model
						, @RequestParam(value="testNo") int testNo
						, @RequestParam(value="questionNo") int questionNo) {
		
		Question oldQuestion = questionService.getQuestionOne(questionNo);
		
		model.addAttribute("testNo", testNo);
		model.addAttribute("oldQuestion", oldQuestion);
		
		return "teacher/question/modifyQuestion";
	}
	@PostMapping("/teacher/question/modifyQuestion")
	public String modifyQuestion(Question question, int testNo) {
		
		int row = questionService.modifyQuestion(question);
		if(row == 0) {
			log.debug("\u001B[32m"+"문제 수정 실패");
		} else {
			log.debug("\u001B[32m"+"문제 수정 성공");
		}
		return "redirect:/teacher/question/questionList?testNo="+testNo;
	}
	
	// 시험 문제 추가
	@GetMapping("/teacher/question/addQuestion")
	public String addQuestion(Model model) {
		
		List<Test> testList = testService.getTestListForQuestion();
		
		model.addAttribute("testList", testList);
		
		return "teacher/question/addQuestion";
	}
	@PostMapping("/teacher/question/addQuestion")
	public String addQuestion(Question question, int testNo) {
		
		// System.out.println("question: "+question);
		// System.out.println("testNo: "+testNo);
		
		int row = questionService.addQuestion(question, testNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"문제 수정 실패");
		} else {
			log.debug("\u001B[32m"+"문제 수정 성공");
		}
		return "redirect:/teacher/question/questionList?testNo="+testNo;
	}
}
