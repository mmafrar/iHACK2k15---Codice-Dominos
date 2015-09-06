/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Mannu
 * @param <I>
 * @param <B>
 */
public interface Service<I, B> {

    
    int add(I entity,Connection c)throws SQLException,ClassNotFoundException;

    int delete(B id,Connection c)throws SQLException,ClassNotFoundException;

    B search(B entity,Connection c)throws SQLException,ClassNotFoundException;

    int updte(I entity,Connection c)throws SQLException,ClassNotFoundException;

    List<B> getAll(Connection c)throws SQLException,ClassNotFoundException;
}
