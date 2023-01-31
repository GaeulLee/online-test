package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// 컨트롤러에 요청경로를 지정 또는 컨트롤러 내의 메서드에도 요청경로를 지정할 수 있음
@Controller()
public class HelloController {
	/*
	@GetMapping("/test") // <-> PostMapping
	public String test() {
		System.out.println("test...");
		return "test"; // 최종적인 view 이름 -> /WEB-INF/view/'test'.jsp
	}
	*/
	
	/*
	@GetMapping("/test")
	public void test() { // void 타입 -> 메서드 이름이 view 이름이 됨
		System.out.println("void test...");
	}
	*/
	
	
	@GetMapping("/test")
	public ModelAndView test() { // ModelAndView 타입
		System.out.println("ModelAndView test...");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
	
	
	/*
	@RequestMapping(value="/test2") // get, post 요청 모두 처리 하기 위해서는 RequestMapping
	public String test2() {
		System.out.println("test...2");
		return "test";
	}
	*/
}
