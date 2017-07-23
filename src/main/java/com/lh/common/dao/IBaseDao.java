package com.lh.common.dao;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IBaseDao<T> {
    int countByExample(T record);

    int deleteByExample(T record);

    int deleteByPrimaryKey(String key);

    int insert(T record);

    int insertSelective(T record);

    List<T> selectByExampleWithBLOBs(T record);

    PageList<T> selectByExampleWithBLOBsByPager(@Param("item") T record, @Param("pageBounds") PageBounds pageBounds);

    List<T> selectByExample(T record);

    PageList<T> selectByExampleByPager(@Param("item") T record, @Param("pageBounds") PageBounds pageBounds);

    T selectByPrimaryKey(String key);

    int updateByExampleSelective(T record);

    int updateByExampleWithBLOBs(T record);

    int updateByExample(T record);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKeyWithBLOBs(T record);

    int updateByPrimaryKey(T record);

    PageList<T> fuzzySearchByPager(@Param("item") T record, @Param("pageBounds") PageBounds pageBounds);

    List<T> fuzzySearch(@Param("item") T record);
}