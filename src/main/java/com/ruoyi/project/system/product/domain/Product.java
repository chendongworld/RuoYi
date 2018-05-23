package com.ruoyi.project.system.product.domain;

import com.ruoyi.framework.web.page.PageDomain;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;

/**
 * 产品表
 * 
 * @author ruoyi
 */
public class Product extends PageDomain
{
    /**
     * 产品id
     */
    private Long productId;

    /**
     * 渠道名称
     */
    private String channelName;
    /**
     * 产品名称
     */
    private String productName;
    /**
     * 渠道成本
     */
    private BigDecimal channelCost;
    /**
     * 显示顺序
     */
    private  int productSort;
    /**
     * 产品属性
     */
    private String productAttribute;
    /**
     * 创建者
     */
    private String createBy;
    /**
     * 新建时间
     */
    private Date createTime;
    /**
     * 修改者
     */
    private String updateBy;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 备注
     */
    private String remark;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductSort() {
        return productSort;
    }

    public void setProductSort(int productSort) {
        this.productSort = productSort;
    }

    public String getProductAttribute() {
        return productAttribute;
    }

    public void setProductAttribute(String productAttribute) {
        this.productAttribute = productAttribute;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public BigDecimal getChannelCost() {
        return channelCost;
    }

    public void setChannelCost(BigDecimal channelCost) {
        this.channelCost = channelCost;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", channelName='" + channelName + '\'' +
                ", productName='" + productName + '\'' +
                ", channelCost=" + channelCost +
                ", productSort=" + productSort +
                ", productAttribute='" + productAttribute + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createTime=" + createTime +
                ", updateBy='" + updateBy + '\'' +
                ", updateTime=" + updateTime +
                ", remark='" + remark + '\'' +
                '}';
    }
}
