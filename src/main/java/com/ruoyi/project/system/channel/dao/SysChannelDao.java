package com.ruoyi.project.system.channel.dao;


import com.ruoyi.project.system.channel.domain.SysChannel;
import com.ruoyi.project.system.product.domain.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
  * 渠道表 Mapper 接口
 * </p>
 *
 * @author cd
 * @since 2018-05-16
 */
@Mapper
public interface SysChannelDao  {
    /**
     * 查询渠道列表
     *
     * @return 渠道列表
     */
    public List<SysChannel> selectSysChannelAll();

    /**
     * 通过渠道ID查询
     *
     * @param sysChannelId 渠道ID
     * @return 渠道对象信息
     */
    public SysChannel selectSysChannelById(Long sysChannelId);
    /**
     * 通过渠道名称查询
     *
     * @param channelName 渠道ID
     * @return 渠道对象信息
     */
    public SysChannel selectSysChannelByName(String channelName);

    /**
     * 通过渠道ID删除渠道
     *
     * @param sysChannelId 渠道ID
     * @return 结果
     */
    public int deleteSysChannelById(Long sysChannelId);

    /**
     * 批量删除渠道信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int batchDeleteSysChannel(Long[] ids);

    /**
     * 修改渠道信息
     *
     * @param sysChannel 渠道信息
     * @return 结果
     */
    public int updateSysChannel(SysChannel sysChannel);

    /**
     * 新增渠道信息
     *
     * @param sysChannel 产品信息
     * @return 结果
     */
    public int insertSysChannel(SysChannel sysChannel);

}