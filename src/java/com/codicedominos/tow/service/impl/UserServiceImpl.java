/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.service.impl;


import com.codicedominos.tow.dao.UserDao;
import com.codicedominos.tow.dao.factory.DaoFactory;
import com.codicedominos.tow.model.User;
import com.codicedominos.tow.service.UserService;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

;

/**
 *
 * @author Mannu
 */
public class UserServiceImpl implements UserService {

    @Override
    public boolean isuserExist(String email, String userName, Connection c) throws SQLException, ClassNotFoundException {
        UserDao ud = (UserDao) DaoFactory.getDao("UserDao");
        return ud.isuserExist(email, userName, c);
    }

    @Override
    public int add(User entity, Connection c) throws SQLException, ClassNotFoundException {
        return DaoFactory.getDao("UserDao").add(entity, c);
    }

    @Override
    public int delete(Object id, Connection c) throws SQLException, ClassNotFoundException {
        return DaoFactory.getDao("UserDao").delete(id, c);
    }

    @Override
    public Object search(Object entity, Connection c) throws SQLException, ClassNotFoundException {
        return DaoFactory.getDao("UserDao").search(entity, c);
    }

    @Override
    public int updte(User entity, Connection c) throws SQLException, ClassNotFoundException {
        return DaoFactory.getDao("UserDao").updte(entity, c);
    }

    @Override
    public List<Object> getAll(Connection c) throws SQLException, ClassNotFoundException {
        return DaoFactory.getDao("UserDao").getAll(c);
    }

    @Override
    public boolean userLogIn(String email, String password, Connection c) throws SQLException, ClassNotFoundException {
        UserDao ud = (UserDao) DaoFactory.getDao("UserDao");
        return ud.userLogIn(email, password, c);
    }

    @Override
    public User user(String email, String password, Connection c) throws SQLException, ClassNotFoundException {
        UserDao ud = (UserDao) DaoFactory.getDao("UserDao");
        return ud.user(email, password, c);
    }

}
