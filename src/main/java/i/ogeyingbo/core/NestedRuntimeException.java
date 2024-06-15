/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.core;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import i.ogeyingbo.lang.Nullable;

public abstract class NestedRuntimeException extends RuntimeException {

    private static final long serialVersionUID = 5439915454935047936L;

    public NestedRuntimeException(@Nullable String msg) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: invokespecial #1                  // Method java/lang/RuntimeException."<init>":(Ljava/lang/String;)V
         * 5: return
         *  */
        // </editor-fold>
    }

    public NestedRuntimeException(@Nullable String msg, @Nullable Throwable cause) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: aload_2
         * 3: invokespecial #2                  // Method java/lang/RuntimeException."<init>":(Ljava/lang/String;Ljava/lang/Throwable;)V
         * 6: return
         *  */
        // </editor-fold>
    }

    @Nullable
    public String getMessage() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #3                  // Method java/lang/RuntimeException.getMessage:()Ljava/lang/String;
         * 4: aload_0
         * 5: invokevirtual #4                  // Method getCause:()Ljava/lang/Throwable;
         * 8: invokestatic  #5                  // Method org/springframework/core/NestedExceptionUtils.buildMessage:(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;
         * 11: areturn
         *  */
        // </editor-fold>
        return "";
    }

    @Nullable
    public Throwable getRootCause() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokestatic  #6                  // Method org/springframework/core/NestedExceptionUtils.getRootCause:(Ljava/lang/Throwable;)Ljava/lang/Throwable;
         * 4: areturn
         *  */
        // </editor-fold>
          return  new Throwable();
    }

    public Throwable getMostSpecificCause() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokevirtual #7                  // Method getRootCause:()Ljava/lang/Throwable;
         * 4: astore_1
         * 5: aload_1
         * 6: ifnull        13
         * 9: aload_1
         * 10: goto          14
         * 13: aload_0
         * 14: areturn
         *  */
        // </editor-fold>
         return  new Throwable();
    }

    public boolean contains(@Nullable Class<?> exType) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_1
         * 1: ifnonnull     6
         * 4: iconst_0
         * 5: ireturn
         * 6: aload_1
         * 7: aload_0
         * 8: invokevirtual #8                  // Method java/lang/Class.isInstance:(Ljava/lang/Object;)Z
         * 11: ifeq          16
         * 14: iconst_1
         * 15: ireturn
         * 16: aload_0
         * 17: invokevirtual #4                  // Method getCause:()Ljava/lang/Throwable;
         * 20: astore_2
         * 21: aload_2
         * 22: aload_0
         * 23: if_acmpne     28
         * 26: iconst_0
         * 27: ireturn
         * 28: aload_2
         * 29: instanceof    #9                  // class org/springframework/core/NestedRuntimeException
         * 32: ifeq          44
         * 35: aload_2
         * 36: checkcast     #9                  // class org/springframework/core/NestedRuntimeException
         * 39: aload_1
         * 40: invokevirtual #10                 // Method contains:(Ljava/lang/Class;)Z
         * 43: ireturn
         * 44: aload_2
         * 45: ifnull        77
         * 48: aload_1
         * 49: aload_2
         * 50: invokevirtual #8                  // Method java/lang/Class.isInstance:(Ljava/lang/Object;)Z
         * 53: ifeq          58
         * 56: iconst_1
         * 57: ireturn
         * 58: aload_2
         * 59: invokevirtual #11                 // Method java/lang/Throwable.getCause:()Ljava/lang/Throwable;
         * 62: aload_2
         * 63: if_acmpne     69
         * 66: goto          77
         * 69: aload_2
         * 70: invokevirtual #11                 // Method java/lang/Throwable.getCause:()Ljava/lang/Throwable;
         * 73: astore_2
         * 74: goto          44
         * 77: iconst_0
         * 78: ireturn
         *  */
        // </editor-fold>
         return  false;
    }
    
    
}
