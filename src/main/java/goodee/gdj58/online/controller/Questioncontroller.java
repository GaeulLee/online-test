package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.vo.Question;

@Controller
public class Questioncontroller {
	@Autowired QuestionService questionService;
	
	// 시험 문제 삭제
	
	// 시험 문제 수정
	
	// 시험 문제 추가
	@GetMapping("/teacher/question/addQuestion")
	public String addQuestion() {
		return "teacher/question/addQuestion";
	}
	@PostMapping("/teacher/question/addQuestion")
	public String addQuestion(Question question, int testNo) {
		
		int row = questionService.addQuestion(question, testNo);
		if(row == 0) {
			System.out.println(testNo+"번 시험 문제 추가 실패");
		} else {
			System.out.println(testNo+"번 시험 문제 추가 성공");
		}
		return "redirect:/teacher/question/questionList";
	}
	
	// 시험 문제 목록
	@GetMapping("/teacher/question/questionList")
	public String questionList(Model model,
								@RequestParam(value="testNo") int testNo) {
		
		List<Question> list = questionService.getQuestionList(testNo);
		
		model.addAttribute("list", list);
		
		return "teacher/question/questionList";
	}
}
