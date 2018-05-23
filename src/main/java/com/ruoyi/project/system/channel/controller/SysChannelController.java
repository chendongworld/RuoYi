package com.ruoyi.project.system.channel.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.JSON;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.channel.domain.SysChannel;
import com.ruoyi.project.system.channel.service.SysChannelService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 渠道表 前端控制器
 * </p>
 *
 * @author cd
 * @since 2018-05-16
 */
@Controller
@RequestMapping("/system/channel")
public class SysChannelController  extends BaseController {
    private String prefix = "system/channel";

    @Autowired
    private SysChannelService sysChannelService;

    @RequiresPermissions("system:channel:view")
    @GetMapping()
    public String channel()
    {
        return prefix + "/channel";
    }

    @RequiresPermissions("system:channel:list")
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysChannel channel)
    {
//        setPageInfo(channel);
        List<SysChannel> list = sysChannelService.selectSysChannelAll();
        System.out.println(list);
        return getDataTable(list);
    }

    /**
     *
     * 新增角色
     */
    @RequiresPermissions("system:channel:add")
    @Log(title = "系统管理", action = "产品管理-新增渠道")
    @GetMapping("/add")
    public String add(Model model)
    {
        return prefix + "/add";
    }

    /**
     * 修改角色
     */
    @RequiresPermissions("system:channel:edit")
    @Log(title = "系统管理", action = "产品管理-修改渠道")
    @GetMapping("/edit/{channelId}")
    public String edit(@PathVariable("channelId") Long channelId, Model model)
    {
        SysChannel channel = sysChannelService.selectSysChannelById(channelId);
        System.out.println("查询成功:"+channel);
        model.addAttribute("channel", channel);
        return prefix + "/edit";
    }

    /**
     * 保存角色
     */
    @Log(title = "系统管理", action = "产品管理-保存渠道")
    @PostMapping("/save")
    @ResponseBody
    public JSON save(SysChannel channel)
    {
        System.out.println("channel:"+channel);
        if (sysChannelService.saveProduct(channel) > 0)
        {
            return JSON.ok();
        }
        return JSON.error();
    }

    @RequiresPermissions("system:channel:remove")
    @Log(title = "系统管理", action = "产品管理-删除渠道")
    @RequestMapping("/remove/{id}")
    @ResponseBody
    public JSON remove(@PathVariable("id") Long id)
    {
        SysChannel channel = sysChannelService.selectSysChannelById( id);
        if (channel == null)
        {

            return JSON.error("渠道不存在");
        }
        if (sysChannelService.deleteSysChannelById(id) > 0)
        {
            return JSON.ok();
        }
        return JSON.error();
    }

    @RequiresPermissions("system:role:batchRemove")
    @Log(title = "系统管理", action = "产品管理-批量删除")
    @PostMapping("/batchRemove")
    @ResponseBody
    public JSON batchRemove(@RequestParam("ids[]") Long[] ids)
    {
        int rows = sysChannelService.batchDeleteSysChannel(ids);
        if (rows > 0)
        {
            return JSON.ok();
        }
        return JSON.error();
    }

}
