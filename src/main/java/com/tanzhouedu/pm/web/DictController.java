package com.tanzhouedu.pm.web;

import com.github.pagehelper.PageInfo;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.Msg;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.entity.Dict;
import com.tanzhouedu.pm.service.DictService;
import com.tanzhouedu.pm.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 字典信息的控制器
 * byType byName
 */
@Controller
@RequestMapping ("/sys/dict")
public class DictController extends BaseController {

    @Resource
    private DictService dictService;

    /**
     * 在当前这个controller的每个方法执行之前执行
     *
     * @param id
     * @return
     */
    @ModelAttribute
    public Dict get(@RequestParam(required = false) String id) {
        if (StringUtils.isBlank(id)){
            return new Dict();
        } else {
            return dictService.queryById(id);
        }
    }

    @RequiresPermissions("sys:dict:view")
    @RequestMapping (value = {"list", ""})
    public String queryList (Dict dict, Model model, PageParam pageParam) {

        List<String> typeList = dictService.queryTypeList(dict);
        model.addAttribute("typeList", typeList);

        PageInfo<Dict> pageInfo = dictService.queryListWithPage(dict, pageParam);
        model.addAttribute("pageInfo", pageInfo);
        return "sys/dictList";

    }

    @RequiresPermissions("sys:dict:view")
    @RequestMapping ("/toEdit")
    public String toEdit (Dict dict, Model model) {
        model.addAttribute("dict", dict);
        return "sys/dictEdit";
    }

    @RequiresPermissions("sys:dict:edit")
    @RequestMapping ("/save")
    public String save (@Valid Dict dict, BindingResult result,
                        Model model, RedirectAttributes redirectAttributes){
        if (result.hasErrors()) {
            return toEdit (dict, model);
        }

        String msgContent = "保存字典["+dict.getLabel()+"]";
        Msg msg;

        try {
            dictService.save(dict);
            msg = new Msg(Msg.MsgType.success, msgContent + "成功");
        } catch (Exception e) {
            logger.error("保存字典信息失败!", e);
            msg = new Msg(Msg.MsgType.error, msgContent + "失败");
        }
        redirectAttributes.addFlashAttribute("msg", msg);
        return "redirect:/sys/dict/list?type="+dict.getType();
    }


    @RequiresPermissions("sys:dict:edit")
    @RequestMapping ("/delete")
    public String delete (@RequestParam String id,
                          @RequestParam String type,
                          @RequestParam String label,
                          RedirectAttributes redirectAttributes) {
        Dict dict = new Dict(id);
        dict.setType(type);
        String msgContent = "删除字典["+label+"]";
        Msg msg;

        try {
            dictService.delete(dict);
            msg = new Msg(Msg.MsgType.success, msgContent + "成功");
        } catch (Exception e) {
            logger.error("删除字典信息失败!", e);
            msg = new Msg(Msg.MsgType.error, msgContent + "失败");
        }
        redirectAttributes.addFlashAttribute("msg", msg);
        return "redirect:/sys/dict/list?type="+type;
    }


}
