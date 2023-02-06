package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.mapper.QuestionMapper;
import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.vo.Example;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ExampleController {
	@Autowired ExampleService exampleService;
	@Autowired QuestionService questionService;
	
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
	public String addExample(Model model) {
		
		List<Map<String, Object>> questionList = questionService.getQuestionListForAddExample();
		
		model.addAttribute("questionList", questionList);
		
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
	
	// 전체 문제 보기 목록
	@GetMapping("/teacher/example/exampleListAll")
	public String exampleListAll(Model model
						, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
						, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		log.debug("\u001B[35m"+"searchWord------> "+searchWord);
		log.debug("\u001B[35m"+"rowPerPage------> "+rowPerPage);
		log.debug("\u001B[35m"+"currentPage------> "+currentPage);
		
		List<Map<String, Object>> list = exampleService.getExampleListAll(rowPerPage, currentPage, searchWord);
		int cnt = exampleService.getExampleCnt(searchWord);
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
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "teacher/example/exampleListAll";
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
