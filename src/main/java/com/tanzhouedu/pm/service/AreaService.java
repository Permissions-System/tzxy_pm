package com.tanzhouedu.pm.service;

import com.tanzhouedu.pm.common.TreeMapper;
import com.tanzhouedu.pm.common.TreeService;
import com.tanzhouedu.pm.entity.Area;
import org.springframework.stereotype.Service;

/**
 * 区域信息服务类
 */
@Service
public class AreaService extends TreeService <TreeMapper<Area>, Area>{
}
