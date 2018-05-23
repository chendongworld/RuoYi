package com.ruoyi.project.system.product.service;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.product.dao.IProductDao;
import com.ruoyi.project.system.product.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 产品 业务层处理
 * 
 * @author ruoyi
 */
@Service("productService")
public class ProductServiceImpl implements IProductService
{
    @Autowired
    private IProductDao productDao;
    /**
     * 查询所有产品
     *
     * @return 产品列表
     */
    @Override
    public List<Product> selectProductAll() {
        return productDao.selectProductAll();
    }
    /**
     * 通过产品ID查询产品
     *
     * @param productId 角色ID
     * @return 产品信息
     */
    @Override
    public Product selectProductById(Long productId) {
        return productDao.selectProductById(productId);
    }

    /**
     * 通过产品名称查询产品
     *
     * @param productName 角色ID
     * @return 角色对象信息
     */
    @Override
    public Product selectProductByName(String productName) {
        return productDao.selectProductByName(productName);
    }

    /**
     * 通过产品ID删除产品
     *
     * @param productId 产品ID
     * @return 结果
     */
    @Override
    public int deleteProductById(Long productId) {
        return productDao.deleteProductById(productId);
    }
    /**
     * 批量删除产品信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int batchDeleteProduct(Long[] ids) {
        return productDao.batchDeleteProduct(ids);
    }
    /**
     * 保存产品信息
     *
     * @param product 产品信息
     * @return 结果
     */
    @Override

    public int saveProduct(Product product) {
        Long productId = product.getProductId();
        if (StringUtils.isNotNull(productId))
        {
            System.out.println("修改产品");
            product.setUpdateBy(ShiroUtils.getLoginName());
            product.setUpdateTime(new Date());
            // 修改产品信息
           return productDao.updateProduct(product);
        }
        else
        {
            System.out.println("新增产品");
            product.setCreateTime(new Date());
            product.setCreateBy(ShiroUtils.getLoginName());
            product.setProductName(product.getChannelName()+product.getProductName());
            // 新增产品信息
            return productDao.insertProduct(product);
        }

    }
}
