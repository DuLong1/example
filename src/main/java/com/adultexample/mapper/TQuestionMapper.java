package com.adultexample.mapper;

import com.adultexample.manager.dto.QuestionDto;
import com.adultexample.pojo.TQuestion;
import com.adultexample.pojo.TQuestionExample;
import com.adultexample.pojo.TQuestionKey;
import com.adultexample.pojo.TQuestionWithBLOBs;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TQuestionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    long countByExample(TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int deleteByExample(TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int deleteByPrimaryKey(TQuestionKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int insert(TQuestionWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int insertSelective(TQuestionWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    List<TQuestionWithBLOBs> selectByExampleWithBLOBs(TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    List<TQuestion> selectByExample(TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    TQuestionWithBLOBs selectByPrimaryKey(TQuestionKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int updateByExampleSelective(@Param("record") TQuestionWithBLOBs record, @Param("example") TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int updateByExampleWithBLOBs(@Param("record") TQuestionWithBLOBs record, @Param("example") TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int updateByExample(@Param("record") TQuestion record, @Param("example") TQuestionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int updateByPrimaryKeySelective(TQuestionWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int updateByPrimaryKeyWithBLOBs(TQuestionWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_question
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    int updateByPrimaryKey(TQuestion record);

    
    /*--------------------------------------------------*/
    
    /**
     * 查询问题信息  分页
     * @return
     */
	List<QuestionDto> selectPageInfo(String checkname);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteByIds(Integer[] ids);
	/**
	 * 查询试卷中的题目信息
	 * @param ids
	 * @return
	 */
	List<TQuestionWithBLOBs> selectQuestionInfo(String[] ids);
	
	/**
	 * 查询多选题  指定考试类型
	 * @return
	 */
	List<Integer> selectDuo(Map map1);

	/**
	 * 查询单选题 
	 * @param subId
	 * @return
	 */
	List<Integer> selectDan(Map map2);

	/**
	 * 查询解答题
	 * @param subId
	 * @return
	 */
	List<Integer> selectJie(Map map3);
	
	/**
	 * 查询章节练习试题
	 * @param id
	 * @return
	 */
	List<QuestionDto> selectChapterQuestion(Integer id);

}