package com.ruoyi.project.yule;

import com.ruoyi.framework.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 * 娱乐 前端控制器
 * </p>
 *
 * @author cd
 * @since 2018-05-16
 */
@Controller
@RequestMapping("/yule")
public class YuleController2  {
    private String prefix = "yule";


    @RequestMapping("")
    public String feiji()
    {
        return prefix + "/feiji";
    }

        @RequestMapping("/pintu")
    public String pintu()
    {
        return prefix + "/pintu";
    }

    @RequestMapping("/zhizhu")
    public String zhizhu()
    {
        return prefix + "/zhizhu";
    }



}
