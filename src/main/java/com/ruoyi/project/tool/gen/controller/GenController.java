package com.ruoyi.project.tool.gen.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.tool.gen.domain.TableInfo;
import com.ruoyi.project.tool.gen.service.IGenService;

/**
 * 代码生成 操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/tool/gen")
public class GenController extends BaseController
{
    private String prefix = "tool/gen";

    @Autowired
    private IGenService genService;

    @GetMapping()
    public String gen()
    {
        return prefix + "/gen";
    }

    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(TableInfo tableInfo)
    {
        setPageInfo(tableInfo);
        List<TableInfo> list = genService.selectTableList(tableInfo);
        return getDataTable(list);
    }
}
