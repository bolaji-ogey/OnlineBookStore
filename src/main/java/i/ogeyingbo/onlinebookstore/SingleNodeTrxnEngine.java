/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.onlinebookstore;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import i.ogeyingbo.single.node.wallet.merchant.requests.MerchantPaymentDisbursement;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import org.json.JSONObject;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class SingleNodeTrxnEngine  extends BaseRequest {
    
    protected  String  customerReference = "";
    protected  String  trxnReference = "";
    protected  String  sourceAccountNo = "";
    protected  String  beneficiaryAccountNo = "";
    protected  String  cuurency = "NGN";
    protected  int     trxnPIN  =  -1;
    protected  String  beneficiaryAccountName = "";
    protected  String  beneficiaryBankCode = "";
    protected  String  beneficiaryAccountType = "";
    protected  String  narration = "";
    
    protected  BigDecimal  trxnValueAmount = new BigDecimal(0.00);
    
    protected  String  debitWalletTable = null;
    protected  String  creditWalletTable = null;
    
    
   
    public  void  setTrxnReference(String  inTrxnReference){
        trxnReference  = inTrxnReference;
    }
    
    public  void  setSourceAccountNo(String  inSourceAccountNo){
        sourceAccountNo  = inSourceAccountNo;
    }
    
    public  void  setBeneficiaryAccountNo(String  inBeneficiaryAccountNo){
        beneficiaryAccountNo  = inBeneficiaryAccountNo;
    }
    
    public  void  setTrxnValueAmount(BigDecimal  inTrxnValueAmount){
        trxnValueAmount  = inTrxnValueAmount;
    }
    
    public  void  setDebitWalletTable(String  inDebitWalletTable){
        debitWalletTable  =  inDebitWalletTable;
    }
    
    
    public  void  setCreditWalletTable(String  inCreditWalletTable){
        creditWalletTable  =  inCreditWalletTable;
    }
    
    
    
    
    public  final  JSONObject  convertToJSON(){
        JSONObject  returnedJson =  null;
        ObjectMapper objectMapper = new ObjectMapper();
        try{
             objectMapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
           returnedJson =  new JSONObject(objectMapper.writeValueAsString(this));
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            objectMapper = null;
        }
      return  returnedJson;
    }
    
    
    public  final  String  convertToJSONString(){
        String  returnedJsonString =  null;
        ObjectMapper objectMapper = new ObjectMapper();
        try{
            objectMapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
            returnedJsonString  =   objectMapper.writeValueAsString(this);
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            objectMapper = null;
        }
      return  returnedJsonString;
    }
     
     
   public static  final  SingleNodeTrxnEngine  readFromJSONAndLog(Connection con, final String  inObjectJSON){ 
        SingleNodeTrxnEngine  singleNodeTrxnEngine  =  null;
        ObjectMapper objectMapper = new ObjectMapper();
        try{
              objectMapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
              singleNodeTrxnEngine = objectMapper.readValue(inObjectJSON, SingleNodeTrxnEngine.class);
               //this.logRequest(con, inObjectJSON, true);
            }catch(Exception ex){
            //  this.logRequest(con, inObjectJSON, false);
                  ex.printStackTrace();
            }finally{
               objectMapper = null;
            }
        return  singleNodeTrxnEngine;
    }
     
     
    public  static final  SingleNodeTrxnEngine  readFromJSON(String  inObjectJSON){ 
        SingleNodeTrxnEngine  singleNodeTrxnEngine  =  null;
        ObjectMapper objectMapper = new ObjectMapper();
        try{
              objectMapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
              singleNodeTrxnEngine = objectMapper.readValue(inObjectJSON, SingleNodeTrxnEngine.class);
            }catch(Exception ex){
                  ex.printStackTrace();
            }finally{
               objectMapper = null;
            }
        return  singleNodeTrxnEngine;
    }
      
    
    
    
      
    // STEP 1
    protected    boolean   decryptWalletBalance(Connection    con, String  InWalletAcctNo, 
                                                   String  inWalletTableName,  long  inLogSessionId) {
         
         PreparedStatement ps  =    null; 
         int  countOfRecordsInserted  =  0;
         boolean  isRecordUpdtd  = false; 
         
         /***
         update  test_wallets set current_balance_plain = (select
       cast(PGP_SYM_DECRYPT(decode(current_balance, 'BASE64'),  'AES_KEY') as decimal)   from test_wallets where  id = 4)  where id = 4;
       ***/
         /***
           StringBuilder  SET_WALLET_PLAIN_BAL_SQL =  new StringBuilder(200);
            SET_WALLET_PLAIN_BAL_SQL.append("UPDATE  ?   SET  available_balance_plain  =  (SELECT  ");
           SET_WALLET_PLAIN_BAL_SQL.append("  cast(PGP_SYM_DECRYPT(decode(available_balance, 'BASE64'), 'AES_KEY') as decimal(15,2))  ");
           SET_WALLET_PLAIN_BAL_SQL.append("   FROM  ?  WHERE  (wallet_acct_no = ?)) ");
           SET_WALLET_PLAIN_BAL_SQL.append("  WHERE  (wallet_acct_no = ?)   AND (sys_acct_lock = 'N')  AND (log_session_id  =  -1)  ");
          ***/
           
         StringBuilder  SET_WALLET_PLAIN_BAL_SQL =  new StringBuilder(200);
            SET_WALLET_PLAIN_BAL_SQL.append("UPDATE  ?   SET  available_balance_plain  =  (SELECT  ");
           SET_WALLET_PLAIN_BAL_SQL.append("  cast(PGP_SYM_DECRYPT(decode(available_balance, 'BASE64'), 'AES_KEY') as decimal(15,2))  ");
            SET_WALLET_PLAIN_BAL_SQL.append("   FROM  ?  WHERE  (wallet_acct_no = ?)), ");
           SET_WALLET_PLAIN_BAL_SQL.append("  daily_cummulative_debit_plain   =  ");
            SET_WALLET_PLAIN_BAL_SQL.append(" cast(PGP_SYM_DECRYPT(decode(daily_cummulative_debit, 'BASE64'), 'AES_KEY') as decimal(15,2)) ");
             SET_WALLET_PLAIN_BAL_SQL.append("   FROM  ?  WHERE  (wallet_acct_no = ?)), ");
            SET_WALLET_PLAIN_BAL_SQL.append("  daily_cummulative_credit_plain   =  ");
            SET_WALLET_PLAIN_BAL_SQL.append(" cast(PGP_SYM_DECRYPT(decode(daily_cummulative_credit, 'BASE64'), 'AES_KEY') as decimal(15,2))  ");
            SET_WALLET_PLAIN_BAL_SQL.append("   FROM  ?  WHERE  (wallet_acct_no = ?)) ");
           SET_WALLET_PLAIN_BAL_SQL.append("  WHERE  (wallet_acct_no = ?)   AND (sys_acct_lock = 'N')  AND (log_session_id  =  -1)  ");
            
          
            try { 
                   
                        ps = con.prepareStatement(String.format(SET_WALLET_PLAIN_BAL_SQL.toString()));
                                 
                        ps.setString(1, inWalletTableName); 
                        ps.setString(2, inWalletTableName);
                        ps.setString(3, InWalletAcctNo);
                        ps.setString(4, inWalletTableName);
                        ps.setString(5, InWalletAcctNo);
                        ps.setString(6, inWalletTableName);
                        ps.setString(7, InWalletAcctNo);
                        ps.setString(8, InWalletAcctNo); 
                        

                        isRecordUpdtd  =  (ps.executeUpdate() == 1);    
                                           
            } catch (Exception e) {
                e.printStackTrace();
            }finally{ 
                SET_WALLET_PLAIN_BAL_SQL  = null;
                try{
                    ps = null;
                }catch(Exception er){
                    er.printStackTrace();
                }
            }
        return  isRecordUpdtd;
    }
      
        
    
    
    
     // STEP  2  -- Pre-Value Transaction
    private    String    getDebitTrxnQuery() {
         
        StringBuilder  UPDATE_WALLET_BAL_SQL =  new StringBuilder(200);
            UPDATE_WALLET_BAL_SQL.append("UPDATE  ?   SET  available_balance_plain  =  (available_balance_plain - ? ), "); 
            UPDATE_WALLET_BAL_SQL.append(" available_balance   =  '_', "); 
            UPDATE_WALLET_BAL_SQL.append("  daily_cummulative_debit_plain   =   daily_cummulative_debit_plain  + 1,  "); 
            UPDATE_WALLET_BAL_SQL.append("   debit_count   =   debit_count  + 1   "); 
            UPDATE_WALLET_BAL_SQL.append("    WHERE  (wallet_acct_no = ?) AND (log_session_id  =  ?)   ");
             UPDATE_WALLET_BAL_SQL.append("  AND (sys_acct_lock = 'N' AND (available_balance_plain >=  ?) ");
          
             return   UPDATE_WALLET_BAL_SQL.toString();
    }
           
    
    
    
    
    
    
     // STEP  2  -- Pre-Value Transaction
    private    String   getCreditTrxnQuery() {
          
         StringBuilder  UPDATE_WALLET_BAL_SQL =  new StringBuilder(200);
            UPDATE_WALLET_BAL_SQL.append("UPDATE  ?   SET  available_balance_plain  =  (available_balance_plain + ? ), "); 
            UPDATE_WALLET_BAL_SQL.append(" available_balance   =  '_', "); 
            UPDATE_WALLET_BAL_SQL.append("  daily_cummulative_credit_plain   =   daily_cummulative_credit_plain  + 1,  "); 
            UPDATE_WALLET_BAL_SQL.append("   credit_count   =   credit_count  + 1   "); 
            UPDATE_WALLET_BAL_SQL.append("    WHERE  (wallet_acct_no = ?) AND (log_session_id  =  ?) AND (sys_acct_lock = 'N'  "); 
          
           return  UPDATE_WALLET_BAL_SQL.toString();
    }
    
    
    
    
     // STEP 3
    protected    boolean   encryptWalletBalance(Connection    con, String  InWalletAcctNo, 
                                                   String  inWalletTableName,  long  inLogSessionId) {
         
         PreparedStatement ps  =    null; 
         int  countOfRecordsInserted  =  0;
         boolean  isRecordUpdtd  = false; 
         /**
        update  test_wallets  set  current_balance = (select  encode(PGP_SYM_ENCRYPT(cast(current_balance_plain as text),'AES_KEY'), 'BASE64')::text 
          from test_wallets where  id = 4)  where id = 4; 
         **/
          /**
            StringBuilder  SET_WALLET_PLAIN_BAL_SQL =  new StringBuilder(200);
            SET_WALLET_PLAIN_BAL_SQL.append("UPDATE  ?   SET  available_balance   =   (SELECT ");
           SET_WALLET_PLAIN_BAL_SQL.append("  encode(PGP_SYM_ENCRYPT(cast(available_balance_plain as text), 'BASE64'), 'AES_KEY')::text "); 
            SET_WALLET_PLAIN_BAL_SQL.append("  FROM  ?  WHERE (wallet_acct_no = ?))  WHERE  (wallet_acct_no = ?) AND (log_session_id  =  ?) AND (sys_acct_lock = 'N') ");
           **/
          
         StringBuilder  SET_WALLET_PLAIN_BAL_SQL =  new StringBuilder(200);
         
            SET_WALLET_PLAIN_BAL_SQL.append("UPDATE  ?   SET  available_balance   =   (SELECT ");
           SET_WALLET_PLAIN_BAL_SQL.append("  encode(PGP_SYM_ENCRYPT(cast(available_balance_plain as text), 'BASE64'), 'AES_KEY')::text ");
             SET_WALLET_PLAIN_BAL_SQL.append("  FROM  ?  WHERE  (wallet_acct_no = ?)), ");
           SET_WALLET_PLAIN_BAL_SQL.append("  daily_cummulative_debit  =  (SELECT  ");
            SET_WALLET_PLAIN_BAL_SQL.append(" encode(PGP_SYM_ENCRYPT(cast(daily_cummulative_debit_plain as text), 'BASE64'), 'AES_KEY')::text ");
              SET_WALLET_PLAIN_BAL_SQL.append("  FROM  ?  WHERE  (wallet_acct_no = ?)), ");
            SET_WALLET_PLAIN_BAL_SQL.append("  daily_cummulative_credit  =  (SELECT  ");
            SET_WALLET_PLAIN_BAL_SQL.append("  encode(PGP_SYM_ENCRYPT(cast(daily_cummulative_credit_plain as text), 'BASE64'), 'AES_KEY')::text ");
            SET_WALLET_PLAIN_BAL_SQL.append("  FROM  ?  WHERE  (wallet_acct_no = ?)),   SET   log_session_id  =  -1  ");
            SET_WALLET_PLAIN_BAL_SQL.append(" WHERE  (wallet_acct_no = ?)   AND (sys_acct_lock = 'N') ");
          
            try { 
                   
                        ps = con.prepareStatement(String.format(SET_WALLET_PLAIN_BAL_SQL.toString()));
                                 
                        ps.setString(1, inWalletTableName); 
                        ps.setString(2, inWalletTableName);
                        ps.setString(3, InWalletAcctNo);
                        ps.setString(4, inWalletTableName); 
                        ps.setString(5, InWalletAcctNo);
                        ps.setString(6, inWalletTableName); 
                        ps.setString(7, InWalletAcctNo);
                        ps.setString(8, InWalletAcctNo);                                                                                                                                                                                                                                                                          
                        

                        isRecordUpdtd  =  (ps.executeUpdate() == 1);    
                                           
            } catch (Exception e) {
                e.printStackTrace();
            }finally{ 
                SET_WALLET_PLAIN_BAL_SQL  = null;
                try{
                    ps = null;
                }catch(Exception er){
                    er.printStackTrace();
                }
            }
        return  isRecordUpdtd;
    }
      
     
    
    
    
    
    
    
    public    boolean   doInstantNodeTranxact(Connection    con, String  inWalletTableName,   long  inLogSessionId) {
         
         PreparedStatement psDr  =    null;
         PreparedStatement psCr  =    null;
         int  countOfRecordsInserted  =  0;
         boolean  isDrRecordInserted  = false; 
         boolean  isCrRecordInserted  = false;
         
         boolean  isRecordInserted = false;
           
         
            try { 
                
                      decryptWalletBalance(con,  sourceAccountNo,  inWalletTableName,  inLogSessionId);                                                   
                      decryptWalletBalance(con,  beneficiaryAccountNo,  inWalletTableName,  inLogSessionId);
                       
                       con.setAutoCommit(false);
                       
                       // conducting credit trxn . . . .
                       psDr = con.prepareStatement(getDebitTrxnQuery());
                                 
                            psDr.setString(1, inWalletTableName); 
                            psDr.setBigDecimal(2, trxnValueAmount);
                            psDr.setString(3, sourceAccountNo); 
                            psDr.setLong(4, inLogSessionId);                                                                                                                                                                                                                                                                                                                                                                
                            psDr.setBigDecimal(5, trxnValueAmount);

                        isDrRecordInserted  =  (psDr.executeUpdate() == 1);  
                        
                        if(isDrRecordInserted == true){
                            
                              psCr = con.prepareStatement(getCreditTrxnQuery());
                                 
                                psCr.setString(1, inWalletTableName); 
                                psCr.setBigDecimal(2, trxnValueAmount);
                                psCr.setString(3, beneficiaryAccountNo); 
                                psCr.setLong(4, inLogSessionId);   

                               isCrRecordInserted  =  (psCr.executeUpdate() == 1);                            
                        }
                        
                        isRecordInserted  =  isDrRecordInserted && isCrRecordInserted;
                        
                        con.setAutoCommit(true);
                        
                        encryptWalletBalance(con,  sourceAccountNo,  inWalletTableName,  inLogSessionId);                                                   
                        encryptWalletBalance(con,  beneficiaryAccountNo,  inWalletTableName,  inLogSessionId);
                                           
            } catch (Exception e) {
                try{
                    con.setAutoCommit(true);
                }catch(Exception exr){
                    exr.printStackTrace();
                }
                e.printStackTrace();
            }finally{ 
                try{
                    con.setAutoCommit(true);
                    psCr = null;   psDr = null;
                }catch(Exception er){
                    er.printStackTrace();
                }
            }
        return  isRecordInserted;
    }
    
        
    
}
