package com.ruoyi.project.system.channel.domain;

import com.ruoyi.framework.web.page.PageDomain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 渠道表sys_channel
 * </p>
 *
 * @author cd
 * @since 2018-05-16
 */

public class SysChannel extends PageDomain {

    /**
     * 渠道id
     */
	private Long channelId;
    /**
     * 渠道名称
     */
	private String channelName;
    /**
     * 排序值
     */
	private Integer channelSort;
    /**
     * 渠道属性
     */
	private String channelAttribute;
    /**
     * 创建时间
     */
	private Date createTime;
    /**
     * 修改时间
     */
	private Date updateTime;
    /**
     * 创建者
     */
	private String createBy;
    /**
     * 修改者
     */
	private String updateBy;
    /**
     * 备注
     */
	private String remark;


	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public Integer getChannelSort() {
		return channelSort;
	}

	public void setChannelSort(Integer channelSort) {
		this.channelSort = channelSort;
	}

	public String getChannelAttribute() {
		return channelAttribute;
	}

	public void setChannelAttribute(String channelAttribute) {
		this.channelAttribute = channelAttribute;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}



}
