package com.tanzhouedu.pm.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.Msg;
import com.tanzhouedu.pm.entity.Office;
import com.tanzhouedu.pm.service.OfficeService;
import com.tanzhouedu.pm.utils.Config;
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
 * 机构信息控制类
 */
@Controller
@RequestMapping (value = "/sys/office")
public class OfficeController extends BaseController {

    @Resource
    private OfficeService officeService;

    @ModelAttribute
    public Office get (@RequestParam (required = false) String id) {
        if (StringUtils.isBlank(id)) {
            return new Office();
        } else {
            return officeService.queryById(id);
        }
    }

    @RequiresPermissions("sys:office:view")
    @RequestMapping (value = "")
    public String index () {
        return "sys/officeMgr";
    }

    @RequiresPermissions("sys:office:view")
    @RequestMapping (value = "/list")
    public String queryList (Office office, Model model) {
        model.addAttribute("list", officeService.queryList(office));
        return "sys/officeList";
    }

    @RequiresPermissions("sys:office:view")
    @RequestMapping (value = "/toEdit")
    public String toEdit (Office office, Model model) {
        model.addAttribute("office", office);
        return "sys/officeEdit";
    }

    @RequiresPermissions("sys:office:edit")
    @RequestMapping (value = "/save")
    public String save (@Valid Office office,BindingResult br,
                        Model model, RedirectAttributes redirectAttributes) {
        if (br.hasErrors()) {
            return toEdit(office, model);
        }

        try {
            officeService.save(office);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "机构信息保存成功!"));
        } catch (Exception e) {
            logger.error("机构信息保存失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "机构信息保存失败!"));
        }
        return "redirect:/sys/office/list";
    }

    @RequiresPermissions("sys:office:edit")
    @RequestMapping (value = "/delete")
    public String delete (Office office, RedirectAttributes redirectAttributes) {
        try {
            officeService.delete(office);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.success, "机构信息删除成功!"));
        } catch (Exception e) {
            logger.error("机构信息删除失败!", e);
            redirectAttributes.addFlashAttribute("msg",
                    new Msg(Msg.MsgType.error, "机构信息删除失败!"));
        }
        return "redirect:/sys/office/list";
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping (value = "/treeData")
    public List<Map<String, Object>> treeData (@RequestParam (required = false) String type,
                                               @RequestParam (required = false) String extId) {

        List<Office> officeList = officeService.queryList(new Office());
        List<Map<String, Object>> returnList = Lists.newArrayList();
        for (int i = 0; i < officeList.size(); i++) {

            Office office = officeList.get(i);
            if ((StringUtils.isBlank(extId) || (StringUtils.isNotBlank(extId) && !office.getId().equals(extId)
                    && office.getParentIds().indexOf("," + extId + ",") == -1))
                && (StringUtils.isBlank(type) || (StringUtils.isNotBlank(type) &&
                    (office.TYPE_COMPANY.equals(type) ? type.equals(office.getType()) : true)))
                && Config.YES.equals(office.getUseable())) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", office.getId());
                map.put("pId", office.getParentId());
                map.put("pIds", office.getParentIds());
                map.put("name", office.getName());
                returnList.add(map);
            }
        }
        return returnList;
    }
}
