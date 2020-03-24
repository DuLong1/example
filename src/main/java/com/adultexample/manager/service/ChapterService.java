package com.adultexample.manager.service;

import java.util.List;

import com.adultexample.manager.dto.ChapterDto;
import com.adultexample.pojo.TChapter;
import com.github.pagehelper.PageInfo;

public interface ChapterService {

	/**
	 * 分页获取章节数据
	 * @param pageNumber
	 * @param pageSize
	 * @param checkname
	 * @return
	 */
	PageInfo<ChapterDto> findPageInfo(Integer pageNumber, Integer pageSize,
			String checkname);

	/**
	 * 通过id查询一条数据
	 * @param id
	 * @return
	 */
	TChapter findById(Integer id);
	
	/**
	 * 查询下拉框数据  父节点
	 * @return
	 */
	List<TChapter> findSelectedVal();
	/**
	 * 保存 修改或插入的数据
	 * @param chapter
	 */
	void saveData(TChapter chapter);

	/**
	 * 删除一条数据
	 * @param id
	 */
	void del(Integer id);

	/**
	 * 批量删除数据
	 * @param ids
	 */
	void dels(Integer[] ids);

	List<TChapter> findChapterList(Integer subid);


}
