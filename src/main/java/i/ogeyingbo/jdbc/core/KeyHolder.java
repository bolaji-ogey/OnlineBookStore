/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.jdbc.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import java.util.List;
import java.util.Map;
import i.ogeyingbo.dao.InvalidDataAccessApiUsageException;
import i.ogeyingbo.lang.Nullable;

import java.util.List;
import java.util.Map;

public interface KeyHolder {

    @Nullable
    public Number getKey() throws InvalidDataAccessApiUsageException;

    @Nullable
    public <T extends Object> T getKeyAs(Class<T> keyType) throws InvalidDataAccessApiUsageException;

    @Nullable
    public Map<String, Object> getKeys() throws InvalidDataAccessApiUsageException;

    public List<Map<String, Object>> getKeyList();
}

