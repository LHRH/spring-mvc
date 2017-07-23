package com.lh.service.impl;

import com.lh.common.dao.IBaseDao;
import com.lh.common.service.impl.BaseServiceImpl;
import com.lh.po.User;
import com.lh.repository.IUserMybatisDao;
import com.lh.service.IUserService;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("UserServiceImpl")
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {
    @Autowired
    private IUserMybatisDao userMybatisDao;

    public IBaseDao<User> getDao() {
        return this.userMybatisDao;
    }

    public void setKey(User record) {
        if(record.getId() == null || "".equals(record.getId())) {
            record.setId(UUID.randomUUID().toString());
        }
    }
}