package com.tanzhouedu.pm.common;

import com.tanzhouedu.pm.utils.ReflectionUtil;
import com.tanzhouedu.pm.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 树形数据通用service类
 */
public abstract class TreeService <D extends TreeMapper<T>, T extends TreeEntity <T>>
        extends BaseService <D, T> {

    @Override
    @Transactional (readOnly = false)
    public boolean save (T entity) {

        Class <T> entityClass = ReflectionUtil.getClassGenricType(getClass(), 1);

        if (entity.getParent() == null || StringUtils.isBlank(entity.getParentId())
                || "0".equals(entity.getParentId())) {
            entity.setParent(null);
        } else {
            entity.setParent(super.queryById(entity.getParentId()));
        }

        //
        if (entity.getParent() == null) {
            T parentEntity;
            try {
                parentEntity = entityClass.getConstructor(String.class).newInstance("0");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            entity.setParent(parentEntity);
            entity.getParent().setParentIds("");
        }

        //设置父节点信息
        String oldParentIds = entity.getParentIds();
        entity.setParentIds(entity.getParent().getParentIds() + entity.getParent().getId() + ",");


        boolean isUpdate = true;
        if (StringUtils.isBlank(entity.getId())) {
            isUpdate = false;
        }

        super.save(entity);

        //是否要更新子节点ID（修改并且修改了父节点的时候）
        if (isUpdate
                && ! entity.getOldParentId().equals(entity.getParent().getId())) {
            T subEntity;
            try {
                subEntity = entityClass.newInstance();
            } catch (Exception e) {
                throw  new RuntimeException(e);
            }

            subEntity.setParentIds(entity.getId());
            List<T> list = mapper.queryByParentIdsLike(subEntity);
            for (T t : list) {
                t.setParentIds(t.getParentIds().replace(oldParentIds, entity.getParentIds()));
                mapper.updateParentIds(t);
            }
        }
        return true;
    }



}
