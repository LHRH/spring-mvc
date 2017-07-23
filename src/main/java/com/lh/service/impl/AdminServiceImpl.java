package com.lh.service.impl;

import com.lh.common.dao.IBaseDao;
import com.lh.common.service.impl.BaseServiceImpl;
import com.lh.po.Admin;
import com.lh.repository.IAdminMybatisDao;
import com.lh.service.IAdminService;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("AdminServiceImpl")
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements IAdminService {
    @Autowired
    private IAdminMybatisDao adminMybatisDao;

    public IBaseDao<Admin> getDao() {
        return this.adminMybatisDao;
    }

    public void setKey(Admin record) {
        if(record.getId() == null || "".equals(record.getId())) {
            record.setId(UUID.randomUUID().toString());
        }
    }
}