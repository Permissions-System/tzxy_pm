package com.tanzhouedu.pm.dao.mapper;

import com.tanzhouedu.pm.common.TreeMapper;
import com.tanzhouedu.pm.entity.Menu;

import java.util.List;

/**
 * 菜单信息的持久化操作接口
 */
public interface MenuMapper extends TreeMapper<Menu> {

    List<Menu> queryByUserId (Menu menu);

    int updateSort (Menu menu);
}
