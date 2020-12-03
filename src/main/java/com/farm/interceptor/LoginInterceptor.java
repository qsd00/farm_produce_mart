package com.farm.interceptor;

import com.farm.pojo.OrderItem;
import com.farm.pojo.User;
import com.farm.service.OrderItemService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private OrderItemService orderItemService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        String[] noNeedAuthPage = new String[]{
                "Home",
                "Regist",
                "Login",
                "CheckLogin",
                "LoginAjax",
                "Search",
                "Product",
                "Category",
                "FirstCategory",
                "SelectCategory",
                "Purchase",
                "PurchaseShow",
                "ProductQuotation",
                "SearchProductQuotation",
                "Doreview"
        };

        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        if(uri.startsWith("/fore")){
            String method = StringUtils.substringAfterLast(uri,"/fore" );
            if(!Arrays.asList(noNeedAuthPage).contains(method)){
                User user =(User) session.getAttribute("user");
                if(null==user){
                    response.sendRedirect("loginPage");
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        User user =(User) request.getSession() .getAttribute("user");
        int  cartTotalItemNumber = 0;
        if(null!=user) {
            List<OrderItem> ois = orderItemService.listByUid(user.getId());
            cartTotalItemNumber=ois.size();
        }
        request.getSession().setAttribute("cartTotalItemNumber", cartTotalItemNumber);
    }
}