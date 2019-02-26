package com.shopping.interceptor;

import com.shopping.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

class Authentication implements HandlerInterceptor {
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    //进入Handler方法之前执行
    //如果认证没有通过表示用户没有登陆，需要此方法拦截不再往下执行，否则就放行
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        //获取请求的uri
        String uri = request.getRequestURI();
        List<String> uris = new ArrayList();
        System.out.println("URI为:" + uri);
        uris.add("/login");
        uris.add("/main");
        uris.add("/register");
        uris.add("/search");


        //Ajax请求则不拦截
        if (request.getHeader("x-requested-with") != null) {
            return true;
        }

        //公开地址是否含有登陆提交的地址
        if (uris.contains(uri)) {
            //如果进行登陆提交，放行
            return true;
        }

        //判断session
        HttpSession session = request.getSession();
        //从session中取出用户身份信息
        if (session.getAttribute("currentUser") != null  && !(session.getAttribute("currentUser") instanceof String)) {
            return true;
        }

        //执行到这里，表示用户身份未登录或权限不够，强制跳转到登陆页面
        request.getRequestDispatcher("login").forward(request, response);
        //System.out.println("为什么不出来");
        return false;
    }
}
