package com.tanzhouedu.pm.service;

import com.tanzhouedu.pm.common.BaseService;
import com.tanzhouedu.pm.dao.mapper.DictMapper;
import com.tanzhouedu.pm.entity.Dict;
import com.tanzhouedu.pm.utils.CacheUtil;
import com.tanzhouedu.pm.utils.DictUtils;
import com.tanzhouedu.pm.utils.UserUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 字典信息的服务类
 */

@Service
public class DictService extends BaseService <DictMapper, Dict> {

    /**
     * 查询所有字典类型
     * @param dict
     * @return
     */
    public List<String> queryTypeList (Dict dict) {
        return mapper.queryTypeList(dict);
    }

    @Override
    public boolean delete(Dict entity) {
        boolean res = super.delete(entity);
        CacheUtil.remove(DictUtils.DICT_CACHE_PREFIX + entity.getType());
        return res;
    }

    @Override
    public boolean save(Dict entity) {
        boolean res = super.save(entity);
        CacheUtil.remove(DictUtils.DICT_CACHE_PREFIX + entity.getType());
        return res;
    }
}
