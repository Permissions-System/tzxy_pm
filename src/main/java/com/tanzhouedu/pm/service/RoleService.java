package com.tanzhouedu.pm.service;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.tanzhouedu.pm.common.BaseService;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.dao.mapper.RoleMapper;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.utils.CollectionUtil;
import com.tanzhouedu.pm.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 角色信息的服务类
 */
@Service
public class RoleService extends BaseService <RoleMapper, Role> {

    @Override
    @Transactional (readOnly = false)
    public boolean save(Role entity) {

        super.save(entity);

        //保存角色与菜单的关联
        mapper.deleteRoleMenu(entity.getId());
        if (! CollectionUtil.isEmpty(entity.getMenuList())) {
            mapper.insertRoleMenu(entity);
        }

        //保存角色与部门的关联
        mapper.deleteRoleOffice(entity.getId());
        if (! CollectionUtil.isEmpty(entity.getOfficeList())) {
            mapper.insertRoleOffice(entity);
        }

        //清除用户的角色缓存
        UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);

        return true;
    }

    @Override
    public boolean delete(Role entity) {
        //清除用户的角色缓存
        UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
        return super.delete(entity);
    }

    public Role queryRoleByName (String name) {
        Role role = new Role();
        role.setName(name);
        return mapper.queryByName(role);
    }


    /**
     * 将用户绑定指定的角色
     * @param role
     * @param user
     */
    public User assignUserToRole (Role role, User user) {

        List<String> roleIds = user.getRoleIdList();
        if (roleIds.contains(role.getId())) {
            return null;
        }
        user.getRoleList().add(role);
        return user;
    }

    /**
     * 从角色中删除用户
     * @param role
     * @param user
     */
    public User outUserFromRole (Role role, User user){
        List<Role> roleList = user.getRoleList();
        for (Role r : roleList) {
            if (r.getId().equals(role.getId())){
                roleList.remove(r);
            }
        }
        return user;
    }

    @Override
    public List<Role> queryList(Role entity) {
        Map<String, String> dsfMap = Maps.newHashMap();
        dsfMap.put("dsf", dataScopeFilter(UserUtils.getCurrentUser(), "o", null));
        entity.setDataScopeFilter(dsfMap);
        return super.queryList(entity);
    }

    @Override
    public PageInfo<Role> queryListWithPage(Role entity, PageParam pageParam) {
        Map<String, String> dsfMap = Maps.newHashMap();
        dsfMap.put("dsf", dataScopeFilter(UserUtils.getCurrentUser(), "o", null));
        entity.setDataScopeFilter(dsfMap);

        return super.queryListWithPage(entity, pageParam);
    }
}
