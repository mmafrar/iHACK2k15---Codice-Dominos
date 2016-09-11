/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.connection;

/**
 *
 * @author linux
 */
public interface ConnectionProvider {

    public Object getConnection() throws Exception;
}
