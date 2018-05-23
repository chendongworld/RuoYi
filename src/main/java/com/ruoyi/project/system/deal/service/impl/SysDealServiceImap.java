package com.ruoyi.project.system.deal.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.channel.dao.SysChannelDao;
import com.ruoyi.project.system.channel.domain.SysChannel;
import com.ruoyi.project.system.channel.service.SysChannelService;
import com.ruoyi.project.system.deal.dao.SysDealDao;
import com.ruoyi.project.system.deal.domain.SysDeal;
import com.ruoyi.project.system.deal.service.SysDealService;

import com.ruoyi.project.system.merchant.domain.SysMerchant;
import com.ruoyi.project.system.merchant.service.SysMerchantService;
import com.ruoyi.project.system.product.domain.Product;
import com.ruoyi.project.system.product.service.IProductService;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 交易表 服务实现类
 * </p>
 *
 * @author cd
 * @since 2018-05-17
 */
@Service("sysDealService")
public class SysDealServiceImap implements SysDealService {
    @Autowired
    private SysDealDao sysDealDao;
    @Autowired
    private SysMerchantService merchantService;
    @Autowired
    private IProductService productService;

    @Override
    public List<SysDeal> selectSysDealAll() {
        return sysDealDao.selectSysDealAll();
    }

    @Override
    public SysDeal selectSysDealById(Long sysDealId) {
        return sysDealDao.selectSysDealById(sysDealId);
    }

    @Override
    public int deleteSysDealById(Long sysDealId) {
        return sysDealDao.deleteSysDealById(sysDealId);
    }

    @Override
    public int batchDeleteSysDeal(Long[] ids) {
        return sysDealDao.batchDeleteSysDeal(ids);
    }

    @Override
    public int saveSysDeal(SysDeal sysDeal) {
        Long sysDealId =sysDeal.getDealId();
//        SysChannel sysChannel = channelService.selectSysChannelByName(sysDeal.getChannelName());
//        System.out.println("----------------------------------------------------"+sysChannel);
        SysMerchant sysMerchant = merchantService.selectSysMerchantByName(sysDeal.getMerchantName());
        System.out.println("----------------------------------------------------"+sysMerchant);
        Product product = productService.selectProductByName(sysDeal.getProductName());
        BigDecimal merchantRate =sysMerchant.getMerchantRate();//商户费率
        BigDecimal royaltyRate = sysMerchant.getRoyaltyRate();//业务提成
//        BigDecimal channelCost =sysChannel.getChannelCost();//渠道成本
        BigDecimal channelCost =product.getChannelCost();//渠道成本

        //利润=(商户费率-渠道成本)/100*金额
        BigDecimal sumProfit =(merchantRate.subtract(channelCost)).divide(new BigDecimal(100)).multiply(sysDeal.getSumMoney());
        System.out.println(sumProfit+"+++++++++++++++++++++++++++++++++++++");
        BigDecimal userProfit =sumProfit.multiply(royaltyRate).divide(new BigDecimal(100));
        System.out.println(userProfit+"++++++++++++++++++++++++++++++++++");
        sysDeal.setSumProfit(sumProfit);
        sysDeal.setUserProfit(userProfit);
        System.out.println(sysDeal+"----------------------------------");
        if (StringUtils.isNotNull(sysDealId))
        {
            System.out.println("修改交易");
            sysDeal.setUpdateBy(ShiroUtils.getUser().getUserName());
            sysDeal.setUpdateTime(new Date());
            // 修改产品信息
            return sysDealDao.updateSysDeal(sysDeal);
        }
        else
        {
            System.out.println("新增交易");
            sysDeal.setCreateTime(new Date());
            sysDeal.setCreateBy(ShiroUtils.getUser().getUserName());
            // 新增产品信息
            return sysDealDao.insertSysDeal(sysDeal);
        }
    }


}
