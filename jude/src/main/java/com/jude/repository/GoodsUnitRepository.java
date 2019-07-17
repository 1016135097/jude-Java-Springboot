package com.jude.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jude.entity.GoodsUnit;

/**
 * 商品单位Repository接口
 * @author jude
 *
 */
public interface GoodsUnitRepository extends JpaRepository<GoodsUnit, Integer>{

}
