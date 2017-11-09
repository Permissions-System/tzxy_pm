package com.tanzhouedu.pm.dao.mapper;

import com.tanzhouedu.pm.common.BaseMapper;
import com.tanzhouedu.pm.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户信息数据持久化操作接口
 */
@Repository
public interface UserMapper extends BaseMapper<User> {


    /**
     * 根据用户的用户名查询用户
     * @param user
     * @return
     */
    User queryUserByLoginName (User user);

    /**
     * 修改用户密码
     * @param user
     * @return
     */
    int updateUserPasword (User user);

    /**
     * 修改用户登陆的相关信息
     * @param user
     * @return
     */
    int updateUserLonginInfo (User user);

    /**
     * 新增用户与角色的关联
     * @param user
     * @return
     */
    int insertUserRole (User user);

    /**
     * 删除用户与角色的关联
     * @param id
     * @return
     */
    int deleteUserRole (String id);

    /**
     * 根据角色ID查询用户列表
     * @param roleId
     * @return
     */
    List<User> queryListByRoleId (@Param("roleId")String roleId,
                                  @Param("delFlag")String delFlag);
}
