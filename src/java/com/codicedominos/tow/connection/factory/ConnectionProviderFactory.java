/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.codicedominos.tow.connection.factory;


import com.codicedominos.tow.connection.impl.MySQLConnectionProviderImpl;
import java.sql.SQLException;

/**
 *
 * @author linux
 */
public class ConnectionProviderFactory {

    private ConnectionProviderFactory() {
    }
    
    public static MySQLConnectionProviderImpl getConnection() throws ClassNotFoundException, SQLException {
        return new MySQLConnectionProviderImpl();
    }
}
