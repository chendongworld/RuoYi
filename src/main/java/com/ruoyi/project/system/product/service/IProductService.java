package com.ruoyi.project.system.product.service;

import com.ruoyi.project.system.product.domain.Product;

import java.util.List;

/**
 * 产品业务层
 * 
 * @author ruoyi
 */
public interface IProductService
{

    /**
     * 查询所有产品
     * 
     * @return 产品列表
     */
    public List<Product> selectProductAll();

    /**
     * 通过产品ID查询产品
     *
     * @param productId 角色ID
     * @return 产品信息
     */
    public Product selectProductById(Long productId);

    /**
     * 通过产品名称查询产品
     *
     * @param productName 角色ID
     * @return 角色对象信息
     */
    public Product selectProductByName(String productName);

    /**
     * 通过产品ID删除产品
     *
     * @param productId 产品ID
     * @return 结果
     */
    public int deleteProductById(Long productId);

    /**
     * 批量删除产品信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int batchDeleteProduct(Long[] ids);

    /**
     * 保存产品信息
     * 
     * @param product 产品信息
     * @return 结果
     */
    public int saveProduct(Product product);

}
