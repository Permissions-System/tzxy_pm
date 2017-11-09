package com.tanzhouedu.pm.utils;

import com.tanzhouedu.pm.common.SpringContextHolder;
import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.security.Principal;
import com.tanzhouedu.pm.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.List;

/**
 * 用户信息帮助类
 */
public class UserUtils {

    private static UserService userService = SpringContextHolder.getBean(UserService.class);


    public static final String CACHE_ROLE_LIST = "user_role_list";
    public static final String CACHE_MENU_LIST = "user_menu_list";


    /**
     * 获取当前登陆的用户信息
     * @return
     */
    public static Principal getPrincipal () {
        Subject subject = SecurityUtils.getSubject();
        Principal principal =  (Principal)subject.getPrincipal();
        return principal;
    }

    /**
     * 获取当前登陆的用户对象
     * @return 如果登陆的用户为空，则返回空User
     */
    public static User getCurrentUser () {
        Principal principal = getPrincipal();
        if (principal != null) {
            User user = userService.queryById(principal.getId());
            if (user != null) {
                return user;
            } else {
                return new User ();
            }
        } else {
            return new User ();
        }
    }

    /**
     * 获取当前登陆用户所拥有的菜单列表
     * @return
     */
    public static List<Menu> getMenuList () {
        return userService.getMenuList();
    }

    /**
     * 获取当前登陆的用户的角色列表
     * @return
     */
    public static List <Role> getRoleList () {
        return userService.getRoleList();
    }


    /**
     * 获得用户的会话信息
     * @return
     */
    public static Session getSession () {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        return session;
    }

    //--------------------------用户会话信息的缓存操作-----------------------//
    public static void putCache (String key, Object value) {
        getSession().setAttribute(key, value);
    }

    public static Object getCache (String key) {
        return getSession().getAttribute(key);
    }

    public static void removeCache (String key) {
        getSession().removeAttribute(key);
    }
}
