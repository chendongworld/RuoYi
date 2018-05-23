package com.ruoyi.project.system.product.dao;

import com.ruoyi.project.system.product.domain.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 产品表 数据层
 * 
 * @author ruoyi
 */
@Mapper
public interface IProductDao
{


    /**
     * 查询产品列表
     * 
     * @return 角色列表
     */
    public List<Product> selectProductAll();

    /**
     * 通过产品ID查询产品
     * 
     * @param productId 角色ID
     * @return 角色对象信息
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
     * @param productId 角色ID
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
     * 修改产品信息
     * 
     * @param product 产品信息
     * @return 结果
     */
    public int updateProduct(Product product);

    /**
     * 新增角产品信息
     * 
     * @param product 产品信息
     * @return 结果
     */
    public int insertProduct(Product product);
    
}
