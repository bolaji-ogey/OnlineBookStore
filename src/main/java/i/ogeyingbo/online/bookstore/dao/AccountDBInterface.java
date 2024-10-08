/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;

import i.ogeyingbo.input.Account;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class AccountDBInterface {
    
    
     private   static  final   PGDataSource   pgDataSource  = PGDataSource.getInstance("Accounts");
    
    private  static  AccountDBInterface   accountDBInterface; 
    
    
    public static  AccountDBInterface  getInstance()
    {
        if (accountDBInterface == null)
        {
            synchronized (AccountDBInterface.class)
            {
                accountDBInterface = new AccountDBInterface();
            } 
        }
        return   accountDBInterface;
    }
   
    
    private   AccountDBInterface(){}
    
    
    public  static  void  main(String[]  args){ 
        //System.out.println(""+PGDataRetriever.convertDateOfBirth("04/13/2023"));
    }
    
     
        
    public  static  String  getAccountTableName(String  inAction){
         
       String  accountTable = switch (inAction) {
             case "purchase" -> "purchases_acc";
             case "sold" -> "sales_acc";
             case "return_in" -> "return_inwards_acc";
             case "return_out" -> "return_outwards_acc";
             case "purchase_credit" -> "payables_acc";
             case "sold_credit" -> "recievables_acc";
             case "capital" -> "capital_acc";
             case "bank" -> "bank_acc";
             case "cash" -> "cash_acc";
             case "furniture" -> "furniture_acc";
             case "vehicle" -> "vehicle_acc";
             default -> "";
         };
       return  accountTable;
    }
    
    
    
    public    int     doAccountEntry(String  inAccountTable, String  inTrxnDate,  String inDescription,  BigDecimal  inAccountEntryValue){
          
           StringBuilder   updateQuery = new StringBuilder(200);
           PreparedStatement    prepStmnt1 =    null;
           PreparedStatement    prepStmnt =    null; 
           int   resultCount  =  0;
           Connection  cron   = null;
           
            
           try { 
                 
                    updateQuery.append(" INSERT INTO   ").append(inAccountTable);
                    updateQuery.append("entry_date,  trxn_date, description, "); 
                    updateQuery.append(" debit, credit, ");   
                    updateQuery.append(" is_reconcilled ");   
                    updateQuery.append(" values (current_date, ?, ?, ?, ?) "); 

                    System.out.println("cron = "+cron);

                    prepStmnt =    cron.prepareStatement(updateQuery.toString());

                    prepStmnt.setString(1, inTrxnDate);
                    prepStmnt.setString(2, inDescription);
                    prepStmnt.setBigDecimal(3, inAccountEntryValue); 
                    prepStmnt.setBoolean(4, false);  

                    resultCount = prepStmnt.executeUpdate();
                     
               // custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                 
                e.printStackTrace();
            }  finally{ 
               updateQuery = null; 
                 try{
                     if(prepStmnt !=  null){
                        prepStmnt.cancel();
                        prepStmnt.close();
                    } 
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   resultCount;
       }
  
  
  
  
  
    
  
     
    
  public     ArrayList<Account>    getAccount(String inAccountTableEntry){
          
           Statement     stmnt =    null; 
           ResultSet row = null;
           ArrayList<Account>  accountList =  new   ArrayList<>(); 
           Connection  cron   = null;
           
            
           try {  
               
                StringBuilder    selectQuery  =  new  StringBuilder(200);
                selectQuery.append(" SELECT  id,  entry_date, ref_account,  trxn_date, description, "); 
                selectQuery.append(" debit, credit, is_reconcilled "); 
                selectQuery.append("  FROM  ").append(inAccountTableEntry);  
  
                cron   =  pgDataSource.getConnect();                
                System.out.println("cron = "+cron);
                
                stmnt =    cron.createStatement();
              
                row = stmnt.executeQuery(selectQuery.toString());
                  
                        // Parameters start with 1
                        while (row.next()) {

                            Account   account  =  new  Account();
                        
                            account.setId( row.getInt("id")); 
                            account.setEntryDate(row.getString("entry_date").trim());
                            account.setRefAccount(row.getString("ref_account").trim());
                            account.setTrxnDate(row.getString("trxn_date").trim());
                            account.setDescription(row.getString("description").trim());
                            account.setDebit(row.getBigDecimal("debit"));
                            account.setCredit(row.getBigDecimal("credit")); 
                            account.setIsReconcilled(row.getBoolean("is_reconcilled")); 
                            
                            accountList.add(account);

                        } 
                      
                  System.out.println("Accounts >>>> "+accountList.size());
               // custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                 
                e.printStackTrace();
            }  finally{ 
               //selectQuery = null;
                 try{
                     if(stmnt !=  null){
                        stmnt.cancel();
                        stmnt.close();
                    }
                    
                    if(row != null){
                        row.close();
                    } 
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   accountList;
       }
     
  
  
       
    
}
