package com.adultexample.manager.service;

import java.util.List;

import com.adultexample.manager.dto.PaperDto;
import com.adultexample.pojo.TPaperWithBLOBs;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.github.pagehelper.PageInfo;

public interface PaperService {

	/**
	 * 查询分页信息
	 * @param pageNumber
	 * @param pageSize
	 * @param checkname
	 * @return
	 */
	PageInfo<PaperDto> findPageInfo(Integer pageNumber, Integer pageSize,
			String checkname);

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

	/**
	 * 根据id查询一条数据
	 * @param id
	 * @return
	 */
	TPaperWithBLOBs findById(Integer id);

	/**
	 * 查询试卷题目信息
	 * @param questionInfo
	 * @return
	 */
	List<TQuestionWithBLOBs> findPaperInfo(String questionInfo);

	int save(TPaperWithBLOBs paper, Integer numdan, Integer numduo,
			Integer numjie);

	/**
	 * 上传试卷的保存
	 * @param paper
	 * @return
	 */
	int save(TPaperWithBLOBs paper);

}
