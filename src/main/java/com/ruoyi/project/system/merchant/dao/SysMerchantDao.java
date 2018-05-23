package com.ruoyi.project.system.merchant.dao;

import com.ruoyi.project.system.merchant.domain.SysMerchant;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
  * 商户表 Mapper 接口
 * </p>
 *
 * @author cd
 * @since 2018-05-18
 */
@Mapper
public interface SysMerchantDao  {
    /**
     * 查询商户列表
     *
     * @return 商户列表
     */
    public List<SysMerchant> selectSysMerchantAll();

    /**
     * 通过商户ID查询
     *
     * @param sysMerchantId 商户ID
     * @return 商户对象信息
     */
    public SysMerchant selectSysMerchantById(Long sysMerchantId);
    /**
     * 通过商户名称查询
     *
     * @param merchantName 商户ID
     * @return 商户对象信息
     */
    public SysMerchant selectSysMerchantByName(String merchantName);

    /**
     * 通过商户ID删除商户
     *
     * @param sysMerchantId 商户ID
     * @return 结果
     */
    public int deleteSysMerchantById(Long sysMerchantId);

    /**
     * 批量删除商户信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int batchDeleteSysMerchant(Long[] ids);

    /**
     * 修改商户信息
     *
     * @param sysMerchant 商户信息
     * @return 结果
     */
    public int updateSysMerchant(SysMerchant sysMerchant);

    /**
     * 新增商户信息
     *
     * @param sysMerchant 商户信息
     * @return 结果
     */
    public int insertSysMerchant(SysMerchant sysMerchant);

}