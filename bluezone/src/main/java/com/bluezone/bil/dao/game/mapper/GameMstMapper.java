package com.bluezone.bil.dao.game.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameMstExample;

public interface GameMstMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int countByExample(GameMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int deleteByExample(GameMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int deleteByPrimaryKey(Integer gameNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int insert(GameMst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int insertSelective(GameMst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    List<GameMst> selectByExample(GameMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    GameMst selectByPrimaryKey(Integer gameNo);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int updateByExampleSelective(@Param("record") GameMst record, @Param("example") GameMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int updateByExample(@Param("record") GameMst record, @Param("example") GameMstExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int updateByPrimaryKeySelective(GameMst record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table game_mst
     *
     * @mbggenerated Thu Oct 03 16:40:45 KST 2013
     */
    int updateByPrimaryKey(GameMst record);
}