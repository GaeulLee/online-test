package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.PaperMapper;
import goodee.gdj58.online.vo.Paper;

@Service
@Transactional
public class PaperService {
	@Autowired PaperMapper paperMapper;
	
	// 답안 입력
	public int addPaper(Paper paper) {
		return paperMapper.insertPaper(paper);
	}
}
