package com.tanzhouedu.pm.service;

import com.tanzhouedu.pm.common.TreeService;
import com.tanzhouedu.pm.dao.mapper.OfficeMapper;
import com.tanzhouedu.pm.entity.Office;
import org.springframework.stereotype.Service;

/**
 * 机构信息服务类
 */
@Service
public class OfficeService extends TreeService <OfficeMapper, Office> {
}
