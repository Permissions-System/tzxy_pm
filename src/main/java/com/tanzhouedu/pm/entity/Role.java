package com.tanzhouedu.pm.entity;

import com.google.common.collect.Lists;
import com.tanzhouedu.pm.common.BaseEntity;
import com.tanzhouedu.pm.utils.CollectionUtil;
import com.tanzhouedu.pm.utils.Config;
import com.tanzhouedu.pm.utils.StringUtils;

import java.util.List;

/**
 * 角色信息实体类
 */
public class Role extends BaseEntity {
    private static final long serialVersionUID = 1898270895969420383L;

    private Office office; //归属机构
    private String name; //角色名字
    private String dataScope; //数据范围
    private String isSys; //是否是系统数据 （1：是，0: 否）
    private String useable; //是否可用 （1：是，0: 否）

    public static final String DATA_SCOPE_ALL = "1";
    public static final String DATA_SCOPE_COM_AND_CHILD = "2";
    public static final String DATA_SCOPE_COMPANY = "3";
    public static final String DATA_SCOPE_OFFICE_AND_CHILD = "4";
    public static final String DATA_SCOPE_OFFICE = "5";
    public static final String DATA_SCOPE_SELF = "8";
    public static final String DATA_SCOPE_CUSTOM = "9";

    private List<Menu> menuList = Lists.newArrayList(); //角色关联的菜单集合
    private List<Office> officeList = Lists.newArrayList(); //按明细设置时的机构集合


    private User user;

    public Role() {
        super();
        this.dataScope = DATA_SCOPE_SELF;
        this.isSys = Config.NO;
        this.useable = Config.YES;
    }

    public Role(String id) {
        super(id);
    }

    public Role (User user) {
        this();
        this.user = user;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDataScope() {
        return dataScope;
    }

    public void setDataScope(String dataScope) {
        this.dataScope = dataScope;
    }

    public String getIsSys() {
        return isSys;
    }

    public void setIsSys(String isSys) {
        this.isSys = isSys;
    }

    public String getUseable() {
        return useable;
    }

    public void setUseable(String useable) {
        this.useable = useable;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

    public List<Office> getOfficeList() {
        return officeList;
    }

    public void setOfficeList(List<Office> officeList) {
        this.officeList = officeList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<String> getMenuIdList () {
        List<String> menuIdList = Lists.newArrayList();
        for (Menu menu : menuList) {
            menuIdList.add(menu.getId());
        }
        return menuIdList;
    }

    public void setMenuIdList (List<String> menuIds) {
        menuList = Lists.newArrayList();
        for (String menuId : menuIds) {
            Menu menu = new Menu(menuId);
            menuList.add(menu);
        }
    }

    public String getMenuIds () {
        return CollectionUtil.extractToString(menuList, "id", ",");
    }

    public void setMenuIds (String menuIds) {
        if (StringUtils.isNotBlank(menuIds)) {
            String[] ids = StringUtils.split(menuIds, ",");
            setMenuIdList(Lists.newArrayList(ids));
        }
    }

    public List<String> getOfficeIdList () {
        List<String> officeIdList = Lists.newArrayList();
        for (Office office : officeList) {
            officeIdList.add(office.getId());
        }
        return officeIdList;
    }

    public void setOfficeIdList (List<String> officeIdList) {
        officeList = Lists.newArrayList();
        for (String s : officeIdList) {
            Office o = new Office(s);
            officeList.add(o);
        }
    }

    public String getOfficeIds () {
        return CollectionUtil.extractToString(officeList, "id", ",");
    }

    public void setOfficeIds (String officeIds) {
        if (StringUtils.isNotBlank(officeIds)) {
            String[] ids = StringUtils.split(officeIds, ",");
            setOfficeIdList(Lists.newArrayList(ids));
        }
    }
}
