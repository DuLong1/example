package com.adultexample.mapper;

import com.adultexample.manager.dto.OrgDto;
import com.adultexample.pojo.SOrganization;
import com.adultexample.pojo.SOrganizationExample;
import com.adultexample.pojo.SOrganizationKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SOrganizationMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    long countByExample(SOrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int deleteByExample(SOrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int deleteByPrimaryKey(SOrganizationKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int insert(SOrganization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int insertSelective(SOrganization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    List<SOrganization> selectByExample(SOrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    SOrganization selectByPrimaryKey(SOrganizationKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int updateByExampleSelective(@Param("record") SOrganization record, @Param("example") SOrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int updateByExample(@Param("record") SOrganization record, @Param("example") SOrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int updateByPrimaryKeySelective(SOrganization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table s_organization
     *
     * @mbg.generated Fri Feb 21 18:09:01 CST 2020
     */
    int updateByPrimaryKey(SOrganization record);
    
    
/*........................................................*/
	List<OrgDto> selectInfo(String orgname);

	SOrganization selectInfoById(Integer id);

	int deleteByIds(Integer[] ids);

	List<SOrganization> selectOrgname();
}