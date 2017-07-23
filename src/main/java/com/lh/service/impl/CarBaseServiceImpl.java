package com.lh.service.impl;

import com.lh.common.dao.IBaseDao;
import com.lh.common.service.impl.BaseServiceImpl;
import com.lh.po.CarBase;
import com.lh.repository.ICarbaseMybatisDao;
import com.lh.service.ICarBaseService;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("CarbaseServiceImpl")
public class CarBaseServiceImpl extends BaseServiceImpl<CarBase> implements ICarBaseService {
    @Autowired
    private ICarbaseMybatisDao carbaseMybatisDao;

    public IBaseDao<CarBase> getDao() {
        return this.carbaseMybatisDao;
    }

    public void setKey(CarBase record) {
        if(record.getId() == null || "".equals(record.getId())) {
            record.setId(UUID.randomUUID().toString());
        }
    }
}