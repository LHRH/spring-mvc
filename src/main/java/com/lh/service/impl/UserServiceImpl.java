package com.lh.service.impl;

import com.lh.po.User;
import com.lh.service.IUserService;
import org.springframework.stereotype.Service;

/**
 * Created by linghu on 17/02/19.
 */
@Service
public class UserServiceImpl implements IUserService {
    @Override
    public void save(User user) {
        System.out.println("serviceImpl"+user.getName());
    }
}
