package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/teacher/*")
public class TeacherLoginFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("\u001B[31m"+"TeacherLoginFilter");
		
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("loginTeacher") == null) {
				((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/loginTeacher");
				return;
			}
		} else {
			log.debug("웹브라우저 요청만 허용됩니다.");
			return;
		}
		
		chain.doFilter(request, response);
	}

}
