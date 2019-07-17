package com.jude.service;

import java.util.List;

import org.springframework.data.domain.Sort.Direction;

import com.jude.entity.CustomerReturnList;
import com.jude.entity.CustomerReturnListGoods;

/**
 * 客户退货单Service接口
 * @author java1234_小锋老师
 *
 */
public interface CustomerReturnListService {

	/**
	 * 根据id查询实体
	 * @param id
	 * @return
	 */
	public CustomerReturnList findById(Integer id);
	
	/**
	 * 获取当天最大客户退货单号
	 * @return
	 */
	public String getTodayMaxCustomerReturnNumber();
	
	/**
	 * 添加客户退货单 以及所有客户退货单商品
	 * @param customerReturnList 客户退货单
	 * @param CustomerReturnListGoodsList 客户退货单商品
	 */
	public void save(CustomerReturnList customerReturnList,List<CustomerReturnListGoods> customerReturnListGoodsList);
	
	/**
	 * 根据条件查询客户退货单信息
	 * @param customerReturnList
	 * @param page
	 * @param pageSize
	 * @param direction
	 * @param properties
	 * @return
	 */
	public List<CustomerReturnList> list(CustomerReturnList customerReturnList,Direction direction,String... properties);
	
	/**
	 * 根据id删除客户退货单信息 包括客户退货单里的商品
	 * @param id
	 */
	public void delete(Integer id);
	
	/**
	 * 更新退货单
	 * @param customerReturnList
	 */
	public void update(CustomerReturnList customerReturnList);

}
