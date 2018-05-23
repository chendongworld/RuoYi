package com.ruoyi.project.system.deal.domain;

import com.ruoyi.framework.web.page.PageDomain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 交易表
 * </p>
 *
 * @author cd
 * @since 2018-05-17
 */
public class SysDeal extends PageDomain {
    /**
     * 交易id
     */
	private Long dealId;
    /**
     * 业务员名称
     */
	private String userName;
    /**
     * 渠道名称
     */
	private String channelName;
    /**
     * 商户名称
     */
	private String merchantName;
    /**
     * 产品名称
     */
	private String productName;
    /**
     * 总金额
     */
	private BigDecimal sumMoney;
    /**
     * 总利润
     */
	private BigDecimal sumProfit;
    /**
     * 业务员利润
     */
	private BigDecimal userProfit;
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


	public Long getDealId() {
		return dealId;
	}

	public void setDealId(Long dealId) {
		this.dealId = dealId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getSumMoney() {
		return sumMoney;
	}

	public void setSumMoney(BigDecimal sumMoney) {
		this.sumMoney = sumMoney;
	}

	public BigDecimal getSumProfit() {
		return sumProfit;
	}

	public void setSumProfit(BigDecimal sumProfit) {
		this.sumProfit = sumProfit;
	}

	public BigDecimal getUserProfit() {
		return userProfit;
	}

	public void setUserProfit(BigDecimal userProfit) {
		this.userProfit = userProfit;
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

	@Override
	public String toString() {
		return "SysDeal{" +
				"dealId=" + dealId +
				", userName='" + userName + '\'' +
				", channelName='" + channelName + '\'' +
				", merchantName='" + merchantName + '\'' +
				", productName='" + productName + '\'' +
				", sumMoney=" + sumMoney +
				", sumProfit=" + sumProfit +
				", userProfit=" + userProfit +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				", createBy='" + createBy + '\'' +
				", updateBy='" + updateBy + '\'' +
				", remark='" + remark + '\'' +
				'}';
	}
}
