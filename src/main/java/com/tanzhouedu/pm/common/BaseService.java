package com.tanzhouedu.pm.common;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 所有服务类的超级父类
 */
public abstract class BaseService <D extends BaseMapper <T>, T extends BaseEntity> {

    @Autowired
    protected D mapper;

    /**
     * 根据ID查询一条数据
     * @param id
     * @return
     */
    public T queryById (String id){
        return mapper.queryById(id);
    }

    /**
     * 查询列表
     * @param entity
     * @return
     */
    public List<T> queryList (T entity) {
        return mapper.queryList(entity);
    }



    /**
     * 分页查询列表 pageHelper PageInfo 分页参数，起始页码 每一页的大小， 排序
     * @param entity
     * @param pageParam
     * @return
     */
    public PageInfo<T> queryListWithPage (T entity, PageParam pageParam) {
        //判断是否含有排序的字符串
        if (StringUtils.isNotBlank(pageParam.getOrderBy())) {
            PageHelper.orderBy(pageParam.getOrderBy());
        }
        PageHelper.startPage(pageParam.getPageNum(), pageParam.getPageSize());
        List<T> resultList = mapper.queryList(entity);
        return new PageInfo<T>(resultList);
    }

    /**
     * 保存数据 id为空时，执行新增，id不为空，修改
     * @param entity
     * @return
     */
    public boolean save (T entity) {
        //判断Id是否为空
        //"               "
        int res = 0;
        if (StringUtils.isBlank(entity.getId())) {
            entity.preInsert();
            res = mapper.insert(entity);
        } else {
            entity.preUpadate();
            res = mapper.update(entity);
        }
        return res > 0;
    }

    /**
     * 删除数据
     * @param entity
     * @return
     */
    public boolean delete (T entity) {
        int res = mapper.delete(entity);
        return res > 0;
    }


    /**
     * 数据范围过滤
     * @param user 当前用户对象，通过“UserUtils.getCurrentUser()”获取
     * @param officeAlias 机构表别名，多个用“,”逗号隔开。
     * @param userAlias 用户表别名，多个用“,”逗号隔开，传递空，忽略此参数
     * @return 标准连接条件对象
     */
    public static String dataScopeFilter(User user, String officeAlias, String userAlias) {

        StringBuilder sqlString = new StringBuilder();

        // 进行权限过滤，多个角色权限范围之间为或者关系。
        List<String> dataScope = Lists.newArrayList();

        // 超级管理员，跳过权限过滤
        if (!"1".equals(user.getId())){
            boolean isDataScopeAll = false;
            for (Role r : user.getRoleList()){
                for (String oa : StringUtils.split(officeAlias, ",")){
                    if (!dataScope.contains(r.getDataScope()) && StringUtils.isNotBlank(oa)){
                        if (Role.DATA_SCOPE_ALL.equals(r.getDataScope())){
                            isDataScopeAll = true;
                        }
                        else if (Role.DATA_SCOPE_COM_AND_CHILD.equals(r.getDataScope())){
                            sqlString.append(" OR " + oa + ".id = '" + user.getCompany().getId() + "'");
                            sqlString.append(" OR " + oa + ".parent_ids LIKE '" + user.getCompany().getParentIds() + user.getCompany().getId() + ",%'");
                        }
                        else if (Role.DATA_SCOPE_COMPANY.equals(r.getDataScope())){
                            sqlString.append(" OR " + oa + ".id = '" + user.getCompany().getId() + "'");
                            // 包括本公司下的部门 （type=1:公司；type=2：部门）
                            sqlString.append(" OR (" + oa + ".parent_id = '" + user.getCompany().getId() + "' AND " + oa + ".type = '1')");
                        }
                        else if (Role.DATA_SCOPE_OFFICE_AND_CHILD.equals(r.getDataScope())){
                            sqlString.append(" OR " + oa + ".id = '" + user.getOffice().getId() + "'");
                            sqlString.append(" OR " + oa + ".parent_ids LIKE '" + user.getOffice().getParentIds() + user.getOffice().getId() + ",%'");
                        }
                        else if (Role.DATA_SCOPE_OFFICE.equals(r.getDataScope())){
                            sqlString.append(" OR " + oa + ".id = '" + user.getOffice().getId() + "'");
                            sqlString.append(" OR (" + oa + ".parent_id = '" + user.getOffice().getId() + "' AND " + oa + ".type = '2')");
                        }
                        else if (Role.DATA_SCOPE_CUSTOM.equals(r.getDataScope())){

                            sqlString.append(" OR EXISTS (SELECT 1 FROM sys_role_office WHERE role_id = '" + r.getId() + "'");
                            sqlString.append(" AND office_id = " + oa +".id)");
                        }

                        dataScope.add(r.getDataScope());
                    }
                }
            }
            // 如果没有全部数据权限，并设置了用户别名，则当前权限为本人；如果未设置别名，当前无权限为已植入权限
            if (!isDataScopeAll){
                if (StringUtils.isNotBlank(userAlias)){
                    for (String ua : StringUtils.split(userAlias, ",")){
                        sqlString.append(" OR " + ua + ".id = '" + user.getId() + "'");
                    }
                }else {
                    for (String oa : StringUtils.split(officeAlias, ",")){
                        //sqlString.append(" OR " + oa + ".id  = " + user.getOffice().getId());
                        sqlString.append(" OR " + oa + ".id IS NULL");
                    }
                }
            }else{
                // 如果包含全部权限，则去掉之前添加的所有条件，并跳出循环。
                sqlString = new StringBuilder();
            }
        }
        if (StringUtils.isNotBlank(sqlString.toString())){
            return " AND (" + sqlString.substring(4) + ")";
        }
        return "";
    }
}



