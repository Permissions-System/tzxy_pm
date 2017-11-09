package com.tanzhouedu.pm.entity;

import com.google.common.collect.Lists;
import com.tanzhouedu.pm.common.BaseEntity;
import com.tanzhouedu.pm.utils.CollectionUtil;
import com.tanzhouedu.pm.utils.StringUtils;
import org.hibernate.validator.constraints.Email;

import java.util.Date;
import java.util.List;

/**
 * 用户实体类
 */
public class User extends BaseEntity {

    public static final String LOGIN_NORMAL = "1";
    private static final long serialVersionUID = 521939327403960794L;
    private Office company;
    private Office office;
    private String loginName;
    private String oldLoginName;
    private String password;
    private String newPassword;
    private String no;
    private String name;
    @Email (message = "邮箱格式不正确")
    private String email;
    private String phone;
    private String mobile;
    private String loginIp;
    private String loginFlag;
    private Date loginDate;

    private List<Role> roleList = Lists.newArrayList(); //拥有的角色

    public User() {
    }

    public User(String id) {
        super(id);
    }

    public User (String id, String loginName) {
        this.loginName = loginName;
        this.id = id;
    }

    public Office getCompany() {
        return company;
    }

    public void setCompany(Office company) {
        this.company = company;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getLoginFlag() {
        return loginFlag;
    }

    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public String getOldLoginName() {
        return oldLoginName;
    }

    public void setOldLoginName(String oldLoginName) {
        this.oldLoginName = oldLoginName;
    }

    /**
     * 把用户所拥有的角色通过字符串返回，多个角色以","分割
     * @return
     */
    public String getRoleNames () {
        return CollectionUtil.extractToString(roleList, "name", ",");
    }

    public List<String> getRoleIdList () {
        List<String> roleIdList = Lists.newArrayList();
        for (Role role : roleList) {
            roleIdList.add(role.getId());
        }
        return roleIdList;
    }

    public void setRoleIdList (List<String> roleIdList) {
        roleList = Lists.newArrayList();
        for (String roleId : roleIdList) {
            if (StringUtils.isNotBlank(roleId)) {
                Role role = new Role(roleId);
                roleList.add(role);
            }
        }
    }

}
