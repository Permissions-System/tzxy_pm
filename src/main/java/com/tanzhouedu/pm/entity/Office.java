package com.tanzhouedu.pm.entity;

import com.tanzhouedu.pm.common.TreeEntity;
import com.tanzhouedu.pm.utils.Config;

/**
 * 机构信息实体类
 */
public class Office extends TreeEntity <Office> {
    private static final long serialVersionUID = 8772060763969569387L;

    public static final String TYPE_COMPANY = "1";
    public static final String TYPE_DEPARTMENT = "2";
    public static final String TYPE_GROUP = "3";
    public static final String TYPE_OHTER = "4";


    public static final String GRADE_ONE = "1";
    public static final String GRADE_TWO = "2";
    public static final String GRADE_THREE = "3";
    public static final String GRADE_FOUR = "4";


    private Area area; //归属区域
    private String code; //编码
    private String type; //类型 （1：公司；2：部门；3：小组；4:其他）
    private String grade; //级别 （1：一级；2：二级；3：三级； 4：四级）
    private String address; //机构地址
    private String zipCode; //邮编
    private String master;//负责人
    private String phone; //联系电话
    private String fax; //传真
    private String email; //邮箱号
    private String useable = Config.YES; //是否可用


    public Office() {
        super();
        this.type = TYPE_DEPARTMENT;
    }

    public Office(String id) {
        super(id);
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
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

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getMaster() {
        return master;
    }

    public void setMaster(String master) {
        this.master = master;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUseable() {
        return useable;
    }

    public void setUseable(String useable) {
        this.useable = useable;
    }

    @Override
    public Office getParent() {
        return parent;
    }

    @Override
    public void setParent(Office parent) {
        this.parent = parent;
    }
}
