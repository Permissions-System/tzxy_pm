package com.tanzhouedu.pm.service;

import com.tanzhouedu.pm.common.TreeService;
import com.tanzhouedu.pm.dao.mapper.MenuMapper;
import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.utils.CacheUtil;
import com.tanzhouedu.pm.utils.StringUtils;
import com.tanzhouedu.pm.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.text.html.parser.Entity;
import java.util.List;

/**
 * 菜单服务类
 */
@Service
public class MenuSerice extends TreeService<MenuMapper, Menu> {

    public boolean updateSort (Menu menu) {
        //清除用户菜单缓存
        UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
        UserUtils.removeCache(CacheUtil.CACHE_MENU_NAME_PATH_MAP);
        return mapper.updateSort(menu) > 0;
    }

    @Override
    @Transactional (readOnly = false)
    public boolean save(Menu menu) {
        /*//设置父节点信息
        menu.setParent(super.queryById(menu.getParent().getId()));

        String oldParentIds = menu.getParentIds();
        //设置parentIds
        menu.setParentIds(menu.getParent().getParentIds() + menu.getParent().getId() + ",");

        boolean saved = false;
        if (StringUtils.isBlank(menu.getId())) {
            menu.preInsert();
            saved =  mapper.insert(menu) > 0;
        } else {
            menu.preUpadate();
            saved = mapper.update(menu) > 0;
        }

        //是否要更新子节点ID（修改菜单并且修改了菜单的父节点的时候）
        if (StringUtils.isNotBlank(menu.getId())
                && menu.getOldParentId().equals(menu.getParent().getId())) {
            //寻找子节点
            Menu m = new Menu();
            m.setParentIds(menu.getId());
            List<Menu> list = mapper.queryByParentIdsLike(m);
            for (Menu child : list) {
                child.setParentIds(child.getParentIds().replace(oldParentIds, menu.getParentIds()));
                mapper.updateParentIds(child);
            }
        }*/

        boolean saved = super.save(menu);

        //清除用户菜单缓存
        UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
        UserUtils.removeCache(CacheUtil.CACHE_MENU_NAME_PATH_MAP);
        return saved;
    }

    @Override
    public boolean delete(Menu entity) {
        //清除用户菜单缓存
        UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
        UserUtils.removeCache(CacheUtil.CACHE_MENU_NAME_PATH_MAP);
        return super.delete(entity);
    }
}
