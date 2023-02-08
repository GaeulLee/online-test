package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.PaperMapper;
import goodee.gdj58.online.vo.Paper;

@Service
@Transactional
public class PaperService {
	@Autowired PaperMapper paperMapper;
	
	// 응시한 시험 상세보기(점수 확인)
	public List<Map<String, Object>> getPaperByTestNoAndStudentNo(int testNo, int studentNo){
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("studentNo", studentNo);
		
		return paperMapper.selectPaperByTestNoAndStudentNo(paramMap);
	}
	
	// 답안 입력
	public int addPaper(Paper paper) {
		return paperMapper.insertPaper(paper);
	}
}
