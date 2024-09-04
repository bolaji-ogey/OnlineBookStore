/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap; 

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BillingConfigs   {
    
    
     
      
    
    
    public  static   ArrayList<BillingChargeConfig>   getBillingConfigs(Connection  con, final String inChargeCode){
             
           int index =  0; 
           StringBuilder   sbQuery = new StringBuilder(150);
           Statement    stmnt =    null;
           ResultSet rs = null;
           ArrayList<BillingChargeConfig>   billingConfigs =   new ArrayList<>();
            
           try { 
            
                sbQuery.append(" SELECT   id,  scheme_code,  billing_code,  use_percentage,  biller_id,  wallet_accnt_num ");
                sbQuery.append(" percentage_or_fixedvalue,  lower_trxn_band_perct_or_fixedvalue, "); 
                sbQuery.append(" medium_trxn_band_perct_or_fixedvalue,  upper_trxn_band_perct_or_fixedvalue "); 
                sbQuery.append(" FROM  billing_config  WHERE   charge_code  =  %s ");  
               
                stmnt =    con.createStatement();
                rs = stmnt.executeQuery(String.format(sbQuery.toString(), inChargeCode));
                  
                // Parameters start with 1
                while (rs.next()) {
                    BillingChargeConfig   billingConfig  =  new  BillingChargeConfig(rs.getInt("id"), rs.getString("scheme_code"),
                           rs.getString("billing_code"),  rs.getBoolean("use_percentage"),  rs.getInt("biller_id"),
                            rs.getLong("wallet_accnt_num"),  rs.getBigDecimal("percentage_or_fixedvalue"), 
                            rs.getBigDecimal("lower_trxn_band_perct_or_fixedvalue"),   rs.getBigDecimal("medium_trxn_band_perct_or_fixedvalue"),
                             rs.getBigDecimal("upper_trxn_band_perct_or_fixedvalue"));
                    
                    billingConfigs.add(billingConfig); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
                stmnt = null;   rs = null;
            } 
           return   billingConfigs;
       }
     
      
      
      
     
     
     
    
}
