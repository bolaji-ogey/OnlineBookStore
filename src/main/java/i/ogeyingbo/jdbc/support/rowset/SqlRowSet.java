/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.support.rowset;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;
import i.ogeyingbo.jdbc.InvalidResultSetAccessException; 
 

import i.ogeyingbo.lang.Nullable; 

public interface SqlRowSet extends Serializable {

    public SqlRowSetMetaData getMetaData();

    public int findColumn(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public BigDecimal getBigDecimal(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public BigDecimal getBigDecimal(String columnLabel) throws InvalidResultSetAccessException;

    public boolean getBoolean(int columnIndex) throws InvalidResultSetAccessException;

    public boolean getBoolean(String columnLabel) throws InvalidResultSetAccessException;

    public byte getByte(int columnIndex) throws InvalidResultSetAccessException;

    public byte getByte(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Date getDate(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public Date getDate(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Date getDate(int columnIndex, Calendar cal) throws InvalidResultSetAccessException;

    @Nullable
    public Date getDate(String columnLabel, Calendar cal) throws InvalidResultSetAccessException;

    public double getDouble(int columnIndex) throws InvalidResultSetAccessException;

    public double getDouble(String columnLabel) throws InvalidResultSetAccessException;

    public float getFloat(int columnIndex) throws InvalidResultSetAccessException;

    public float getFloat(String columnLabel) throws InvalidResultSetAccessException;

    public int getInt(int columnIndex) throws InvalidResultSetAccessException;

    public int getInt(String columnLabel) throws InvalidResultSetAccessException;

    public long getLong(int columnIndex) throws InvalidResultSetAccessException;

    public long getLong(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public String getNString(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public String getNString(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Object getObject(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public Object getObject(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Object getObject(int columnIndex, Map<String, Class<?>> map) throws InvalidResultSetAccessException;

    @Nullable
    public Object getObject(String columnLabel, Map<String, Class<?>> map) throws InvalidResultSetAccessException;

    @Nullable
    public <T extends Object> T getObject(int columnIndex, Class<T> type) throws InvalidResultSetAccessException;

    @Nullable
    public <T extends Object> T getObject(String columnLabel, Class<T> type) throws InvalidResultSetAccessException;

    public short getShort(int columnIndex) throws InvalidResultSetAccessException;

    public short getShort(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public String getString(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public String getString(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Time getTime(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public Time getTime(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Time getTime(int columnIndex, Calendar cal) throws InvalidResultSetAccessException;

    @Nullable
    public Time getTime(String columnLabel, Calendar cal) throws InvalidResultSetAccessException;

    @Nullable
    public Timestamp getTimestamp(int columnIndex) throws InvalidResultSetAccessException;

    @Nullable
    public Timestamp getTimestamp(String columnLabel) throws InvalidResultSetAccessException;

    @Nullable
    public Timestamp getTimestamp(int columnIndex, Calendar cal) throws InvalidResultSetAccessException;

    @Nullable
    public Timestamp getTimestamp(String columnLabel, Calendar cal) throws InvalidResultSetAccessException;

    public boolean absolute(int row) throws InvalidResultSetAccessException;

    public void afterLast() throws InvalidResultSetAccessException;

    public void beforeFirst() throws InvalidResultSetAccessException;

    public boolean first() throws InvalidResultSetAccessException;

    public int getRow() throws InvalidResultSetAccessException;

    public boolean isAfterLast() throws InvalidResultSetAccessException;

    public boolean isBeforeFirst() throws InvalidResultSetAccessException;

    public boolean isFirst() throws InvalidResultSetAccessException;

    public boolean isLast() throws InvalidResultSetAccessException;

    public boolean last() throws InvalidResultSetAccessException;

    public boolean next() throws InvalidResultSetAccessException;

    public boolean previous() throws InvalidResultSetAccessException;

    public boolean relative(int rows) throws InvalidResultSetAccessException;

    public boolean wasNull() throws InvalidResultSetAccessException;
}

