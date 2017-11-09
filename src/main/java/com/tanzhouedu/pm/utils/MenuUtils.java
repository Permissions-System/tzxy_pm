package com.tanzhouedu.pm.utils;

import com.google.common.collect.Lists;
import com.tanzhouedu.pm.entity.Menu;

import java.util.List;

/**
 * 菜单信息帮助类
 */
public class MenuUtils {

    /**
     * 对菜单列表进行排序
     * @param menuList
     * @param parentId
     * @param cascade
     * @return
     */
    public static void sortMenuList (List<Menu> returnMenus,
                                     List<Menu> menuList,
                                           String parentId, boolean cascade) {

        for (int i = 0; i < menuList.size(); i++) {
            Menu m = menuList.get(i);
            if (m.getParent() != null && m.getParent().getId() != null
                    && m.getParent().getId().equals(parentId)) {
                returnMenus.add(m);
                if (cascade) {
                    for (Menu child : menuList) {
                        if (child.getParent() != null && child.getParent().getId() != null
                                && child.getParent().getId().equals(m.getId())) {
                            //做递归
                            sortMenuList(returnMenus, menuList, m.getId(), true);
                            break;
                        }
                    }
                }
            }
        }
    }
}
