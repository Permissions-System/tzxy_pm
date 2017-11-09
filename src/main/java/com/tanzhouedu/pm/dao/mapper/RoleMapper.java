package com.tanzhouedu.pm.dao.mapper;

import com.tanzhouedu.pm.common.BaseMapper;
import com.tanzhouedu.pm.entity.Role;

import java.util.List;

/**
 * 角色信息的持久化操作接口
 */
public interface RoleMapper extends BaseMapper <Role> {

    List<Role> queryByUserId (Role role);

    /**
     * 删除角色与菜单的关联
     * @param roleId
     * @return
     */
    int deleteRoleMenu (String roleId);

    /**
     * 新增角色与菜单的关联
     * @param role
     * @return
     */
    int insertRoleMenu (Role role);

    /**
     * 删除角色与部门的关联
     * @param roleId
     * @return
     */
    int deleteRoleOffice (String roleId);

    /**
     * 新增角色与部门的关联
     * @param role
     * @return
     */
    int insertRoleOffice (Role role);


    /**
     * 根据角色名查询角色
     * @param role
     * @return
     */
    Role queryByName (Role role);
}
