package com.lh.common.service.impl;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.lh.common.service.IBaseService;
import java.util.List;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    public int countByExample(T record) {
        return getDao().countByExample(record);
    }

    public int deleteByExample(T record) {
        return getDao().deleteByExample(record);
    }

    public int deleteByPrimaryKey(String key) {
        return getDao().deleteByPrimaryKey(key);
    }

    public int insert(T record) {
        setKey(record);
        return getDao().insert(record);
    }

    public int insertSelective(T record) {
        setKey(record);
        return getDao().insertSelective(record);
    }

    public List<T> selectByExampleWithBLOBs(T record) {
        return getDao().selectByExampleWithBLOBs(record);
    }

    public PageList<T> selectByExampleWithBLOBsByPager(T record, PageBounds pageBounds) {
        return getDao().selectByExampleWithBLOBsByPager(record, pageBounds);
    }

    public List<T> selectByExample(T record) {
        return getDao().selectByExample(record);
    }

    public PageList<T> selectByExampleByPager(T record, PageBounds pageBounds) {
        return getDao().selectByExampleByPager(record, pageBounds);
    }

    public T selectByPrimaryKey(String key) {
        return getDao().selectByPrimaryKey(key);
    }

    public int updateByExampleSelective(T record) {
        return getDao().updateByExampleSelective(record);
    }

    public int updateByExampleWithBLOBs(T record) {
        return getDao().updateByExampleWithBLOBs(record);
    }

    public int updateByExample(T record) {
        return getDao().updateByExample(record);
    }

    public int updateByPrimaryKeySelective(T record) {
        return getDao().updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKeyWithBLOBs(T record) {
        return getDao().updateByPrimaryKeyWithBLOBs(record);
    }

    public int updateByPrimaryKey(T record) {
        return getDao().updateByPrimaryKey(record);
    }

    public PageList<T> fuzzySearchByPager(T record, PageBounds pageBounds) {
        return getDao().fuzzySearchByPager(record, pageBounds);
    }

    public List<T> fuzzySearch(T record) {
        return getDao().fuzzySearch(record);
    }
}