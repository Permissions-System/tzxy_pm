package com.tanzhouedu.pm.dao.mapper;

import com.tanzhouedu.pm.common.BaseMapper;
import com.tanzhouedu.pm.entity.Dict;

import java.util.List;

/**
 * 字典信息的持久化操作接口
 */
public interface DictMapper extends BaseMapper <Dict> {

    List<String> queryTypeList (Dict dict);
}
