/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;
import i.ogeyingbo.dao.DataAccessException;
import i.ogeyingbo.jdbc.support.KeyHolder;
import i.ogeyingbo.jdbc.support.rowset.SqlRowSet;
import i.ogeyingbo.lang.Nullable;
 

public interface JdbcOperations {

    @Nullable
    public <T extends Object> T execute(ConnectionCallback<T> action) throws DataAccessException;

    @Nullable
    public <T extends Object> T execute(StatementCallback<T> action) throws DataAccessException;

    public void execute(String sql) throws DataAccessException;

    @Nullable
    public <T extends Object> T query(String sql, ResultSetExtractor<T> rse) throws DataAccessException;

    public void query(String sql, RowCallbackHandler rch) throws DataAccessException;

    public <T extends Object> List<T> query(String sql, RowMapper<T> rowMapper) throws DataAccessException;

    public <T extends Object> Stream<T> queryForStream(String sql, RowMapper<T> rowMapper) throws DataAccessException;

    @Nullable
    public <T extends Object> T queryForObject(String sql, RowMapper<T> rowMapper) throws DataAccessException;

    @Nullable
    public <T extends Object> T queryForObject(String sql, Class<T> requiredType) throws DataAccessException;

    public Map<String, Object> queryForMap(String sql) throws DataAccessException;

    public <T extends Object> List<T> queryForList(String sql, Class<T> elementType) throws DataAccessException;

    public List<Map<String, Object>> queryForList(String sql) throws DataAccessException;

    public SqlRowSet queryForRowSet(String sql) throws DataAccessException;

    public int update(String sql) throws DataAccessException;

    public int[] batchUpdate(String[] sql) throws DataAccessException;

    @Nullable
    public <T extends Object> T execute(PreparedStatementCreator psc, PreparedStatementCallback<T> action) throws DataAccessException;

    @Nullable
    public <T extends Object> T execute(String sql, PreparedStatementCallback<T> action) throws DataAccessException;

    @Nullable
    public <T extends Object> T query(PreparedStatementCreator psc, ResultSetExtractor<T> rse) throws DataAccessException;

    @Nullable
    public <T extends Object> T query(String sql, @Nullable PreparedStatementSetter pss, ResultSetExtractor<T> rse) throws DataAccessException;

    @Nullable
    public <T extends Object> T query(String sql, Object[] args, int[] argTypes, ResultSetExtractor<T> rse) throws DataAccessException;

    @Deprecated
    @Nullable
    public <T extends Object> T query(String sql, @Nullable Object[] args, ResultSetExtractor<T> rse) throws DataAccessException;

    @Nullable
    public <T extends Object> T query(String sql, ResultSetExtractor<T> rse, @Nullable Object[] args) throws DataAccessException;

    public void query(PreparedStatementCreator psc, RowCallbackHandler rch) throws DataAccessException;

    public void query(String sql, @Nullable PreparedStatementSetter pss, RowCallbackHandler rch) throws DataAccessException;

    public void query(String sql, Object[] args, int[] argTypes, RowCallbackHandler rch) throws DataAccessException;

    @Deprecated
    public void query(String sql, @Nullable Object[] args, RowCallbackHandler rch) throws DataAccessException;

    public void query(String sql, RowCallbackHandler rch, @Nullable Object[] args) throws DataAccessException;

    public <T extends Object> List<T> query(PreparedStatementCreator psc, RowMapper<T> rowMapper) throws DataAccessException;

    public <T extends Object> List<T> query(String sql, @Nullable PreparedStatementSetter pss, RowMapper<T> rowMapper) throws DataAccessException;

    public <T extends Object> List<T> query(String sql, Object[] args, int[] argTypes, RowMapper<T> rowMapper) throws DataAccessException;

    @Deprecated
    public <T extends Object> List<T> query(String sql, @Nullable Object[] args, RowMapper<T> rowMapper) throws DataAccessException;

    public <T extends Object> List<T> query(String sql, RowMapper<T> rowMapper, @Nullable Object[] args) throws DataAccessException;

