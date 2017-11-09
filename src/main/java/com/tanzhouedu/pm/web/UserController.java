package com.tanzhouedu.pm.web;

import com.github.pagehelper.PageInfo;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.Msg;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.service.RoleService;
import com.tanzhouedu.pm.service.UserService;
import com.tanzhouedu.pm.utils.StringUtils;
import com.tanzhouedu.pm.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 用户信息的控制类
 */
@Controller
@RequestMapping ("/sys/user")
public class UserController extends BaseController{

    @Resource
    private UserService userService;

    @Resource
    private RoleService roleService;

    @ModelAttribute
    public User get (@RequestParam (required = false) String id){
        if (StringUtils.isBlank(id)) {
            return new User ();
        } else {
            return userService.queryById(id);
        }
    }

    /**
     * 加载个人信息
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping (value = "/info")
    public String getInfo (Model model) {
        User user = UserUtils.getCurrentUser();
        model.addAttribute("user", user);
        return "sys/userInfo";
    }

    /**
     * 保存个人信息
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping (value = "/saveInfo")
    public String saveUserInfo (@Valid User user, BindingResult br, Model model) {
        if (br.hasErrors()) {
            model.addAttribute("user", user);
            return "sys/userInfo";
        }

        String msgContent = "保存用户信息";
        Msg msg;

        try {
            userService.updateUserInfo(user);
            msg = new Msg(Msg.MsgType.success, msgContent + "成功");
        } catch (Exception e) {
            logger.error("保存用户信息失败!", e);
            msg = new Msg(Msg.MsgType.error, msgContent + "失败");
        }

        model.addAttribute("msg", msg);
        return "sys/userInfo";
    }

    /**
     * 加载修改密码页面
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping (value = "/changePwd")
    public String changePwd () {
        return "sys/changePwd";
    }

    /**
     * 修改密码后提交
     * @param oldPassword 原始密码
     * @param newPassword 新密码
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping (value = "/saveChangePwd")
    public String saveChangePwd (String oldPassword, String newPassword, Model model) {
        User user = UserUtils.getCurrentUser();

        //校验原密码是否有效
        boolean validOldPass = userService.validatePassword(oldPassword, user.getPassword());
        if (!validOldPass) {
            model.addAttribute("msg", new Msg(Msg.MsgType.error, "修改密码失败，原始密码错误!"));
        } else {
            try {
                User newUser = new User(user.getId(), user.getLoginName());
                newUser.setPassword(userService.enctypePassword(newPassword));
                userService.updateUserPasword(newUser);
                model.addAttribute("msg", new Msg(Msg.MsgType.success, "修改密码成功!"));
            } catch (Exception e) {
                logger.error("修改密码失败!" , e);
                model.addAttribute("msg", new Msg(Msg.MsgType.error, "修改密码失败!"));
            }
        }

        return "sys/changePwd";
    }


    /**
     * 进入用户管理主页
     * @return
     */
    @RequiresPermissions("sys:user:view")
    @RequestMapping (value = "/index")
    public String userIndex () {
        return "sys/userMgr";
    }

    /**
     * 加载用户信息列表
     * @param user 查询条件
     * @param model
     * @param pageParam 分页参数
     * @return
     */
    @RequiresPermissions("sys:user:view")
    @RequestMapping (value = {"list", ""})
    public String queryList (User user, Model model, PageParam pageParam) {
        PageInfo<User> pageInfo = userService.queryListWithPage(user, pageParam);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("orderBy", pageParam.getOrderBy());
        return "sys/userList";
    }

    @RequiresPermissions("sys:user:edit")
    @ResponseBody
    @RequestMapping (value = "/checkLoginName")
    public String checkLoginName (String oldLoginName, String loginName) {
        //如果没有修改loginName
        if (loginName != null && loginName.equals(oldLoginName)) {
            return "true";
        } else if (loginName != null && userService.queryUserByLoginName(loginName) == null) {
            return "true";
        }

        return "false";
    }


    @RequiresPermissions("sys:user:view")
    @RequestMapping (value = "/toEdit")
    public String toEdit (User user, Model model) {
        if (user.getCompany() == null || user.getCompany().getId() == null) {
            user.setCompany(UserUtils.getCurrentUser().getCompany());
        }

        if (user.getOffice() == null || user.getOffice().getId() == null) {
            user.setOffice(UserUtils.getCurrentUser().getOffice());
        }

        model.addAttribute("user", user);
        model.addAttribute("roleList", roleService.queryList(new Role()));
        return "sys/userEdit";
    }

    @RequiresPermissions("sys:user:edit")
    @RequestMapping (value = "/save")
    public String save (@Valid User user, BindingResult br, Model model,
                        RedirectAttributes redirectAttributes){

        if (br.hasErrors()) {
            return toEdit(user, model);
        }

        //判断是否要修改密码
        if (StringUtils.isNotBlank(user.getNewPassword())) {
            user.setPassword(userService.enctypePassword(user.getNewPassword()));
        }
        //检验登陆名是否存在
        if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))) {
            model.addAttribute("msg", new Msg(Msg.MsgType.error, "登录名已存在，请更换!"));
            return toEdit(user, model);
        }



        try {
            userService.save(user);
            redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.success, "保存用户信息成功!"));
        } catch (Exception e) {
            logger.error("保存用户信息失败!", e);
            model.addAttribute("msg", new Msg(Msg.MsgType.error, "保存用户信息失败!"));
            return toEdit(user, model);
        }

        return "redirect:/sys/user/list";
    }


    @RequiresPermissions("sys:user:edit")
    @RequestMapping (value = "/delete")
    public String delete (User user, RedirectAttributes redirectAttributes) {
        //用户不能删除自己
        if (UserUtils.getCurrentUser().getId().equals(user.getId())){
            redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.error, "不能删除当前登陆的用户!"));
        } else if ("1".equals(user.getId())) {
            redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.error, "不能删除系统超级管理用户!"));
        } else {
            try {
                userService.delete(user);
                redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.success, "删除用户成功!"));
            } catch (Exception e) {
                logger.error("删除用户失败!", e);
                redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.error, "删除用户失败!"));
            }
        }
        return "redirect:/sys/user/list";
    }
}
