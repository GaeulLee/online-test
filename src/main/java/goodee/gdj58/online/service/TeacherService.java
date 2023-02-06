package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TeacherService {
	@Autowired TeacherMapper teacherMapper;
	
	// 비밀번호 수정
	public int modifyTeacherPw(String oldPw, String newPw, String teacherId) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		paramMap.put("teacherId", teacherId);
		
		return teacherMapper.updateTeacherPw(paramMap);
	}
	
	// 로그인
	public Teacher login(Teacher teacher) {
		return teacherMapper.login(teacher);
	}
	
	/*
	 **************** 관리자(사원)기능 
	 */
	
	// 강사 등록
	public int addTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}
	
	// 강사 삭제
	public int removeTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 전체 강사 수
	public int getTeacherCnt(String searchWord) {
		return teacherMapper.selectTeacherCnt(searchWord);
	}
	
	// 강사 목록 출력
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String searchWord){
		
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return teacherMapper.selectTeacherList(paramMap);
	}
}
