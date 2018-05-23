package com.ruoyi.project.system.channel.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.channel.dao.SysChannelDao;
import com.ruoyi.project.system.channel.domain.SysChannel;
import com.ruoyi.project.system.channel.service.SysChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 渠道表 服务实现类
 * </p>
 *
 * @author cd
 * @since 2018-05-16
 */
@Service("sysChannelService")
public class SysChannelServiceImpl implements SysChannelService {
    @Autowired
    private SysChannelDao sysChannelDao;
    /**
     * 查询渠道列表
     *
     * @return 渠道列表
     */
    @Override
    public List<SysChannel> selectSysChannelAll() {

        return sysChannelDao.selectSysChannelAll();
    }
    /**
     * 通过渠道ID查询
     *
     * @param sysChannelId 渠道ID
     * @return 结果
     */
    @Override
    public SysChannel selectSysChannelById(Long sysChannelId) {
        return sysChannelDao.selectSysChannelById(sysChannelId);
    }
    /**
     * 通过渠道ID删除产品
     *
     * @param sysChannelId 渠道ID
     * @return 结果
     */
    @Override
    public int deleteSysChannelById(Long sysChannelId) {
        return sysChannelDao.deleteSysChannelById(sysChannelId);
    }
    /**
     * 批量删除产品信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int batchDeleteSysChannel(Long[] ids) {
        return sysChannelDao.batchDeleteSysChannel(ids);
    }
    /**
     * 保存渠道信息
     *
     * @param sysChannel 渠道信息
     * @return 结果
     */
    @Override
    public int saveProduct(SysChannel sysChannel) {
        Long channelId = sysChannel.getChannelId();
        if (StringUtils.isNotNull(channelId))
        {
            System.out.println("修改渠道");
            sysChannel.setUpdateBy(ShiroUtils.getLoginName());
            sysChannel.setUpdateTime(new Date());
            // 修改产品信息
            return sysChannelDao.updateSysChannel(sysChannel);
        }
        else
        {
            System.out.println("新增渠道");
            sysChannel.setCreateTime(new Date());
            sysChannel.setCreateBy(ShiroUtils.getLoginName());
            // 新增产品信息
            return sysChannelDao.insertSysChannel(sysChannel);
        }
    }

    /**
     * 通过渠道名称查询
     *
     * @param channelName 渠道ID
     * @return 渠道对象信息
     */
    public SysChannel selectSysChannelByName(String channelName) {
        return sysChannelDao.selectSysChannelByName(channelName);
    }


}
