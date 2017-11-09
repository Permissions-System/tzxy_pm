package com.tanzhouedu.pm.service;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tanzhouedu.pm.common.BaseService;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.dao.mapper.LogMapper;
import com.tanzhouedu.pm.dao.mapper.MenuMapper;
import com.tanzhouedu.pm.entity.Log;
import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Service;
import org.springframework.web.method.HandlerMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 日志信息服务类
 */
@Service
public class LogService extends BaseService <LogMapper, Log> {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public PageInfo<Log> queryListWithPage(Log entity, PageParam pageParam) {


        if (entity.getEndDate() == null) {
            //把结束日期设置为明天
            entity.setEndDate(DateUtils.addDays(new Date(), 1));
        }

        if (entity.getBeginDate() == null) {
            //把开始日期设置结束日期的前一个月
            entity.setBeginDate(DateUtils.addMonths(entity.getEndDate(), -1));
        }
        return super.queryListWithPage(entity, pageParam);
    }

    public void saveLog (HttpServletRequest request, String title) {
        saveLog (request, null, null, title);
    }

    /**
     * 保存日志
     * @param request
     * @param handler
     * @param e
     * @param title
     */
    public void saveLog (HttpServletRequest request,
                         Object handler, Exception e, String title) {
        Log log = new Log();
        log.setTitle(title);
        log.setException(ExceptionUtil.getStackTraceAsString(e));
        log.setMethod(request.getMethod());
        log.setRemoteAddr(RequestUtil.getRemoteAddr(request));
        log.setType(e == null ? Log.TYPE_OPERATION : Log.TYPE_EXCEPTION);
        log.setParams(request.getParameterMap());
        log.setUserAgent(request.getHeader("user-agent"));
        log.setRequestUri(request.getRequestURI());

        new SaveLogThread(this.mapper, handler, log).start();
    }


    /**
     * 保存日志线程
     */
    class SaveLogThread extends Thread {

        private Log log;
        private LogMapper mapper;
        private Object handler;


        public SaveLogThread (LogMapper mapper, Object handler, Log log) {
            this.mapper = mapper;
            this.handler = handler;
            this.log = log;
        }

        @Override
        public void run() {
            if (StringUtils.isBlank(log.getTitle())) {
                String permissions = "";
                if (handler instanceof HandlerMethod) {
                    Method method = ((HandlerMethod)handler).getMethod();
                    RequiresPermissions rp = method.getAnnotation(RequiresPermissions.class);
                    permissions = (rp != null ? StringUtils.join(rp.value(), ",") : "");
                }

                log.setTitle(getMenuPath(log.getRequestUri(), permissions));
            }

            if (StringUtils.isBlank(log.getTitle())
                    && StringUtils.isBlank(log.getException())) {
                return;
            }

            log.preInsert();
            mapper.insert(log);

        }
    }


    /**
     * 获取菜单完整路径 (系统设置->系统设置->菜单管理)
     * @param href
     * @param permission
     * @return
     */
    public String getMenuPath (String href, String permission) {
        Map<String, String> menuPathMap = (Map<String, String>)
                CacheUtil.get(CacheUtil.CACHE_MENU_NAME_PATH_MAP);

        if (menuPathMap == null) {
            menuPathMap = Maps.newHashMap();
            List<Menu> menuList = menuMapper.queryList(new Menu());

            for (Menu menu : menuList) {
                String namePath = "";
                if (menu.getParentIds() != null) {
                    List<String> namePathList = Lists.newArrayList();
                    for (String id : StringUtils.split(menu.getParentIds(), ",")) {
                        if (Menu.ROOT_ID.equals(id)) {
                            continue;
                        }
                        for (Menu m : menuList) {
                            if (m.getId().equals(id)) {
                                namePathList.add(m.getName());
                                break;
                            }
                        }
                    }
                    namePathList.add(menu.getName());
                    namePath = StringUtils.join(namePathList, "->");

                    if (StringUtils.isBlank(menu.getHref())) {
                        if (StringUtils.isNotBlank(menu.getPermission() )) {
                            for (String p : StringUtils.split(menu.getPermission(), ",")) {
                                menuPathMap.put(p, namePath);
                            }
                        }
                    } else {
                        menuPathMap.put(menu.getHref(), namePath);
                    }
                }
            }
            CacheUtil.put(CacheUtil.CACHE_MENU_NAME_PATH_MAP, menuPathMap);
        }

        String menuNamePath = menuPathMap.get(href);
        if (StringUtils.isBlank(menuNamePath)) {
            for (String p : StringUtils.split(permission, ",")) {
                menuNamePath = menuPathMap.get(p);
                if (StringUtils.isNotBlank(menuNamePath)) {
                    break;
                }
            }
        }

        return menuNamePath == null ? "" : menuNamePath;
    }
}
