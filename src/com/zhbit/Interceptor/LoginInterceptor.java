package com.zhbit.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhbit.pojo.ManagerAccount;
import com.zhbit.pojo.StudentAccount;


public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session =  ((HttpServletRequest) request).getSession(true);
		ManagerAccount manager = (ManagerAccount)session.getAttribute("managerInfo");
		StudentAccount stu = (StudentAccount)session.getAttribute("staffInfo");
		if (manager!=null || stu!=null) {
			return true;
		}else {
			session.setAttribute("err", "请登录后再进行访问");;
			String path = request.getContextPath();
			response.sendRedirect(path+"/login/ManagerLogin.jsp");
			return false;
		}
	}
}
