package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;
	
	// 시험 회차 삭제
	@GetMapping("/teacher/test/removeTest")
	public String removeExample(Model model
			, @RequestParam(value="testNo") int testNo) {
		
		int row = testService.removeTest(testNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"시험 삭제 실패");
		} else {
			log.debug("\u001B[32m"+"시험 삭제 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	
	// 시험 회차 수정
	@GetMapping("/teacher/test/modifyTest")
	public String modifyTest(Model model
				, @RequestParam(value="testNo") int testNo) {
		
		Test oldTest = testService.getTestOne(testNo);
		
		model.addAttribute("oldTest", oldTest);
		
		return "teacher/test/modifyTest";
	}
	@PostMapping("/teacher/test/modifyTest")
	public String modifyTest(Test test) {
		
		int row = testService.modifyTest(test);
		if(row == 0) {
			log.debug("\u001B[32m"+"시험 수정 실패");
		} else {
			log.debug("\u001B[32m"+"시험 수정 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	
	// 시험 회차 추가
	@GetMapping("/teacher/test/addTest")
	public String addTest() {
		return "teacher/test/addTest";
	}
	@PostMapping("/teacher/test/addTest")
	public String addTest(Test test) {
		
		int row = testService.addTest(test);
		if(row == 0) {
			log.debug("\u001B[32m"+"시험 추가 실패");
		} else {
			log.debug("\u001B[32m"+"시험 추가 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	
	
	// 시험 회차 목록
	@GetMapping("/teacher/test/testList")
	public String testList(Model model
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		log.debug("\u001B[35m"+"searchWord------> "+searchWord);
		log.debug("\u001B[35m"+"rowPerPage------> "+rowPerPage);
		log.debug("\u001B[35m"+"currentPage------> "+currentPage);
		
		List<Test> list = testService.getTestList(rowPerPage, currentPage, searchWord);
		int cnt = testService.getTestCnt(searchWord);
		int lastPage = cnt/rowPerPage;
		
		int listPerPage = 10;
		int startPage = (currentPage-1)/listPerPage*listPerPage+1;
		int endPage = startPage+listPerPage-1;
		
		if(lastPage%rowPerPage != 0) {
			lastPage++;
		}
		if(lastPage == 0) {
			lastPage = 1;
		}
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "teacher/test/testList";
	}
}
