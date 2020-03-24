package com.adultexample.manager.service;

import java.util.List;

import com.adultexample.manager.dto.SubjectDto;
import com.adultexample.pojo.TSubject;
import com.github.pagehelper.PageInfo;

public interface SubjectService {
	
	/**
	 * 分页查询  类型
	 * @param pageNumber
	 * @param pageSize
	 * @param checkname
	 * @return
	 */
	PageInfo<SubjectDto> findPage(Integer pageNumber, Integer pageSize, String checkname);
	
	/**
	 * 根据id查一条数据
	 * @param id
	 * @return
	 */
	TSubject finById(Integer id);
	
	/**
	 * 查询上级部门信息(id,name)
	 * @return
	 */
	List<TSubject> findParNameList();
	
	/**
	 * 保存数据
	 * @param subject
	 */
	void saveData(TSubject subject);
	
	/**
	 * 删除一条数据
	 * @param id
	 */
	void removeById(Integer id);
	
	/**
	 * 批量删除
	 * @param ids
	 */
	void removeByIds(Integer[] ids);

	/**
	 * 查询所有考试科目 只有二级的
	 * @return
	 */
	List<TSubject> findsubList();
	
}
