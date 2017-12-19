package pers.mao.shop.service;

import pers.mao.shop.dao.UserDao;

import java.sql.SQLException;

public class UserService {
    private UserDao dao;

    private void checkDaoNotNull() {
        if (dao == null) {
            dao = new UserDao();
        }
    }

    public boolean isUserExisted(String username) {
        checkDaoNotNull();
        long count = 100;
        try {
            count = dao.getUserCount(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }
}
