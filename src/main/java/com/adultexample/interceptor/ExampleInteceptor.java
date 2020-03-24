package com.adultexample.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.adultexample.constant.Common;
import com.adultexample.door.dto.SubjectDto;
import com.adultexample.door.service.DIndexService;
import com.adultexample.manager.service.ChapterService;
import com.adultexample.manager.service.SubjectService;
import com.adultexample.pojo.SCust;
import com.adultexample.pojo.SUser;

public class ExampleInteceptor implements HandlerInterceptor {

	@Autowired
	private DIndexService indexService;
	/*@Autowired
	private IAdService iAdService;
*/
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		StringBuffer requestURL = request.getRequestURL();
		String requeststr = requestURL.toString();
		//后台拦截器
		if(requeststr.contains("org")||requeststr.contains("resource")||requeststr.contains("role")||requeststr.contains("user")||requeststr.contains("cust")||requeststr.contains("chapter")||requeststr.contains("paper")||requeststr.contains("question")||requeststr.contains("subject")||requeststr.contains("index")){
			HttpSession session = request.getSession();
			SUser user = (SUser) session.getAttribute(Common.CURRENT_USER_STRING);
			if (user != null) {
				return true;
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		}
		//前台
		if(requeststr.contains("per")){
			HttpSession session = request.getSession();
			SCust cust = (SCust)session.getAttribute(Common.WEB_CURRENT_USER_STRING);
			if(cust != null){
				return true;
			}else{
				response.sendRedirect(request.getContextPath()+"/door/toindex.action?flag=999");
			}
		}
		
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
