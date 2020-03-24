package com.adultexample.door.service;

import java.util.List;

import com.adultexample.door.dto.DChapterDto;
import com.adultexample.door.dto.SubjectDto;
import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.pojo.TPaperWithBLOBs;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.adultexample.pojo.TSubject;
import com.github.pagehelper.PageInfo;

public interface DIndexService {

	/**
	 * 首页左侧菜单
	 * @return
	 */
	List<SubjectDto> findLeftList();

	/**
	 * 考试类型页  名称
	 * @param id
	 * @return
	 */
	TSubject findSubjectName(Integer id);

	/**
	 * 查询章节练习信息
	 * @param id
	 * @return
	 */
	List<DChapterDto> findChapterList(Integer id);

	/**
	 * 查询章节练习题
	 * @param pageNum
	 * @param pageSize
	 * @param id
	 * @return
	 */
	PageInfo<QuestionDto> findChapterQuestion(Integer pageNum, Integer pageSize,
			Integer id);
	
	/**
	 * 查看试卷页面
	 * @param subid
	 * @param type
	 * @param pageNum
	 * @param pageSize
	 * @param year
	 * @return
	 */
	PageInfo<TPaperWithBLOBs> findExamplePaper(Integer subid, Integer type,
			Integer pageNum, Integer pageSize, String year);

	/**
	 * 查看试卷详情
	 * @param id
	 * @return
	 */
	List<TQuestionWithBLOBs> findExamplePaperDetail(Integer id);

	/**
	 * 通过id查询试卷名称
	 * @param id
	 * @return
	 */
	TPaperWithBLOBs findPapername(Integer id);

	/**
	 * 查询试卷的答案解析(对应id)
	 * @param id 
	 * @return
	 */
	TQuestionWithBLOBs findQuestionById(Integer id);

}
