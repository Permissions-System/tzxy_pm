package com.tanzhouedu.pm.security;

import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.service.LogService;
import com.tanzhouedu.pm.service.UserService;
import com.tanzhouedu.pm.utils.Config;
import com.tanzhouedu.pm.utils.EncryptUtil;
import com.tanzhouedu.pm.utils.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2015/7/22.
 */
@Component
public class UserPassAuthRealm extends AuthorizingRealm{

    @Resource
    private UserService userService;

    @Resource
    private LogService logService;
    /***
     * 获取授权信息
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Principal principal = (Principal)getAvailablePrincipal(principalCollection);
        User user = userService.queryUserByLoginName(principal.getLoginName());
        if (user != null) {
            //添加当前用户相关的权限信息
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            List<Menu>  menuList = userService.getMenuList();
            for (Menu menu : menuList) {
                if (StringUtils.isNotBlank(menu.getPermission())){
                    for (String permission : StringUtils.split(menu.getPermission(), ",")){
                        info.addStringPermission(permission);
                    }
                }

            }

            info.addStringPermission("user");
            //添加用户拥有的角色
            List<Role> roleList = userService.getRoleList();
            for (Role role : roleList) {
                info.addRole(role.getName());
            }

            // 更新用户登陆的相关信息
            userService.updateUserLonginInfo(user);


            HttpServletRequest request = ((ServletRequestAttributes)
                    RequestContextHolder.getRequestAttributes()).getRequest();
            // 记录用户登陆的日志
            logService.saveLog(request, "系统登陆");
            return info;
        }
        return null;
    }

    /**
     * 进行登陆的认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        UsernamePasswordToken authTocken = (UsernamePasswordToken)authenticationToken;

        User user = userService.queryUserByLoginName(authTocken.getUsername());

        if (user != null) {
            if (Config.YES.equals(user.getLoginFlag())) {
                byte[] salt = EncryptUtil.decodeHex(user.getPassword().substring(0,16));

                return new SimpleAuthenticationInfo(new Principal(user),
                        user.getPassword().substring(16),
                        ByteSource.Util.bytes(salt), getName());
            } else {
                throw new AuthenticationException("colin:该账号已禁止登陆!");
            }
        } else {
            return null;
        }

    }

    /**
     * 设定密码校验的算法与迭代次数
     */
    @PostConstruct
    public void initCredentialsMatcher () {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(EncryptUtil.SHA1);
        matcher.setHashIterations(userService.HASH_ITERATIONS);
        setCredentialsMatcher(matcher);
    }
}
