package com.tanzhouedu.pm.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.Msg;
import com.tanzhouedu.pm.entity.Menu;
import com.tanzhouedu.pm.service.MenuSerice;
import com.tanzhouedu.pm.utils.MenuUtils;
import com.tanzhouedu.pm.utils.StringUtils;
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
 * 菜单信息的控制类
 */
@Controller
@RequestMapping (value = "/sys/menu")
public class MenuController extends BaseController {
    @Resource
    private MenuSerice menuSerice;

    @ModelAttribute
    public Menu get (@RequestParam (required = false) String id) {
        if (StringUtils.isBlank(id)) {
            return new Menu();
        } else {
            return menuSerice.queryById(id);
        }
    }

    @RequiresPermissions("user")
    @RequestMapping (value = "/menuNavi")
    public String menuNavi () {
        return "sys/menuNavi";
    }

    @RequiresPermissions("sys:menu:view")
    @RequestMapping (value = {"/list", ""})
    public String queryList (Model model) {
        List<Menu> newList = Lists.newArrayList();
        List<Menu> menuList = menuSerice.queryList(new Menu());
        MenuUtils.sortMenuList(newList, menuList, Menu.ROOT_ID, true);

        model.addAttribute("list", newList);
        return "sys/menuList";
    }

    @RequiresPermissions("sys:menu:edit")
    @RequestMapping (value = "/updateSort")
    public String updateSort (String[] ids, Integer[] sorts,
                              RedirectAttributes redirectAttributes) {
        try {
            for (int i = 0; i < ids.length; i++) {
                Menu menu = new Menu(ids[i]);
                menu.setSort(sorts[i]);
                menuSerice.updateSort(menu);
            }
            redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.success, "更新菜单排序成功!"));
        } catch (Exception e) {
            logger.error("更新菜单排序失败!", e);
            redirectAttributes.addFlashAttribute("msg", new Msg(Msg.MsgType.error, "更新菜单排序失败!"));
        }
        return "redirect:/sys/menu/list";
    }

    @RequiresPermissions("sys:menu:view")
    @RequestMapping (value = "/toEdit")
    public String toEdit (Menu menu, Model model) {
        if (menu.getParent() == null || menu.getParent().getId() == null) {
            menu.setParent(new Menu(Menu.ROOT_ID));
        }

        menu.setParent(menuSerice.queryById(menu.getParent().getId()));

        model.addAttribute("menu", menu);
        return "sys/menuEdit";
    }

    @RequiresPermissions("sys:menu:edit")
    @RequestMapping (value = "/save")
    public String save (@Valid Menu menu, BindingResult br,
                        Model model,RedirectAttributes redirectAttributes){

        if (br.hasErrors()) {
            return toEdit(menu, model);
        }
        try {
            menuSerice.save(menu);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "菜单信息保存成功!"));
        } catch (Exception e) {
            logger.error("菜单信息保存失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "菜单信息保存失败!"));
        }
        return "redirect:/sys/menu/list";
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping (value = "/treeData")
    public List<Map<String, Object>> treeData (
            @RequestParam (required = false) String extId) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<Menu> menuList = menuSerice.queryList(new Menu());
        for (Menu menu : menuList) {
            if ((StringUtils.isBlank(extId) ||
                    (StringUtils.isNotBlank(extId) && !menu.getId().equals(extId)))) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", menu.getId());
                map.put("pId", menu.getParentId());
                map.put("pIds", menu.getParentIds());
                map.put("name", menu.getName());
                mapList.add(map);
            }
        }
        return mapList;
    }

    @RequiresPermissions("sys:menu:edit")
    @RequestMapping (value = "/delete")
    public String delete (Menu menu, RedirectAttributes redirectAttributes) {
        try {
            menuSerice.delete(menu);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "菜单信息删除成功!"));
        } catch (Exception e) {
            logger.error("菜单信息删除失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "菜单信息删除失败!"));
        }
        return "redirect:/sys/menu/list";
    }


}
