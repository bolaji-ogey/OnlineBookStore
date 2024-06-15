/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 

@FunctionalInterface
public interface PreparedStatementCreator {

    public PreparedStatement createPreparedStatement(Connection con) throws SQLException;
}

