package com.ruoyi.project.system.merchant.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.channel.dao.SysChannelDao;
import com.ruoyi.project.system.merchant.dao.SysMerchantDao;
import com.ruoyi.project.system.merchant.domain.SysMerchant;
import com.ruoyi.project.system.merchant.service.SysMerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 商户表 服务实现类
 * </p>
 *
 * @author cd
 * @since 2018-05-18
 */
@Service("sysMerchantService")
public class SysMerchantServiceImpl  implements SysMerchantService {
    @Autowired
    private SysMerchantDao sysMerchantDao;
    @Override
    public List<SysMerchant> selectSysMerchantAll() {
        return sysMerchantDao.selectSysMerchantAll();
    }

    @Override
    public SysMerchant selectSysMerchantById(Long sysMerchantId) {
        return sysMerchantDao.selectSysMerchantById(sysMerchantId);
    }

    @Override
    public int deleteSysMerchantById(Long sysMerchantId) {
        return sysMerchantDao.deleteSysMerchantById(sysMerchantId);
    }

    @Override
    public int batchDeleteSysMerchant(Long[] ids) {
        return sysMerchantDao.batchDeleteSysMerchant(ids);
    }

    @Override
    public int saveSysMerchant(SysMerchant sysMerchant) {
       Long sysMerchantId = sysMerchant.getMerchantId();
       if (StringUtils.isNotNull(sysMerchantId)){
           System.out.println("修改商户");
           sysMerchant.setUpdateBy(ShiroUtils.getUser().getUserName());
           sysMerchant.setUpdateTime(new Date());
           return sysMerchantDao.updateSysMerchant(sysMerchant);
       }
       else {
           System.out.println("新增商户");
           sysMerchant.setCreateBy(ShiroUtils.getUser().getUserName());
           sysMerchant.setCreateTime(new Date());
           return sysMerchantDao.insertSysMerchant(sysMerchant);
       }
    }

    /**
     * 通过商户名称查询
     *
     * @param merchantName 商户ID
     * @return 商户对象信息
     */
    public SysMerchant selectSysMerchantByName(String merchantName) {
        return sysMerchantDao.selectSysMerchantByName(merchantName);
    }

}
