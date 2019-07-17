package com.jude.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.jude.entity.UserRole;

/**
 * 用户角色关联Repository接口
 * @author jude
 *
 */
public interface UserRoleRepository extends JpaRepository<UserRole, Integer>,JpaSpecificationExecutor<UserRole>{


	
	/**
	 * 根据用户id删除所有关联信息
	 * @param userId
	 */
	@Query(value="delete from t_user_role where user_id=?1",nativeQuery=true)
	@Modifying
	public void deleteByUserId(Integer userId);
	
	
	/**
	 * 根据角色id删除所有关联信息
	 * @param id
	 */
	@Query(value="delete from t_user_role where role_id=?1",nativeQuery=true)
	@Modifying
	public void deleteByRoleId(Integer roleId);
}
