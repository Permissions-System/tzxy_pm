package com.tanzhouedu.pm.entity;

import com.tanzhouedu.pm.common.BaseEntity;
import com.tanzhouedu.pm.utils.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Map;

/**
 * 日志信息实体类
 */
public class Log extends BaseEntity {
    private static final long serialVersionUID = 8498216282743453375L;
    private String type;        //日志类型（1.操作日志，2.异常日志）
    private String title;       //日志标日
    private String remoteAddr;  //操作用户的IP地址
    private String userAgent;   //操作用户的代理信息
    private String requestUri;  //访问的URI
    private String method;      //访问的方式
    private String params;      //访问参数
    private String exception;   //错误堆栈

    public static final String TYPE_OPERATION = "1";
    public static final String TYPE_EXCEPTION = "2";

    @DateTimeFormat (pattern = "yyyy-MM-dd")
    private Date beginDate;
    @DateTimeFormat (pattern = "yyyy-MM-dd")
    private Date endDate;

    public Log() {
    }

    public Log(String id) {
        super(id);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemoteAddr() {
        return remoteAddr;
    }

    public void setRemoteAddr(String remoteAddr) {
        this.remoteAddr = remoteAddr;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public void setParams(Map paramMap) {
        if (paramMap == null) {
            return;
        }

        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String[]> param : ((Map<String, String[]>)paramMap).entrySet()) {
            sb.append("".equals(param.toString()) ? "" : "&").append(param.getKey()).append("=");
            String paramValue = "";
            if (param.getValue() != null && param.getValue().length > 0) {
                paramValue = param.getValue()[0];
            }

            sb.append(paramValue);
        }

        this.params = sb.toString();
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
