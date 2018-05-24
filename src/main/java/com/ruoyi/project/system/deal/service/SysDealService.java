package com.ruoyi.project.system.deal.service;


import com.ruoyi.project.system.deal.domain.SysDeal;

import java.util.List;

/**
 * <p>
 * 交易表 服务类
 * </p>
 *
 * @author cd
 * @since 2018-05-17
 */
public interface SysDealService {
    /**
     * 查询交易列表
     *
     * @return 交易列表
     */
    public List<SysDeal> selectSysDealAll();

    /**
     * 根据查询
     * @param sysDeal
     * @return
     */
    public List<SysDeal> selectDealList(SysDeal sysDeal);

    /**
     * 通过交易ID查询
     *
     * @param sysDealId 交易ID
     * @return 交易对象信息
     */
    public SysDeal selectSysDealById(Long sysDealId);

    /**
     * 通过交易ID删除交易
     *
     * @param sysDealId 交易ID
     * @return 结果
     */
    public int deleteSysDealById(Long sysDealId);

    /**
     * 批量删除交易信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int batchDeleteSysDeal(Long[] ids);

    /**
     * 保存交易信息
     *
     * @param sysDeal 交易信息
     * @return 结果
     */
    public int saveSysDeal(SysDeal sysDeal);
    }


