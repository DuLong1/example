package com.adultexample.pojo;

public class TPaperWithBLOBs extends TPaper {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_paper.question_info
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    private String questionInfo;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_paper.question_info
     *
     * @return the value of t_paper.question_info
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public String getQuestionInfo() {
        return questionInfo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_paper.question_info
     *
     * @param questionInfo the value for t_paper.question_info
     *
     * @mbg.generated Wed Feb 26 20:15:28 CST 2020
     */
    public void setQuestionInfo(String questionInfo) {
        this.questionInfo = questionInfo == null ? null : questionInfo.trim();
    }
}