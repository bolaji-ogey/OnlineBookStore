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
import i.ogeyingbo.lang.Nullable;
 

public class SqlParameter {

    @Nullable
    private String name;
    private final int sqlType = 0;
    @Nullable
    private String typeName;
    @Nullable
    private Integer scale;

    public SqlParameter(int sqlType) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_0
         * 5: iload_1
         * 6: putfield      #7                  // Field sqlType:I
         * 9: return
         *  */
        // </editor-fold>
    }

    public SqlParameter(int sqlType, @Nullable String typeName) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_0
         * 5: iload_1
         * 6: putfield      #7                  // Field sqlType:I
         * 9: aload_0
         * 10: aload_2
         * 11: putfield      #13                 // Field typeName:Ljava/lang/String;
         * 14: return
         *  */
        // </editor-fold>
    }

    public SqlParameter(int sqlType, int scale) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_0
         * 5: iload_1
         * 6: putfield      #7                  // Field sqlType:I
         * 9: aload_0
         * 10: iload_2
         * 11: invokestatic  #17                 // Method java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
         * 14: putfield      #23                 // Field scale:Ljava/lang/Integer;
         * 17: return
         *  */
        // </editor-fold>
    }

    public SqlParameter(String name, int sqlType) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_0
         * 5: aload_1
         * 6: putfield      #27                 // Field name:Ljava/lang/String;
         * 9: aload_0
         * 10: iload_2
         * 11: putfield      #7                  // Field sqlType:I
         * 14: return
         *  */
        // </editor-fold>
    }

    public SqlParameter(String name, int sqlType, @Nullable String typeName) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_0
         * 5: aload_1
         * 6: putfield      #27                 // Field name:Ljava/lang/String;
         * 9: aload_0
         * 10: iload_2
         * 11: putfield      #7                  // Field sqlType:I
         * 14: aload_0
         * 15: aload_3
         * 16: putfield      #13                 // Field typeName:Ljava/lang/String;
         * 19: return
         *  */
        // </editor-fold>
    }

    public SqlParameter(String name, int sqlType, int scale) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_0
         * 5: aload_1
         * 6: putfield      #27                 // Field name:Ljava/lang/String;
         * 9: aload_0
         * 10: iload_2
         * 11: putfield      #7                  // Field sqlType:I
         * 14: aload_0
         * 15: iload_3
         * 16: invokestatic  #17                 // Method java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
         * 19: putfield      #23                 // Field scale:Ljava/lang/Integer;
         * 22: return
         *  */
        // </editor-fold>
    }

    public SqlParameter(SqlParameter otherParam) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         * 4: aload_1
         * 5: ldc           #30                 // String SqlParameter object must not be null
         * 7: invokestatic  #32                 // Method org/springframework/util/Assert.notNull:(Ljava/lang/Object;Ljava/lang/String;)V
         * 10: aload_0
         * 11: aload_1
         * 12: getfield      #27                 // Field name:Ljava/lang/String;
         * 15: putfield      #27                 // Field name:Ljava/lang/String;
         * 18: aload_0
         * 19: aload_1
         * 20: getfield      #7                  // Field sqlType:I
         * 23: putfield      #7                  // Field sqlType:I
         * 26: aload_0
         * 27: aload_1
         * 28: getfield      #13                 // Field typeName:Ljava/lang/String;
         * 31: putfield      #13                 // Field typeName:Ljava/lang/String;
         * 34: aload_0
         * 35: aload_1
         * 36: getfield      #23                 // Field scale:Ljava/lang/Integer;
         * 39: putfield      #23                 // Field scale:Ljava/lang/Integer;
         * 42: return
         *  */
        // </editor-fold>
    }

    @Nullable
    public String getName() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: getfield      #27                 // Field name:Ljava/lang/String;
         * 4: areturn
         *  */
        // </editor-fold>
    }

    public int getSqlType() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: getfield      #7                  // Field sqlType:I
         * 4: ireturn
         *  */
        // </editor-fold>
    }

    @Nullable
    public String getTypeName() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: getfield      #13                 // Field typeName:Ljava/lang/String;
         * 4: areturn
         *  */
        // </editor-fold>
    }

    @Nullable
    public Integer getScale() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: getfield      #23                 // Field scale:Ljava/lang/Integer;
         * 4: areturn
         *  */
        // </editor-fold>
    }

    public boolean isInputValueProvided() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: iconst_1
         * 1: ireturn
         *  */
        // </editor-fold>
    }

    public boolean isResultsParameter() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: iconst_0
         * 1: ireturn
         *  */
        // </editor-fold>
    }

    public static List<SqlParameter> sqlTypesToAnonymousParameterList(@Nullable int[] types) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: ifnonnull     12
         * 4: new           #38                 // class java/util/ArrayList
         * 7: dup
         * 8: invokespecial #40                 // Method java/util/ArrayList."<init>":()V
         * 11: areturn
         * 12: new           #38                 // class java/util/ArrayList
         * 15: dup
         * 16: aload_0
         * 17: arraylength
         * 18: invokespecial #41                 // Method java/util/ArrayList."<init>":(I)V
         * 21: astore_1
         * 22: aload_0
         * 23: astore_2
         * 24: aload_2
         * 25: arraylength
         * 26: istore_3
         * 27: iconst_0
         * 28: istore        4
         * 30: iload         4
         * 32: iload_3
         * 33: if_icmpge     64
         * 36: aload_2
         * 37: iload         4
         * 39: iaload
         * 40: istore        5
         * 42: aload_1
         * 43: new           #8                  // class org/springframework/jdbc/core/SqlParameter
         * 46: dup
         * 47: iload         5
         * 49: invokespecial #44                 // Method "<init>":(I)V
         * 52: invokeinterface #45,  2           // InterfaceMethod java/util/List.add:(Ljava/lang/Object;)Z
         * 57: pop
         * 58: iinc          4, 1
         * 61: goto          30
         * 64: aload_1
         * 65: areturn
         *  */
        // </editor-fold>
    }
}
