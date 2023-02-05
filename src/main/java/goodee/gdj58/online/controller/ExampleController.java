package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.vo.Example;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ExampleController {
	@Autowired ExampleService exampleService;
	
	// 문제 보기 삭제
	@GetMapping("/teacher/example/removeExample")
	public String removeExample(Model model
			, @RequestParam(value="exampleNo") int exampleNo
			, @RequestParam(value="questionNo") int questionNo) {
		
		int row = exampleService.removeExample(exampleNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"보기 삭제 실패");
		} else {
			log.debug("\u001B[32m"+"보기 삭제 성공");
		}
		
		return "redirect:/teacher/example/exampleList?questionNo="+questionNo;
	}
	
	// 문제 보기 수정
	@GetMapping("/teacher/example/modifyExample")
	public String modifyExample(Model model
			, @RequestParam(value="exampleNo") int exampleNo
			, @RequestParam(value="questionNo") int questionNo) {
		
		Example oldExample = exampleService.getExampleOne(exampleNo);
		
		model.addAttribute("questionNo", questionNo);
		model.addAttribute("oldExample", oldExample);
		
		return "teacher/example/modifyExample";
	}
	@PostMapping("/teacher/example/modifyExample")
	public String modifyExample(Example example, int questionNo) {
		
		int row = exampleService.modifyExample(example);
		if(row == 0) {
			log.debug("\u001B[32m"+"보기 수정 실패");
		} else {
			log.debug("\u001B[32m"+"보기 수정 성공");
		}
		
		return "redirect:/teacher/example/exampleList?questionNo="+questionNo;
	}
	
	// 문제 보기 추가
	@GetMapping("/teacher/example/addExample")
	public String addExample(Model model
			, @RequestParam(value="questionNo") int questionNo) {
		
		model.addAttribute("questionNo", questionNo);
		
		return "teacher/example/addExample";
	}
	@PostMapping("/teacher/example/addExample")
	public String addExample(Example example, int questionNo) {
		
		int row = exampleService.addExample(example, questionNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"보기 추가 실패");
		} else {
			log.debug("\u001B[32m"+"보기 추가 성공");
		}
		
		return "redirect:/teacher/example/exampleList?questionNo="+questionNo;
	}
	
	
	// 문제 보기 목록
	@GetMapping("/teacher/example/exampleList")
	public String exampleList(Model model
						, @RequestParam(value="questionNo") int questionNo) {
		
		List<Example> list = exampleService.getExampleList(questionNo);
		
		model.addAttribute("list", list);
		model.addAttribute("questionNo", questionNo);
		
		return "teacher/example/exampleList";
	}
}
