/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import java.sql.ResultSet;
import java.sql.SQLException;
import i.ogeyingbo.dao.DataAccessException;
import i.ogeyingbo.lang.Nullable;

import java.sql.ResultSet;
import java.sql.SQLException;

@FunctionalInterface
public interface ResultSetExtractor<T extends Object> {

    @Nullable
    public T extractData(ResultSet rs) throws SQLException, DataAccessException;
}
