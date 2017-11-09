package com.tanzhouedu.pm.web;

import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.security.FormAuthFilter;
import com.tanzhouedu.pm.security.Principal;
import com.tanzhouedu.pm.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 登陆控制器
 *
 */
@Controller
public class LoginController extends BaseController{

    @RequestMapping (value = "/login", method = RequestMethod.GET)
     public String toLogin () {
        return "sys/login";
    }


    @RequestMapping (value = "/login", method = RequestMethod.POST)
    public String doLogin(HttpServletRequest request, Model model) {

        //判断用户是否已经登陆
        Principal principal = UserUtils.getPrincipal();
        if (principal != null) {
            return "redirect:/index";
        }

        String username = WebUtils.getCleanParam(request, FormAuthFilter.DEFAULT_USERNAME_PARAM);
        boolean remenberMe = WebUtils.isTrue(request, FormAuthFilter.DEFAULT_REMEMBER_ME_PARAM);
        String exception = (String)request.getAttribute(FormAuthFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String) request.getAttribute(FormAuthFilter.MESSAGE_PARAM);


        model.addAttribute(FormAuthFilter.DEFAULT_USERNAME_PARAM, username);
        model.addAttribute(FormAuthFilter.DEFAULT_REMEMBER_ME_PARAM, remenberMe);
        model.addAttribute(FormAuthFilter.MESSAGE_PARAM, message);
        model.addAttribute(FormAuthFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);

        return "sys/login";
    }

    @RequiresPermissions("user")
    @RequestMapping ("/index")
    public String index () {
        return "sys/index";
    }
}
