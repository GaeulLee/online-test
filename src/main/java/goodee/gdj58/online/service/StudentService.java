package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional
public class StudentService {
	@Autowired private StudentMapper studentMapper;
	
	// 비밀번호 수정
	public int modufyStudentPw(String oldPw, String newPw, String studentId) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		paramMap.put("studentId", studentId);
		
		return studentMapper.updateStudentPw(paramMap);
	}
	
	// 로그인
	public Student login(Student student) {
		return studentMapper.login(student);
	}
	
	// **********************************관리자 기능
	// 학생 등록
	public int addStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	// 학생 삭제
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	
	// 전체 학생 수
	public int getStudentCnt(String searchWord) {
		return studentMapper.selectStudentCnt(searchWord);
	}
	
	// 학생 목록 출력
	public List<Student> getStudentList(int currnetPage, int rowPerPage, String searchWord){
		int beginRow = (currnetPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return studentMapper.selectStudentList(paramMap);
	}
}
