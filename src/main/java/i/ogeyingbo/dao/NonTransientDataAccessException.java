/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.dao;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import  i.ogeyingbo.lang.Nullable;

public abstract class NonTransientDataAccessException extends DataAccessException {

    public NonTransientDataAccessException(@Nullable String msg) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: invokespecial #1                  // Method org/springframework/dao/DataAccessException."<init>":(Ljava/lang/String;)V
         * 5: return
         *  */
        // </editor-fold>
    }

    public NonTransientDataAccessException(@Nullable String msg, @Nullable Throwable cause) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: aload_2
         * 3: invokespecial #7                  // Method org/springframework/dao/DataAccessException."<init>":(Ljava/lang/String;Ljava/lang/Throwable;)V
         * 6: return
         *  */
        // </editor-fold>
    }
}

