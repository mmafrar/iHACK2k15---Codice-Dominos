/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.codicedominos.tow.dao.factory;


import com.codicedominos.tow.dao.Dao;
import com.codicedominos.tow.dao.impl.GroupDaoImpl;
import com.codicedominos.tow.dao.impl.UserDaoImpl;
import java.sql.SQLException;

/**
 *
 * @author Mannu
 */
public class DaoFactory {
    public static Dao getDao(String name) throws SQLException,ClassNotFoundException{
        if(name.equals("UserDao")){
            return (Dao) new UserDaoImpl();
        }else if(name.equals("GrouPDao")){
            return (Dao) new GroupDaoImpl();
        }else{
            return null;
        }
    }
}
