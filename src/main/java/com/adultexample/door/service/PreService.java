package com.adultexample.door.service;

import java.util.List;

import com.adultexample.pojo.TQuestionWithBLOBs;

public interface PreService {

	/**
	 * 点击收藏  ，进行保存
	 * @param qid
	 * @param custid
	 * @return
	 */
	boolean saveHeart(Integer qid, Integer custid);

	/**
	 * 查找收藏夹的问题
	 * @param id
	 * @return
	 */
	List<TQuestionWithBLOBs> findQuestions(Integer id);

	/**
	 * 是否已经收藏了
	 * @param qid
	 * @param custid
	 * @return
	 */
	boolean findCunzai(Integer qid, Integer custid);

}
