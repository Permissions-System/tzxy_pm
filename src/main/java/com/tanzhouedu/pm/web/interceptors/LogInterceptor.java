package com.tanzhouedu.pm.web.interceptors;

import com.tanzhouedu.pm.service.LogService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 记录日志的拦截器
 */
public class LogInterceptor extends HandlerInterceptorAdapter{

    @Resource
    private LogService logService;

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        logService.saveLog(request, handler, ex, null);
    }
}
