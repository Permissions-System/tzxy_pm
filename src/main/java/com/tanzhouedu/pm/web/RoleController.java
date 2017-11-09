package com.tanzhouedu.pm.web;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.Msg;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.entity.Office;
import com.tanzhouedu.pm.entity.Role;
import com.tanzhouedu.pm.entity.User;
import com.tanzhouedu.pm.service.MenuSerice;
import com.tanzhouedu.pm.service.OfficeService;
import com.tanzhouedu.pm.service.RoleService;
import com.tanzhouedu.pm.service.UserService;
import com.tanzhouedu.pm.utils.CollectionUtil;
import com.tanzhouedu.pm.utils.Config;
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
import java.util.Map;

/**
 * 角色管理控制类
 */

@Controller
@RequestMapping (value = "/sys/role")
public class RoleController  extends BaseController{

    @Resource
    private RoleService roleService;

    @Resource
    private MenuSerice menuSerice;

    @Resource
    private OfficeService officeService;

    @Resource
    private UserService userService;

    @ModelAttribute
    public Role get (@RequestParam (required = false) String id) {
        if (StringUtils.isBlank(id)) {
            return new Role();

        } else {
            return roleService.queryById(id);
        }

    }

    @RequiresPermissions("sys:role:view")
    @RequestMapping (value = {"list", ""})
    public String queryList (PageParam pageParam, Model model) {
        PageInfo <Role> pageInfo = roleService.queryListWithPage(new Role(), pageParam);
        model.addAttribute("pageInfo", pageInfo);
        return "sys/roleList";
    }

    @RequiresPermissions("sys:role:view")
    @RequestMapping (value = "/toEdit")
    public String toEdit (Role role, Model model) {
        model.addAttribute("role", role);
        model.addAttribute("menuList", menuSerice.queryList(new Menu()));
        model.addAttribute("officeList", officeService.queryList(new Office()));
        return "sys/roleEdit";
    }

    @RequiresPermissions("sys:role:edit")
    @RequestMapping (value = "/save")
    public String save (@Valid Role role, BindingResult br,
                        Model model, RedirectAttributes redirectAttributes) {

        //如果当前登陆的用户不是系统管理员，并且当前操作的角色是系统数据
        if (!"1".equals(UserUtils.getCurrentUser().getId())
             && Config.YES.equals(role.getIsSys()) ) {
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "对不起，只有超级管理员才能修改！"));
            return "redirect:/sys/role/list";
        }

        if (br.hasErrors()) {
            return toEdit(role, model);
        }

        try {
            roleService.save(role);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "角色信息保存成功!"));
        } catch (Exception e) {
            logger.error("角色信息保存失败！", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "角色信息保存失败！"));
        }

        return "redirect:/sys/role/list";
    }

    @RequiresPermissions("sys:role:edit")
    @RequestMapping (value = "/delete")
    public String delete (Role role, RedirectAttributes redirectAttributes) {
        if (!"1".equals(UserUtils.getCurrentUser().getId())
                && Config.YES.equals(role.getIsSys()) ) {
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "对不起，只有超级管理员才能删除！"));
            return "redirect:/sys/role/list";
        }

        try {
            roleService.delete(role);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "角色信息删除成功!"));
        } catch (Exception e) {
            logger.error("角色信息删除失败！", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "角色信息删除失败！"));
        }

        return "redirect:/sys/role/list";
    }

    @RequiresPermissions("user")
    @RequestMapping (value = "/checkName")
    @ResponseBody
    public String checkName (String oldName, String name) {
        if (name != null && name.equals(oldName)) {
            return "true";
        } else if (name != null && roleService.queryRoleByName(name) == null) {
            return "true";
        }

        return "false";
    }

    @RequiresPermissions("sys:role:edit")
    @RequestMapping (value = "/toRoleAssign")
    public String toRoleAssign (Role role, Model model) {
        List<User> userList = userService.queryListByRoleId(role.getId());
        model.addAttribute("userList", userList);
        model.addAttribute("role", role);
        return "sys/roleAssign";

    }


    @RequiresPermissions("sys:role:edit")
    @RequestMapping (value = "/userToRole")
    public String userToRole (Role role, Model model) {
        List<User> userList = userService.queryListByRoleId(role.getId());
        model.addAttribute("userList", userList);
        model.addAttribute("role", role);
        model.addAttribute("officeList", officeService.queryList(new Office()));
        model.addAttribute("selectUserIds", CollectionUtil.extractToString(userList, "id", ","));
        return "sys/selectUserToRole";
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping (value = "/queryOfficeUsers")
    public List<Map<String, Object>> queryOfficeUsers (String officeId){
        List<Map<String, Object>> userMapList = Lists.newArrayList();

        User user = new User();
        user.setOffice(new Office(officeId));
        List<User> userList = userService.queryList(user);

        for (User u : userList) {
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", u.getId());
            map.put("pId", 0);
            map.put("name", u.getName());

            userMapList.add(map);
        }
        return userMapList;
    }

    @RequiresPermissions("sys:role:edit")
    @RequestMapping (value = "/assignUser")
    public String assignUser (Role role, String [] idsArr, RedirectAttributes redirectAttributes) {
        try {
            if (idsArr != null && idsArr.length > 0) {
                for (String id : idsArr) {
                    User user = userService.queryById(id);
                    if (user != null && role != null) {
                        user = roleService.assignUserToRole(role, user);
                        if (user != null) {
                            userService.saveUserRole(user, true);
                        }
                    }
                }

            }
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "角色分配成功!"));

        } catch (Exception e) {
            logger.error("角色分配失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "角色分配失败!"));
        }

        return "redirect:/sys/role/toRoleAssign?id="+role.getId();
    }

    @RequiresPermissions("sys:role:edit")
    @RequestMapping (value = "/outUserFromRole")
    public String outUserFromRole (Role role, String userId,
                                   RedirectAttributes redirectAttributes) {
        User user = userService.queryById(userId);

        if (UserUtils.getCurrentUser().getId().equals(userId)) {
            redirectAttributes.addFlashAttribute ("msg",
                    new Msg(Msg.MsgType.error,"无法从角色中移除用户自己!"));
        } else {
            if (user.getRoleList().size() <= 1) {
                redirectAttributes.addFlashAttribute ("msg",
                        new Msg(Msg.MsgType.error,"不能移除用户的最后一个角色!"));
            } else {
                try {
                    user = roleService.outUserFromRole(role, user);
                    userService.saveUserRole(user, true);
                    redirectAttributes.addFlashAttribute("msg",
                            new Msg(Msg.MsgType.success, "移除用户成功!"));
                } catch (Exception e) {
                    logger.error("移除用户失败!", e);
                    redirectAttributes.addFlashAttribute("msg",
                            new Msg(Msg.MsgType.success, "移除用户失败!"));
                }
            }
        }

        return "redirect:/sys/role/toRoleAssign?id="+role.getId();
    }
}
