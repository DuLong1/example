package com.adultexample.mapper;

import com.adultexample.pojo.SCust;
import com.adultexample.pojo.SCustExample;
import com.adultexample.pojo.SCustKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SCustMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    long countByExample(SCustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int deleteByExample(SCustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int deleteByPrimaryKey(SCustKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int insert(SCust record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int insertSelective(SCust record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    List<SCust> selectByExample(SCustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    SCust selectByPrimaryKey(SCustKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int updateByExampleSelective(@Param("record") SCust record, @Param("example") SCustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int updateByExample(@Param("record") SCust record, @Param("example") SCustExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int updateByPrimaryKeySelective(SCust record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_cust
     *
     * @mbg.generated Tue Mar 03 22:38:56 CST 2020
     */
    int updateByPrimaryKey(SCust record);

    /**
     * 验证登录功能
     * @param cust
     * @return
     */
	SCust selectLogin(SCust cust);

	SCust selectIsActive(SCust customer);

	SCust selectNameIsActive(SCust customer);
}