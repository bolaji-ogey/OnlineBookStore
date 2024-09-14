/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class TransactionHandler {
    
    
    
     public   String   getPendingTrxnQuery(){
        
        StringBuilder   pendingTrxnQuery  =  new  StringBuilder(200);
        
        pendingTrxnQuery.append(" UPDATE   user_profile   SET  wallet_balance  =   wallet_balance  -  ? ");
        pendingTrxnQuery.append(" WHERE  username = ?  AND  user_password   = ?   AND  wallet_balance >=  ?  ");
        
        return  pendingTrxnQuery.toString();
    }
     
     
    
    public   String   getPaymentWalletQuery(){
        
        StringBuilder   walletUpdtQuery  =  new  StringBuilder(200);
        
        walletUpdtQuery.append(" UPDATE   user_profile   SET  wallet_balance  =   wallet_balance  -  ? ");
        walletUpdtQuery.append(" WHERE  username = ?  AND  user_password   = ?   AND  wallet_balance >=  ?  ");
        
        return  walletUpdtQuery.toString();
    }
    
    
    
    public   String   getPaymentTrxnHistQuery(){
        
        StringBuilder   paymntTrxnHistQuery  =  new  StringBuilder(200);
        
        paymntTrxnHistQuery.append(" UPDATE   user_profile   SET  wallet_balance  =   wallet_balance  -  ? ");
        paymntTrxnHistQuery.append(" WHERE  username = ?  AND  user_password   = ?   AND  wallet_balance >=  ?  ");
        
        return  paymntTrxnHistQuery.toString();
    }
    
    
    
    public   String   getPaymentJournalQuery(){
        
        StringBuilder   paymntJournalQuery  =  new  StringBuilder(200);
        
        paymntJournalQuery.append(" UPDATE   user_profile   SET  wallet_balance  =   wallet_balance  -  ? ");
        paymntJournalQuery.append(" WHERE  username = ?  AND  user_password   = ?   AND  wallet_balance >=  ?  ");
        
        return  paymntJournalQuery.toString();
    }
    
    
    
    public   String   getPaymentJournalLineQuery(){
        
        StringBuilder   paymntJournalLineQry  =  new  StringBuilder(200);
        
        paymntJournalLineQry.append(" INSERT INTO journal_line  () ");
        paymntJournalLineQry.append(" WHERE  username = ?  AND  user_password   = ?   AND  wallet_balance >=  ?  ");
        
        return  paymntJournalLineQry.toString();
    }
    
    
    
    
    
    
}
