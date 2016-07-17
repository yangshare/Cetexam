package com.cet.service;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface ObjectService {

	// 添加对象
	public void save(Object obj);

	// 获取最大ID
	public int getMaxID(String table);

	// 通过id查找对象
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public Object getObjectById(Class cls, String candidateNo);

	// 修改对象
	public boolean update(Object obj);

	// 删除对象
	public void delete(Object obj);
	
	
	// 获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getAllObjects(String table);

	// 根据一个字段获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getObjectByfield(String table, String dbfield, Object field);

	// 根据一组字段获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getObjectByfield(String table, String dbfields[],
			Object fields[]);

	// 登录验证
	public List<?> check(String type, String username, String password);

	// 分页显示
	@SuppressWarnings("unchecked")
	public List page(String table, int first, int perPageRow);

	// 获取一个ID不在idList里的对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getObjectNotIn(String table);
	/**
	 * 老杨添加方法===========================================================================================
	 */




	// 通过id查找对象
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public Object getObjectById(Class cls, int id);


	//删除对象
	public void delete(String table ,String testid);
	// 删除对象通过id
	@SuppressWarnings("unchecked")
	public void delete(Class cls, int id);

	// 获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List getObject(String table);

	// 获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List getObjectByTestid(String table, int cond);

	// 获取对象列表通过ID
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List getObject(String table, String id);



	@SuppressWarnings("unchecked")
	public void delete(Class cls, String candidateNo);

	@SuppressWarnings("unchecked")
	public List validation(String table, String candidateNo);


	
	
}