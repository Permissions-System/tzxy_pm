package com.tanzhouedu.pm.common;

import com.tanzhouedu.pm.utils.ReflectionUtil;
import com.tanzhouedu.pm.utils.StringUtils;

/**
 * 树形数据的实体类
 */
public abstract class TreeEntity<T> extends BaseEntity{
    private static final long serialVersionUID = 6559459012901963749L;

    protected T parent; //父级对象
    protected String parentIds; //所有祖先菜单的id，以","分割
    protected String name;
    protected Integer sort;
    private String oldParentId;

    public TreeEntity() {
        super();
        this.sort = 10;
    }

    public TreeEntity(String id) {
        super(id);
    }

    /**
     * 因为只能通过子类去实现，否则mybatis无法获得parent对象
     * @return
     */
    public abstract T getParent();

    public abstract void setParent(T parent);

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
    public String getOldParentId() {
        return oldParentId;
    }

    public void setOldParentId(String oldParentId) {
        this.oldParentId = oldParentId;
    }
    /**
     * 获取父级对象的ID
     * @return
     */
    public String getParentId () {
        String id = null;
        if (parent != null) {
            id = (String) ReflectionUtil.getFieldValue(parent, "id");
        }
        return StringUtils.isNotBlank(id) ? id : "0";
    }
}
