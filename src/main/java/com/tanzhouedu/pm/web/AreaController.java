package com.tanzhouedu.pm.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
//import com.sun.media.jfxmedia.logging.Logger;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.Msg;
import com.tanzhouedu.pm.entity.Area;
import com.tanzhouedu.pm.service.AreaService;
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
 * 区域信息控制类
 */
@Controller
@RequestMapping(value = "/sys/area")
public class AreaController extends BaseController{

    @Resource
    private AreaService areaService;

    @ModelAttribute
    public Area get(@RequestParam (required = false) String id) {
        if (StringUtils.isBlank(id)) {
            return new Area();
        } else {
            return areaService.queryById(id);
        }
    }

    @RequiresPermissions("sys:area:view")
    @RequestMapping (value = {"/list", ""})
    public String queryList (Model model) {
        model.addAttribute("list", areaService.queryList(new Area()));
        return "sys/areaList";
    }

    @RequiresPermissions("sys:area:view")
    @RequestMapping (value = "/toEdit")
    public String toEdit (Area area, Model model) {
        if (area.getParent() == null || area.getParent().getId() == null) {
            area.setParent(new Area(Area.ROOT_ID));
        }
        if (! Area.ROOT_ID.equals(area.getParent().getId())) {
            area.setParent(areaService.queryById(area.getParent().getId()));
        }
        model.addAttribute("area", area);
        return "sys/areaEdit";
    }

    @RequiresPermissions("sys:area:edit")
    @RequestMapping (value = "/save")
    public String save (@Valid Area area, BindingResult br,
                        Model model, RedirectAttributes redirectAttributes) {

        if (br.hasErrors()) {
            return toEdit(area, model);
        }

        try {
            areaService.save(area);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "区域信息保存成功!"));
        } catch (Exception e) {
            logger.error("区域信息保存失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "区域信息保存失败!"));
        }
        return "redirect:/sys/area/list";

    }

    @RequiresPermissions("sys:area:edit")
    @RequestMapping (value = "/delete")
    public String delete (Area area, RedirectAttributes redirectAttributes) {
        try {
            areaService.delete(area);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "区域信息删除成功!"));
        } catch (Exception e) {
            logger.error("区域信息删除失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "区域信息删除失败!"));
        }
        return "redirect:/sys/area/list";
    }

    @RequiresPermissions("user")
    @RequestMapping (value = "/treeData")
    @ResponseBody
    public List<Map<String, Object>> treeData (@RequestParam (required = false)String extId) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<Area> areaList = areaService.queryList(new Area());
        for (Area area : areaList) {
            if ((StringUtils.isBlank(extId) ||
                    (StringUtils.isNotBlank(extId) && !area.getId().equals(extId)))) {
                Map <String, Object> map = Maps.newHashMap();
                map.put("id", area.getId());
                map.put("pId", area.getParentId());
                map.put("name", area.getName());

                mapList.add(map);
            }
        }
        return mapList;
    }
}
