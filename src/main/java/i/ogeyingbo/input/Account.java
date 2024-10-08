/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.input;

import java.math.BigDecimal;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class Account {
    
    private  long id = 1L;
    private  String  entryDate = "";
    private  String  refAccount = "";
    private  String  trxnDate = "";
    
    private  String  description = "";
    private  BigDecimal  debit = new BigDecimal(0.00);
    private  BigDecimal  credit = new BigDecimal(0.00);
    
    private  boolean isReconcilled  =   false;
    
    
    
    public  void  setId(long  inId){
        id = inId;
    }
    
    
    public  void  setEntryDate(String  inEntryDate){
        entryDate = inEntryDate;
    }
    
    public  void  setRefAccount(String  inRefAccount){
        refAccount = inRefAccount;
    }
    
    
    public  void  setTrxnDate(String  inTrxnDate){
        trxnDate = inTrxnDate;
    }
    
    public  void  setDescription(String  inDescription){
        description = inDescription;
    }
    
    
    public  void  setDebit(BigDecimal  inDebit){
        debit = inDebit;
    }
    
    
    public  void  setCredit(BigDecimal  inCredit){
        credit = inCredit;
    }
    
    
    public  void  setIsReconcilled(boolean  inIsReconcilled){
        isReconcilled = inIsReconcilled;
    }
    
    
    
}
