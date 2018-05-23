package com.ruoyi.project.system.merchant.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.JSON;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.deal.domain.SysDeal;
import com.ruoyi.project.system.merchant.domain.SysMerchant;
import com.ruoyi.project.system.merchant.service.SysMerchantService;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 商户表 前端控制器
 * </p>
 *
 * @author cd
 * @since 2018-05-18
 */
@Controller
@RequestMapping("/system/merchant")
public class SysMerchantController extends BaseController {
    private String prefix = "/system/merchant";
    @Autowired
    private SysMerchantService sysMerchantService;
    @Autowired
    private IUserService userService;

    @RequiresPermissions("system:merchant:view")
    @GetMapping()
    public String channel()
    {
        return prefix + "/merchant";
    }

    @RequiresPermissions("system:merchant:list")
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysMerchant merchant)
    {
//        setPageInfo(channel);
        List<SysMerchant> list = sysMerchantService.selectSysMerchantAll();
        return getDataTable(list);
    }

    /**
     *
     * 新增商户
     */
    @RequiresPermissions("system:merchant:add")
    @Log(title = "系统管理", action = "商户管理-新增商户")
    @GetMapping("/add")
    public String add(Model model)
    {
        List<User> userList = userService.selectUserAll();
        model.addAttribute("userList",userList);
        return prefix + "/add";
    }

    /**
     * 修改商户
     */
    @RequiresPermissions("system:merchant:edit")
    @Log(title = "系统管理", action = "商户管理-修改商户")
    @GetMapping("/edit/{merchantId}")
    public String edit(@PathVariable("merchantId") Long merchantId, Model model)
    {
        SysMerchant sysMerchant = sysMerchantService.selectSysMerchantById(merchantId);
        List<User> userList = userService.selectUserAll();
        model.addAttribute("userList",userList);
        model.addAttribute("sysMerchant", sysMerchant);
        return prefix + "/edit";
    }

    /**
     * 保存商户
     */
    @Log(title = "系统管理", action = "商户管理-保存商户")
    @PostMapping("/save")
    @ResponseBody
    public JSON save(SysMerchant sysMerchant)
    {
        System.out.println(sysMerchant+"+++++++++++++++++++++++++++++++++++++++++++++++");
        if (sysMerchantService.saveSysMerchant(sysMerchant) > 0)
        {
            return JSON.ok();
        }
        return JSON.error();
    }

    @RequiresPermissions("system:merchant:remove")
    @Log(title = "系统管理", action = "商户管理-删除商户")
    @RequestMapping("/remove/{merchantId}")
    @ResponseBody
    public JSON remove(@PathVariable("merchantId") Long merchantId)
    {
        SysMerchant sysMerchant= sysMerchantService.selectSysMerchantById(merchantId);
        if (sysMerchant == null)
        {
            return JSON.error("商户不存在");
        }
        if (sysMerchantService.deleteSysMerchantById(merchantId) > 0)
        {
            return JSON.ok();
        }
        return JSON.error();
    }

    @RequiresPermissions("system:role:batchRemove")
    @Log(title = "系统管理", action = "交易管理-批量删除")
    @PostMapping("/batchRemove")
    @ResponseBody
    public JSON batchRemove(@RequestParam("ids[]") Long[] ids)
    {
        int rows = sysMerchantService.batchDeleteSysMerchant(ids);
        if (rows > 0)
        {
            return JSON.ok();
        }
        return JSON.error();
    }

}
