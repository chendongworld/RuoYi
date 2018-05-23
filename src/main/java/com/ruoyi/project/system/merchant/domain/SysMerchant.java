package com.ruoyi.project.system.merchant.domain;

import com.ruoyi.framework.web.page.PageDomain;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 商户表
 * </p>
 *
 * @author cd
 * @since 2018-05-18
 */
public class SysMerchant extends PageDomain {

    /**
     * 商户id
     */
	private Long merchantId;
    /**
     * 业务对接人id
     */
	private String userName;
    /**
     * 商户名称
     */
	private String merchantName;
    /**
     * 排序值
     */
	private Integer merchantSort;
    /**
     * 商户费率
     */
	private BigDecimal merchantRate;
    /**
     * 业务提成比率
     */
	private BigDecimal royaltyRate;
    /**
     * 渠道属性
     */
	private String merchantAttribute;
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


	public Long getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(Long merchantId) {
		this.merchantId = merchantId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public Integer getMerchantSort() {
		return merchantSort;
	}

	public void setMerchantSort(Integer merchantSort) {
		this.merchantSort = merchantSort;
	}

	public BigDecimal getMerchantRate() {
		return merchantRate;
	}

	public void setMerchantRate(BigDecimal merchantRate) {
		this.merchantRate = merchantRate;
	}

	public BigDecimal getRoyaltyRate() {
		return royaltyRate;
	}

	public void setRoyaltyRate(BigDecimal royaltyRate) {
		this.royaltyRate = royaltyRate;
	}

	public String getMerchantAttribute() {
		return merchantAttribute;
	}

	public void setMerchantAttribute(String merchantAttribute) {
		this.merchantAttribute = merchantAttribute;
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
		return "SysMerchant{" +
				"merchantId=" + merchantId +
				", userName='" + userName + '\'' +
				", merchantName='" + merchantName + '\'' +
				", merchantSort=" + merchantSort +
				", merchantRate=" + merchantRate +
				", royaltyRate=" + royaltyRate +
				", merchantAttribute='" + merchantAttribute + '\'' +
				", createTime=" + createTime +
				", updateTime=" + updateTime +
				", createBy='" + createBy + '\'' +
				", updateBy='" + updateBy + '\'' +
				", remark='" + remark + '\'' +
				'}';
	}
}
