package com.jude.service;

import java.util.List;

import com.jude.entity.DamageListGoods;

/**
 * 报损单商品Service接口
 * @author java1234_小锋老师
 *
 */
public interface DamageListGoodsService {

	/**
	 * 根据报损单id查询所有报损单商品
	 * @param damageListId
	 * @return
	 */
	public List<DamageListGoods> listByDamageListId(Integer damageListId);


}
