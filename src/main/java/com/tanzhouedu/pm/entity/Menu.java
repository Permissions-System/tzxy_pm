package com.tanzhouedu.pm.entity;

import com.tanzhouedu.pm.common.TreeEntity;
import com.tanzhouedu.pm.utils.Config;

/**
 * 菜单信息实体类
 */
public class Menu extends TreeEntity <Menu> {
    private static final long serialVersionUID = 5996304656246872203L;

    public static final String ROOT_ID = "1";

    private String href; //链接
    private String target; //目标
    private String icon; //图标
    private String isShow; //是否显示（1：显示， 0 不显示）
    private String permission; //权限标志



    private String userId;


    public Menu() {
        super();
        this.sort = 10;
        this.isShow = Config.SHOW;
    }

    public Menu(String id) {
        super(id);
    }

    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


}
