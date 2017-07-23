package com.lh.common.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.lh.common.dao.IBaseDao;
import java.util.List;

public interface IBaseService<T> {
    int countByExample(T record);

    int deleteByExample(T record);

    int deleteByPrimaryKey(String key);

    int insert(T record);

    int insertSelective(T record);

    List<T> selectByExampleWithBLOBs(T record);

    PageList<T> selectByExampleWithBLOBsByPager(T record, PageBounds pageBounds);

    List<T> selectByExample(T record);

    PageList<T> selectByExampleByPager(T record, PageBounds pageBounds);

    T selectByPrimaryKey(String key);

    int updateByExampleSelective(T record);

    int updateByExampleWithBLOBs(T record);

    int updateByExample(T record);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKeyWithBLOBs(T record);

    int updateByPrimaryKey(T record);

    PageList<T> fuzzySearchByPager(T record, PageBounds pageBounds);

    List<T> fuzzySearch(T record);

    IBaseDao<T> getDao();

    void setKey(T record);
}