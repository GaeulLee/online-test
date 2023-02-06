package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaperController {
	@Autowired QuestionService questionService;
	@Autowired TestService testService;
	@Autowired ExampleService exampleService;
	
	// 시험 답안 등록
	@GetMapping("/student/addPaper")
	public String getQuestionByTestNo(Model model
						, @RequestParam(value="testNo") int testNo) {
		
		List<Map<String, Object>> questionList = questionService.getQuestionByTestNo(testNo);
		List<Map<String, Object>> exampleList = exampleService.getExampleByTestNo(testNo);
		Test test = testService.getTestOne(testNo);
		
		model.addAttribute("questionList", questionList);
		model.addAttribute("exampleList", exampleList);
		model.addAttribute("testNo", testNo);
		model.addAttribute("testTitle", test.getTestTitle());
		model.addAttribute("testDate", test.getTestDate());
		
		return "student/addPaper";
	}
}