    public <T extends Object> Stream<T> queryForStream(PreparedStatementCreator psc, RowMapper<T> rowMapper) throws DataAccessException;

    public <T extends Object> Stream<T> queryForStream(String sql, @Nullable PreparedStatementSetter pss, RowMapper<T> rowMapper) throws DataAccessException;

    public <T extends Object> Stream<T> queryForStream(String sql, RowMapper<T> rowMapper, @Nullable Object[] args) throws DataAccessException;

    @Nullable
    public <T extends Object> T queryForObject(String sql, Object[] args, int[] argTypes, RowMapper<T> rowMapper) throws DataAccessException;

    @Deprecated
    @Nullable
    public <T extends Object> T queryForObject(String sql, @Nullable Object[] args, RowMapper<T> rowMapper) throws DataAccessException;

    @Nullable
    public <T extends Object> T queryForObject(String sql, RowMapper<T> rowMapper, @Nullable Object[] args) throws DataAccessException;

    @Nullable
    public <T extends Object> T queryForObject(String sql, Object[] args, int[] argTypes, Class<T> requiredType) throws DataAccessException;

    @Deprecated
    @Nullable
    public <T extends Object> T queryForObject(String sql, @Nullable Object[] args, Class<T> requiredType) throws DataAccessException;

    @Nullable
    public <T extends Object> T queryForObject(String sql, Class<T> requiredType, @Nullable Object[] args) throws DataAccessException;

    public Map<String, Object> queryForMap(String sql, Object[] args, int[] argTypes) throws DataAccessException;

    public Map<String, Object> queryForMap(String sql, @Nullable Object[] args) throws DataAccessException;

    public <T extends Object> List<T> queryForList(String sql, Object[] args, int[] argTypes, Class<T> elementType) throws DataAccessException;

    @Deprecated
    public <T extends Object> List<T> queryForList(String sql, @Nullable Object[] args, Class<T> elementType) throws DataAccessException;

    public <T extends Object> List<T> queryForList(String sql, Class<T> elementType, @Nullable Object[] args) throws DataAccessException;

    public List<Map<String, Object>> queryForList(String sql, Object[] args, int[] argTypes) throws DataAccessException;

    public List<Map<String, Object>> queryForList(String sql, @Nullable Object[] args) throws DataAccessException;

    public SqlRowSet queryForRowSet(String sql, Object[] args, int[] argTypes) throws DataAccessException;

    public SqlRowSet queryForRowSet(String sql, @Nullable Object[] args) throws DataAccessException;

    public int update(PreparedStatementCreator psc) throws DataAccessException;

    public int update(PreparedStatementCreator psc, KeyHolder generatedKeyHolder) throws DataAccessException;

    public int update(String sql, @Nullable PreparedStatementSetter pss) throws DataAccessException;

    public int update(String sql, Object[] args, int[] argTypes) throws DataAccessException;

    public int update(String sql, @Nullable Object[] args) throws DataAccessException;

    public int[] batchUpdate(String sql, BatchPreparedStatementSetter pss) throws DataAccessException;

    public int[] batchUpdate(PreparedStatementCreator psc, BatchPreparedStatementSetter pss, KeyHolder generatedKeyHolder) throws DataAccessException;

    public int[] batchUpdate(String sql, List<Object[]> batchArgs) throws DataAccessException;

    public int[] batchUpdate(String sql, List<Object[]> batchArgs, int[] argTypes) throws DataAccessException;

    public <T extends Object> int[][] batchUpdate(String sql, Collection<T> batchArgs, int batchSize, ParameterizedPreparedStatementSetter<T> pss) throws DataAccessException;

    @Nullable
    public <T extends Object> T execute(CallableStatementCreator csc, CallableStatementCallback<T> action) throws DataAccessException;

    @Nullable
    public <T extends Object> T execute(String callString, CallableStatementCallback<T> action) throws DataAccessException;

    public Map<String, Object> call(CallableStatementCreator csc, List<SqlParameter> declaredParameters) throws DataAccessException;
}

