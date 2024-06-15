/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.support.rowset;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import i.ogeyingbo.jdbc.InvalidResultSetAccessException;

public interface SqlRowSetMetaData {

    public String getCatalogName(int columnIndex) throws InvalidResultSetAccessException;

    public String getColumnClassName(int columnIndex) throws InvalidResultSetAccessException;

    public int getColumnCount() throws InvalidResultSetAccessException;

    public String[] getColumnNames() throws InvalidResultSetAccessException;

    public int getColumnDisplaySize(int columnIndex) throws InvalidResultSetAccessException;

    public String getColumnLabel(int columnIndex) throws InvalidResultSetAccessException;

    public String getColumnName(int columnIndex) throws InvalidResultSetAccessException;

    public int getColumnType(int columnIndex) throws InvalidResultSetAccessException;

    public String getColumnTypeName(int columnIndex) throws InvalidResultSetAccessException;

    public int getPrecision(int columnIndex) throws InvalidResultSetAccessException;

    public int getScale(int columnIndex) throws InvalidResultSetAccessException;

    public String getSchemaName(int columnIndex) throws InvalidResultSetAccessException;

    public String getTableName(int columnIndex) throws InvalidResultSetAccessException;

    public boolean isCaseSensitive(int columnIndex) throws InvalidResultSetAccessException;

    public boolean isCurrency(int columnIndex) throws InvalidResultSetAccessException;

    public boolean isSigned(int columnIndex) throws InvalidResultSetAccessException;
}
