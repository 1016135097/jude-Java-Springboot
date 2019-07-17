package com.jude.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jude.entity.DamageListGoods;
import com.jude.repository.DamageListGoodsRepository;
import com.jude.service.DamageListGoodsService;

/**
 * 报损单商品Service实现类
 * @author java1234_小锋老师
 *
 */
@Service("damageListGoodsService")
public class DamageListGoodsServiceImpl implements DamageListGoodsService{

	@Resource
	private DamageListGoodsRepository damageListGoodsRepository;

	@Override
	public List<DamageListGoods> listByDamageListId(Integer damageListId) {
		return damageListGoodsRepository.listByDamageListId(damageListId);
	}

	

}
