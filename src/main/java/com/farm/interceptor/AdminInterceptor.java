package com.farm.interceptor;

import com.farm.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
         User user= (User) request.getSession().getAttribute("user");
         if (user!=null&&user.getType()==1){
             return true;
         }
        response.sendRedirect("loginPage");
        return false;
    }
}
