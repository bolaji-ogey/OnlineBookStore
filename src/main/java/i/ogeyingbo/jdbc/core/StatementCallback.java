/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import java.sql.SQLException;
import java.sql.Statement;
import i.ogeyingbo.dao.DataAccessException;
import i.ogeyingbo.lang.Nullable;

import java.sql.SQLException;
import java.sql.Statement;

@FunctionalInterface
public interface StatementCallback<T extends Object> {

    @Nullable
    public T doInStatement(Statement stmt) throws SQLException, DataAccessException;
}

