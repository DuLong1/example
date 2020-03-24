package com.adultexample.pojo;

public class TChapter extends TChapterKey {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_chapter.subject_id
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    private String subjectId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_chapter.parent_code
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    private String parentCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_chapter.name
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_chapter.orders
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    private Integer orders;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_chapter.status
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    private String status;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_chapter.subject_id
     *
     * @return the value of t_chapter.subject_id
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public String getSubjectId() {
        return subjectId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_chapter.subject_id
     *
     * @param subjectId the value for t_chapter.subject_id
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId == null ? null : subjectId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_chapter.parent_code
     *
     * @return the value of t_chapter.parent_code
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public String getParentCode() {
        return parentCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_chapter.parent_code
     *
     * @param parentCode the value for t_chapter.parent_code
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public void setParentCode(String parentCode) {
        this.parentCode = parentCode == null ? null : parentCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_chapter.name
     *
     * @return the value of t_chapter.name
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_chapter.name
     *
     * @param name the value for t_chapter.name
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_chapter.orders
     *
     * @return the value of t_chapter.orders
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public Integer getOrders() {
        return orders;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_chapter.orders
     *
     * @param orders the value for t_chapter.orders
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_chapter.status
     *
     * @return the value of t_chapter.status
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_chapter.status
     *
     * @param status the value for t_chapter.status
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}