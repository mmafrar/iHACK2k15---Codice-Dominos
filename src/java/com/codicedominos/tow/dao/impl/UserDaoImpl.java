/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.dao.impl;


import com.codicedominos.tow.dao.UserDao;
import com.codicedominos.tow.model.User;
import com.codicedominos.tow.other.CryptWithMD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Mannu
 */
public class UserDaoImpl implements UserDao {

    @Override
    public boolean isuserExist(String email, String userName, Connection c) throws SQLException {
        System.out.println("isexistimpl");
        Statement cs = c.createStatement();
        String sql = "Select * from User  where email='" + email + "' and username='" + userName + "' ";
        ResultSet eq = cs.executeQuery(sql);
        System.out.println("isexist = " + eq.first());
        return eq.first();
    }

   
    public int add(User e, Connection c) throws SQLException {
        String sql = "insert into User values(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = c.prepareStatement(sql);
        String pwdencrypt = CryptWithMD5.cryptWithMD5(e.getPassword());
        Object userDetails[] = {e.getId(), e.getUsername(), e.getPassword(), e.getFirst_name(), e.getLast_name(), e.getEmail() ,e.getSex()};
        for (int i = 0; i < userDetails.length; i++) {
            ps.setObject(i + 1, userDetails[i]);
        }
        return ps.executeUpdate();
    }

    
    public int delete(Object id, Connection c) throws SQLException {
        String sql = "delete from user where userid='" + id + "'";
        Statement cs = c.createStatement();
        return cs.executeUpdate(sql);
    }

    
    public Object search(Object entity, Connection c) throws SQLException {
        String sql = "select * from user where userid='" + entity + "' ";
        Statement cs = c.createStatement();
        ResultSet eq = cs.executeQuery(sql);
        User ub = null;
        if (eq.first()) {
            ub = new User(eq.getInt(1), eq.getString(2), eq.getString(3), eq.getString(4), eq.getString(5), eq.getString(6), eq.getString(7), eq.getString(8));
        }
        return ub;
    }

    
    public int updte(User e, Connection c) throws SQLException {
        String sql = "update user set firstName=? , lastName=? , age=? , sex=? , weight=? , height=? , waistSize=? , occupation=? , workinghours=? , anydiseases=? , takingmedicines=? , userName=? , email=? , password=? , photopathofuser=? where userid=?";
        PreparedStatement ps = c.prepareStatement(sql);
        String pwdencrypt = CryptWithMD5.cryptWithMD5(e.getPassword());
        Object upd[] = {e.getId(), e.getUsername(), e.getPassword(),e.getFirst_name(),  e.getLast_name(),e.getEmail(), e.getSex()};
        for (int i = 0; i < upd.length; i++) {
            ps.setObject(i + 1, upd[i]);
        }
        return ps.executeUpdate();
    }

    
    public List<Object> getAll(Connection c) throws SQLException {
        String sql = "";
        Statement cs = c.createStatement();
        ResultSet eq = cs.executeQuery(sql);
        List<Object> ublist = new ArrayList<>();
        User ub;
        while (eq.next()) {
            ub = new User(eq.getInt(1), eq.getString(2), eq.getString(3), eq.getString(4), eq.getString(5), eq.getString(6), eq.getString(7), eq.getString(8));
            ublist.add(ub);
        }
        return ublist;
    }

    @Override
    public boolean userLogIn(String email, String password, Connection c) throws SQLException, ClassNotFoundException {
        String pwd = CryptWithMD5.cryptWithMD5(password);
        String sql = "select * from user where email='" + email + "' and password='" + pwd + "' ";
        Statement cs = c.createStatement();
        ResultSet eq = cs.executeQuery(sql);
        return eq.first();
    }

    @Override
    public User user(String email, String password, Connection c) throws SQLException, ClassNotFoundException {
        String pwd = CryptWithMD5.cryptWithMD5(password);
        String sql = "select * from user where email='" + email + "' and password='" + pwd + "' ";
        Statement cs = c.createStatement();
        ResultSet eq = cs.executeQuery(sql);
        User ub = null;
        if (eq.first()) {
            ub = new User(eq.getInt(1), eq.getString(2), eq.getString(3), eq.getString(4), eq.getString(5), eq.getString(6), eq.getString(7), eq.getString(8));
        }
        return ub;
    }

}
