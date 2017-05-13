package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.bean.Users;
import com.services.UserRoleServices;

public class loginFilter implements Filter {
	private UserRoleServices userRoleServices;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		Users user = (Users)session.getAttribute("user");
		String path = req.getServletPath();
		if(path.startsWith("/user") || path.startsWith("/captcha") || path.equals("/index.jsp") || path.startsWith("/dist") || path.startsWith("/plugins") || path.startsWith("/images") || path.startsWith("/js")
				|| path.startsWith("/bootstrap") || path.startsWith("/css")) {
			chain.doFilter(req, resp);
			return;
		} else {
			if(user != null) {
				if(path.startsWith("/admin") && userRoleServices.hasAdminRole(user)) {
					chain.doFilter(req, resp);
					return;
				} else if(path.startsWith("/teacher") && userRoleServices.hasTeacherRole(user)) {
					chain.doFilter(req, resp);
					return;
				} else if(path.startsWith("/student") && userRoleServices.hasStudentRole(user)) {
					chain.doFilter(req, resp);
					return;
				} else {
					resp.sendRedirect(request.getServletContext().getContextPath()+"/user/login");
				}
			} else {
				resp.sendRedirect(request.getServletContext().getContextPath()+"/user/login");
			}
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		ServletContext context = config.getServletContext();//这里获取applicationContext  
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);  
        userRoleServices = (UserRoleServices) ctx.getBean(UserRoleServices.class);  
	}
}
