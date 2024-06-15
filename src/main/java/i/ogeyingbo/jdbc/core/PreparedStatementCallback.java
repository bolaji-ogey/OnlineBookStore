/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import java.sql.PreparedStatement;
import java.sql.SQLException;
import i.ogeyingbo.dao.DataAccessException;
import  i.ogeyingbo.lang.Nullable;
 

@FunctionalInterface
public interface PreparedStatementCallback<T extends Object> {

    @Nullable
    public T doInPreparedStatement(PreparedStatement ps) throws SQLException, DataAccessException;
}

