package com.tanzhouedu.pm.web;

import com.tanzhouedu.pm.common.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2015/8/1.
 */
@Controller
@RequestMapping (value = "/tag")
public class TagController extends BaseController{

    @RequiresPermissions("user")
    @RequestMapping (value = "/treeSelect")
    public String treeSelect (@ModelAttribute("url") String url,
                              @ModelAttribute("checked") String checked,
                              @ModelAttribute("extId") String extId,
                              @ModelAttribute("selectIds") String selectIds) {
        return "sys/tagTreeselect";
    }

    @RequiresPermissions("user")
    @RequestMapping (value = "/iconSelect")
    public String iconSelect (@ModelAttribute ("value") String value){
        return "sys/tagIconselect";
    }


}
