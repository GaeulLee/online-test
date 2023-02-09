package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.IdMapper;

@Service
@Transactional
public class IdService {
	@Autowired IdMapper idMapper;
	
	// no 이면 id 사용불가 yes 이면 사용가능
	public String getIdCheck(String id) {
		
		String result = "no";
		if(idMapper.selectIdCheck(id) == null) {
			result = "yes";
		}
		return result;
	}

}
