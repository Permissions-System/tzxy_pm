package com.tanzhouedu.pm.service;

import com.tanzhouedu.pm.common.BaseEntity;
import com.tanzhouedu.pm.common.BaseService;
import com.tanzhouedu.pm.dao.mapper.*;
import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.security.Principal;
import com.tanzhouedu.pm.utils.CacheUtil;
import com.tanzhouedu.pm.utils.EncryptUtil;
import com.tanzhouedu.pm.utils.StringUtils;
import com.tanzhouedu.pm.utils.UserUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 用户信息服务类
 */
@Service
public class UserService extends BaseService <UserMapper, User>{

    @Resource
    private RoleMapper roleMapper;
    @Resource
    private MenuMapper menuMapper;
    @Resource
    private OfficeMapper officeMapper;
    @Resource
    private AreaMapper areaMapper;

    public static final int HASH_ITERATIONS = 1024;
    public static final int SALT_SIZE = 8;

    public static final String USER_CACHE = "userCache";
    public static final String USER_CACHE_ID = "id_";
    public static final String USER_CACHE_LOGINNAME = "loginName_";

    /**
     * 根据用户的用户名查询用户
     * @param loginName
     * @return
     */
    public User queryUserByLoginName (String loginName){
        User user = (User) CacheUtil.get(USER_CACHE, USER_CACHE_LOGINNAME + loginName);
        if (user == null) {
            user = mapper.queryUserByLoginName(new User(null, loginName));
            if (user == null) {
                return null;
            }

            //查询用户所拥有的角色列表
            List<Role> roleList = roleMapper.queryByUserId(new Role(user));
            user.setRoleList(roleList);

            CacheUtil.put(USER_CACHE, USER_CACHE_LOGINNAME + loginName, user);
            CacheUtil.put(USER_CACHE, USER_CACHE_ID + user.getId(), user);
        }
        return user;
    }

    @Override
    public User queryById(String id) {
        User user = (User) CacheUtil.get(USER_CACHE, USER_CACHE_ID + id);
        if (user == null) {
            user = mapper.queryById(id);
            if (user == null) {
                return null;
            }

            //查询用户所拥有的角色列表
            List<Role> roleList = roleMapper.queryByUserId(new Role(user));
            user.setRoleList(roleList);

            CacheUtil.put(USER_CACHE, USER_CACHE_ID + id, user);
            CacheUtil.put(USER_CACHE, USER_CACHE_LOGINNAME + user.getLoginName(), user);
        }
        return user;
    }

    @Override
    @Transactional (readOnly = false)
    public boolean save(User entity) {

        if (StringUtils.isBlank(entity.getId())) {
            entity.preInsert();
            mapper.insert(entity);
            mapper.insertUserRole(entity);
        } else {
            entity.preUpadate();
            mapper.update(entity);
            mapper.deleteUserRole(entity.getId());
            mapper.insertUserRole(entity);
            // 如果修改了登陆名，就会导致缓存无法清除
            // 解决方案是在用户对象里面添加一个oldLoginName属性
            clearUserCache (entity);
        }

        return super.save(entity);
    }

    /**
     * 保存用户的角色信息
     * @param user
     */
    @Transactional
    public void saveUserRole (User user, boolean isUpdate) {
        if (isUpdate) {
            mapper.deleteUserRole(user.getId());
        }
        mapper.insertUserRole(user);

        clearUserCache(user);
    }

    /**
     * 获取当前登陆的用户的角色列表
     * @return
     */
    public List <Role> getRoleList () {
        List <Role> roleList = (List <Role>)UserUtils.getCache(UserUtils.CACHE_ROLE_LIST);
        if (roleList == null) {
            User user = UserUtils.getCurrentUser();

            //查询用户所拥有的角色列表
            roleList = roleMapper.queryByUserId(new Role(user));
            UserUtils.putCache(UserUtils.CACHE_ROLE_LIST, roleList);
        }

        return roleList;
    }


    /**
     * 获取当前登陆用户所拥有的菜单列表
     * @return
     */
    public List <Menu> getMenuList () {
        List <Menu> menuList = (List <Menu>)UserUtils.getCache(UserUtils.CACHE_MENU_LIST);
        if (menuList == null) {
            User user = UserUtils.getCurrentUser();
            Menu menu = new Menu();
            menu.setUserId(user.getId());
            menuList = menuMapper.queryByUserId(menu);
            UserUtils.putCache(UserUtils.CACHE_MENU_LIST, menuList);
        }
        return menuList;
    }

    /**
     * 修改用户密码
     * @param user
     * @return
     */
    public boolean updateUserPasword (User user){
        clearUserCache(user);
        return mapper.updateUserPasword(user) > 0;
    }

    /**
     * 修改用户登陆的相关信息
     * @param user
     * @return
     */
    public boolean updateUserLonginInfo (User user){
        user.setLoginDate(new Date());
        user.setLoginIp(UserUtils.getSession().getHost());
        clearUserCache(user);
        return mapper.updateUserLonginInfo(user) > 0;
    }


    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public boolean updateUserInfo (User user) {
        user.preUpadate();
        clearUserCache(user);
        return mapper.update(user) > 0;
    }

    /**
     * 根据角色Id查询用户列表
     * @param roleId
     * @return
     */
    public List<User> queryListByRoleId (String roleId) {
        return mapper.queryListByRoleId(roleId, BaseEntity.DEL_FLAG_NORMAL);
    }

    /**
     * 对密码进行加密 SHA-1
     * @param plainPassword 明文密码
     * @return
     */
    public String enctypePassword (String plainPassword) {

        byte[] salt = EncryptUtil.generateSalt(SALT_SIZE);
        byte[] hashPass = EncryptUtil.sha1(plainPassword.getBytes(), salt, HASH_ITERATIONS);
        return EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass);

    }

    /**
     * 校验密码是否有效
     * @param plainPass 明文密码
     * @param password 密文密码
     * @return
     */
    public boolean validatePassword (String plainPass, String password) {
        byte[] salt = EncryptUtil.decodeHex(password.substring(0, 16));
        byte[] hashPass = EncryptUtil.sha1(plainPass.getBytes(), salt, HASH_ITERATIONS);
        return password.equals(EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass));
    }

    /**
     * 清除用户缓存
     * @param user
     */
    private void clearUserCache (User user) {
        CacheUtil.remove(USER_CACHE, USER_CACHE_ID + user.getId());
        CacheUtil.remove(USER_CACHE, USER_CACHE_LOGINNAME + user.getLoginName());
        CacheUtil.remove(USER_CACHE, USER_CACHE_LOGINNAME + user.getOldLoginName());
    }

}
