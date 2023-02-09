package goodee.gdj58.online.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.IdService;

@RestController
public class TeacherRestController {
	@Autowired IdService idService;
	
	@GetMapping("/employee/teacher/idck")
	public String idck(@RequestParam(value="idForCk") String idForCk) {
		return idService.getIdCheck(idForCk);
	}
}