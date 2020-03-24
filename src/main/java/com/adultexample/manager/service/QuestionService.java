package com.adultexample.manager.service;

import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.pojo.TQuestion;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.github.pagehelper.PageInfo;

public interface QuestionService {

	/**
	 * 查询问题信息  分页
	 * @param pageNumber
	 * @param pageSize
	 * @param checkname
	 * @return
	 */
	PageInfo<QuestionDto> findPageInfo(Integer pageNumber, Integer pageSize,
			String checkname);

	/**
	 * 通过id查询一条数据
	 * @param id
	 * @return
	 */
	TQuestionWithBLOBs findById(Integer id);
	/**
	 * 保存数据   （修改添加）
	 * @param question
	 */
	void save(TQuestionWithBLOBs question);
	/**
	 * 删除一条数据
	 * @param id
	 */
	void del(Integer id);

	/**
	 * 批量删除
	 * @param ids
	 */
	void dels(Integer[] ids);

}
