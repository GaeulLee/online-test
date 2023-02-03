package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Test;

@Controller
public class TestController {
	@Autowired TestService testService;
	
	// 시험 회차 삭제
	
	// 시험 회차 수정
	
	// 시험 회차 추가
	@GetMapping("/teacher/test/addTest")
	public String addTest() {
		return "teacher/test/addTest";
	}
	@PostMapping("/teacher/test/addTest")
	public String addTest(Test test) {
		
		int row = testService.addTest(test);
		if(row == 0) {
			System.out.println("시험 추가 실패");
		} else {
			System.out.println("시험 추가 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	
	
	// 시험 회차 목록
	@GetMapping("/teacher/test/testList")
	public String testList(Model model) {
		
		List<Test> list = testService.getTestList();
		
		model.addAttribute("list", list);
		
		return "teacher/test/testList";
	}
}
