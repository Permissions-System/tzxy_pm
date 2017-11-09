package com.tanzhouedu.pm.common;

import java.util.List;

/**
 * 树形数据的通用Mapper
 */
public interface TreeMapper <T extends TreeEntity<T>> extends BaseMapper <T>{

    /**
     * 找到所有的子节点
     * @param entity
     * @return
     */
    List<T> queryByParentIdsLike (T entity);

    /**
     * 更新所有祖先节点Id
     * @param entity
     * @return
     */
    int updateParentIds (T entity);
}
