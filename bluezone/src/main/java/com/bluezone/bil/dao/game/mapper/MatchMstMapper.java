package com.bluezone.bil.dao.game.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bluezone.bil.domain.game.MatchMst;
import com.bluezone.bil.domain.game.MatchMstExample;

public interface MatchMstMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int countByExample(MatchMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int deleteByExample(MatchMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int deleteByPrimaryKey(Integer matchNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int insert(MatchMst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int insertSelective(MatchMst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    List<MatchMst> selectByExample(MatchMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    MatchMst selectByPrimaryKey(Integer matchNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int updateByExampleSelective(@Param("record") MatchMst record, @Param("example") MatchMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int updateByExample(@Param("record") MatchMst record, @Param("example") MatchMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int updateByPrimaryKeySelective(MatchMst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table match_mst
     *
     * @mbggenerated Thu Oct 03 17:27:29 KST 2013
     */
    int updateByPrimaryKey(MatchMst record);
    
    List<MatchMst> custMatchList(Integer custNo);
}