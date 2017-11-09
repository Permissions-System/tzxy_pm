package com.tanzhouedu.pm.web;

import com.github.pagehelper.PageInfo;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.entity.Log;
import com.tanzhouedu.pm.service.LogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 日志信息控制器
 */
@Controller
@RequestMapping (value = "/sys/log")
public class LogController extends BaseController {

    @Resource
    private LogService logService;

    @RequiresPermissions("sys:log:view")
    @RequestMapping (value = {"/list", ""})
    public String queryList (@ModelAttribute Log log, Model model, PageParam pageParam) {
        PageInfo <Log> pageInfo = logService
                .queryListWithPage(log, pageParam);
        model.addAttribute("pageInfo", pageInfo);
        return "sys/logList";

    }

}
