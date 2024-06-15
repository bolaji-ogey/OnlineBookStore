/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */  

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

@FunctionalInterface
public interface CallableStatementCreator {

    public CallableStatement createCallableStatement(Connection con) throws SQLException;
}

