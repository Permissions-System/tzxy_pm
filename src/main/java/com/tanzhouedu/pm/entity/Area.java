package com.tanzhouedu.pm.entity;

import com.tanzhouedu.pm.common.TreeEntity;

/**
 * 区域信息实体类
 */
public class Area extends TreeEntity <Area> {
    private static final long serialVersionUID = 4098234993240191336L;

    private String code;
    private String type;

    public static final String ROOT_ID = "0";
    public Area() {
        this.sort = 10;
    }

    public Area(String id) {
        super(id);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public Area getParent() {
        return parent;
    }

    @Override
    public void setParent(Area parent) {
        this.parent = parent;
    }
}
