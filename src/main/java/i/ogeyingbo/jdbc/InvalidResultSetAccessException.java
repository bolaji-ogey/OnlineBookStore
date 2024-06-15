package i.ogeyingbo.jdbc;

import java.sql.SQLException;
import  i.ogeyingbo.dao.InvalidDataAccessResourceUsageException;
import i.ogeyingbo.lang.Nullable;

public class InvalidResultSetAccessException extends InvalidDataAccessResourceUsageException {

    @Nullable
    private final String sql;

    public InvalidResultSetAccessException(String task, String sql, SQLException ex) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: aload_2
         * 3: invokedynamic #1,  0              // InvokeDynamic #0:makeConcatWithConstants:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 8: aload_3
         * 9: invokespecial #5                  // Method org/springframework/dao/InvalidDataAccessResourceUsageException."<init>":(Ljava/lang/String;Ljava/lang/Throwable;)V
         * 12: aload_0
         * 13: aload_2
         * 14: putfield      #11                 // Field sql:Ljava/lang/String;
         * 17: return
         *  */
        // </editor-fold>
    }

    public InvalidResultSetAccessException(SQLException ex) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: invokevirtual #17                 // Method java/sql/SQLException.getMessage:()Ljava/lang/String;
         * 5: aload_1
         * 6: invokespecial #5                  // Method org/springframework/dao/InvalidDataAccessResourceUsageException."<init>":(Ljava/lang/String;Ljava/lang/Throwable;)V
         * 9: aload_0
         * 10: aconst_null
         * 11: putfield      #11                 // Field sql:Ljava/lang/String;
         * 14: return
         *  */
        // </editor-fold>
    }

    @Nullable
    public SQLException getSQLException() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokevirtual #23                 // Method getCause:()Ljava/lang/Throwable;
         * 4: checkcast     #18                 // class java/sql/SQLException
         * 7: areturn
         *  */
        // </editor-fold>
    }

    @Nullable
    public String getSql() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: getfield      #11                 // Field sql:Ljava/lang/String;
         * 4: areturn
         *  */
        // </editor-fold>
    }
}
