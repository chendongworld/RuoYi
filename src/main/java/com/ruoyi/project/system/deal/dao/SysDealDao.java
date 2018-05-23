package com.ruoyi.project.system.deal.dao;

import com.ruoyi.project.system.deal.domain.SysDeal;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
  * 交易表 Mapper 接口
 * </p>
 *
 * @author cd
 * @since 2018-05-17
 */
@Mapper
public interface SysDealDao {
    /**
     * 查询交易列表
     *
     * @return 交易列表
     */
    public List<SysDeal> selectSysDealAll();

    /**
     * 根据条件查询
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
     * 修改交易信息
     *
     * @param sysDeal 交易信息
     * @return 结果
     */
    public int updateSysDeal(SysDeal sysDeal);

    /**
     * 新增交易信息
     *
     * @param sysDeal 交易信息
     * @return 结果
     */
    public int insertSysDeal(SysDeal sysDeal);

}