package com.ruoyi.project.system.channel.service;

import com.ruoyi.project.system.channel.domain.SysChannel;

import java.util.List;

/**
 * <p>
 * 渠道表 服务类
 * </p>
 *
 * @author cd
 * @since 2018-05-16
 */
public interface SysChannelService  {
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
     * 通过渠道ID删除产品
     *
     * @param sysChannelId 渠道ID
     * @return 结果
     */
    public int deleteSysChannelById(Long sysChannelId);

    /**
     * 批量删除产品信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int batchDeleteSysChannel(Long[] ids);

    /**
     * 保存渠道信息
     *
     * @param sysChannel 渠道信息
     * @return 结果
     */
    public int saveProduct(SysChannel sysChannel);

    /**
     * 通过渠道名称查询
     *
     * @param channelName 渠道ID
     * @return 渠道对象信息
     */
    public SysChannel selectSysChannelByName(String channelName);

}
