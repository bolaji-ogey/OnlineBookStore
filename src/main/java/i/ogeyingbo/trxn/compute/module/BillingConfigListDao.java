/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BillingConfigListDao {
    
    
    
    
     public   static  SchemeBillingConfigs  getSchemeBillingConfigs(Connection  con){
        
        SchemeBillingConfigs    schemeBillingConfigs   =  new  SchemeBillingConfigs(); 
        ArrayList<Scheme>   schemes  =   getSchemes(con);
         
            for(int u= 0; u < schemes.size();  u++){
                Scheme   scheme  = schemes.get(u);
                schemeBillingConfigs.put(scheme.getSchemeCode(), getPartnerBillingConfigs( con, scheme.getSchemeCode()));
            }
            
       return   schemeBillingConfigs;
    }
     
    
    
    private   static  PartnerBillingConfigs  getPartnerBillingConfigs(Connection  con, final String inSchemeCode){
        
        PartnerBillingConfigs    partnerBillingConfigs   =  new  PartnerBillingConfigs(); 
         ArrayList<Partner>   partners  =   getPartners(con);
         
            for(int u= 0; u <  partners.size();  u++){
                Partner   partner  = partners.get(u);
                partnerBillingConfigs.put(partner.getPartnerCode(), getBillingConfigTrxnTypes( con, inSchemeCode,  partner.getPartnerCode()));
            }
            
       return   partnerBillingConfigs;
    }
    
    
    
    private   static  BillingConfigTrxnTypes getBillingConfigTrxnTypes(Connection  con, final String inSchemeCode,  
                                                                  final String inPartnerCode){
        
        BillingConfigTrxnTypes    billingConfigTrxnTypes   =  new  BillingConfigTrxnTypes();
        final  String[]    trxnTypes   =   {"WalletToWallet", "WalletToBank", "BankToWallet", ""};
         
            for(int u= 0; u < trxnTypes.length;  u++){
                billingConfigTrxnTypes.put(trxnTypes[u], getBillingConfigListsByTrxnType( con, inSchemeCode,  inPartnerCode, trxnTypes[u]));
            }
            
       return   billingConfigTrxnTypes;
    }
    
    
   
    private   static  BillingConfigList   getBillingConfigListsByTrxnType(Connection  con, final String inSchemeCode,  
                                                                  final String inPartnerCode,  final String  inTrxnType){
             
           int index =  0; 
           StringBuilder   sbQuery = new StringBuilder(150);
           Statement    stmnt =    null;
           ResultSet rs = null;
           
           
           BillingConfigList   billingConfigs =   new BillingConfigList();
            
           try {  
            
                sbQuery.append(" SELECT   id,  billing_code,   partner_code, is_active,  service_id,  service_name, ");
                sbQuery.append("  scheme_code, applicable_trxn_type, trxn_band,  lower_limit_value, upper_limit_value, ");
                sbQuery.append(" use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured,  use_percentage_for_tax,  "); 
                sbQuery.append(" tax_percentage_or_fixedvalue,  tax_charge_cap, use_percentage_for_bank_commission,  "); 
                sbQuery.append(" bank_commission_percentage_or_fixedvalue,  bank_commission_share_cap, use_percentage_for_partner_commission,  "); 
                sbQuery.append(" partner_commission_percentage_or_fixedvalue,  partner_commission_share_cap, bonus_share,  bonus_accelerate "); 
                sbQuery.append(" FROM  billing_charges_config  WHERE   (scheme_code  =  '%s') AND (is_active = true) ");  
                sbQuery.append("   AND  (partner_code  =  '%s')  AND   (applicable_trxn_type = '%s')  ");  
               
                stmnt =    con.createStatement();
                rs = stmnt.executeQuery(String.format(sbQuery.toString(), inSchemeCode, inPartnerCode, inTrxnType));
                  
                // Parameters start with 1
                while (rs.next()) {
                    
                    BillingChargeConfig   billingChargeConfig  =  new  BillingChargeConfig();
                    
                    billingChargeConfig.setId(rs.getLong("id"));
                    billingChargeConfig.setBillingCode(rs.getString("billing_code"));
                    billingChargeConfig.setPartnerCode(rs.getString("partner_code"));
                    billingChargeConfig.setIsActive(rs.getBoolean("is_active"));
                    billingChargeConfig.setServiceId(rs.getString("service_id"));
                    billingChargeConfig.setServiceName(rs.getString("service_name")); 
                    
                    billingChargeConfig.setSchemeCode(rs.getString("scheme_code")); 
                    billingChargeConfig.setAppTrxnType(rs.getString("applicable_trxn_type")); 
                    billingChargeConfig.setTrxnBand(rs.getString("trxn_band")); 
                    
                    billingChargeConfig.setLowerLimitValue(rs.getBigDecimal("lower_limit_value")); 
                    billingChargeConfig.setUpperLimitValue(rs.getBigDecimal("upper_limit_value")); 
                    
                    billingChargeConfig.setUsePercentage(rs.getBoolean("use_percentage"));                      
                    billingChargeConfig.setPercentageOrFixedValue(rs.getBigDecimal("percentage_or_fixedvalue")); 
                    billingChargeConfig.setTrxnChargeCap(rs.getBigDecimal("trxn_charge_cap")); 
                    billingChargeConfig.setDateConfigured(rs.getString("date_configured")); 
                    
                    billingChargeConfig.setUsePercentageForTax(rs.getBoolean("use_percentage_for_tax"));                      
                    billingChargeConfig.setTaxPercentageOrFixedValue(rs.getBigDecimal("tax_percentage_or_fixedvalue")); 
                    billingChargeConfig.setTaxChargeCap(rs.getBigDecimal("tax_charge_cap")); 
                    
                    billingChargeConfig.setUsePercentageForBankCommission(rs.getBoolean("use_percentage_for_bank_commission"));                      
                    billingChargeConfig.setBankCommissionPercentageOrFixedValue(rs.getBigDecimal("bank_commission_percentage_or_fixedvalue")); 
                    billingChargeConfig.setBankCommissionShareCap(rs.getBigDecimal("bank_commission_share_cap")); 
                    
                    billingChargeConfig.setUsePercentageForPartnerCommission(rs.getBoolean("use_percentage_for_partner_commission"));                      
                    billingChargeConfig.setPartnerCommissionPercentageOrFixedValue(rs.getBigDecimal("partner_commission_percentage_or_fixedvalue")); 
                    billingChargeConfig.setPartnerCommissionShareCap(rs.getBigDecimal("partner_commission_share_cap")); 
                     
                    billingChargeConfig.setBonusShare(rs.getBigDecimal("bonus_share")); 
                    billingChargeConfig.setBonusAccelerate(rs.getBoolean("bonus_accelerate"));  
                 
                    billingConfigs.add(billingChargeConfig); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
               stmnt.close();  rs.close();
                stmnt = null;   rs = null;
            } 
           return   billingConfigs;
       }
     
       
    
    
    private    static  ArrayList<Scheme>   getSchemes(Connection  con){
     
           StringBuilder   sbQuery = new StringBuilder(150);
           Statement    stmnt =    null;
           ResultSet rs = null;
            
           ArrayList<Scheme>   schemes =   new ArrayList<>();
            
           try {  
            
                sbQuery.append(" SELECT   id,  scheme_name,  scheme_code, era_id,  use_scheme_key,  pool_bank_code, ");
                sbQuery.append("  pool_account_number, pool_account_balance, pool_account_balance_plain,    ");
                sbQuery.append(" use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured,  use_percentage_for_tax,  "); 
                sbQuery.append(" tax_percentage_or_fixedvalue,  tax_charge_cap, use_percentage_for_bank_commission,  ");  
                sbQuery.append(" FROM  schemes  ");  
               
                stmnt =    con.createStatement();
                rs = stmnt.executeQuery(String.format(sbQuery.toString()));
                  
                // Parameters start with 1
                while (rs.next()) {
                    
                    Scheme   scheme  =  new  Scheme();
                    
                    scheme.setId(rs.getLong("id"));
                    scheme.setSchemeName(rs.getString("billing_code"));
                    scheme.setSchemeCode(rs.getString("partner_code"));
                    scheme.setIsActive(rs.getBoolean("is_active"));
                    scheme.setServiceId(rs.getString("service_id"));
                    scheme.setServiceName(rs.getString("service_name")); 
                     
                    schemes.add(scheme); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
               stmnt.close();  rs.close();
                stmnt = null;   rs = null;
            } 
           return   schemes; 
    }
    
    
    
    
    
     private    static  ArrayList<Partner>   getPartners(Connection  con){
        
          StringBuilder   sbQuery = new StringBuilder(150);
           Statement    stmnt =    null;
           ResultSet rs = null;
            
           ArrayList<Partner>   partners =   new ArrayList<>();
            
           try {  
            
                sbQuery.append(" SELECT   id,  scheme_name,  scheme_code, era_id,  use_scheme_key,  pool_bank_code, ");
                sbQuery.append("  pool_account_number, pool_account_balance, pool_account_balance_plain,    ");
                sbQuery.append(" use_percentage, percentage_or_fixedvalue, trxn_charge_cap, date_configured,  use_percentage_for_tax,  "); 
                sbQuery.append(" tax_percentage_or_fixedvalue,  tax_charge_cap, use_percentage_for_bank_commission,  ");  
                sbQuery.append(" FROM  schemes  ");  
               
                stmnt =    con.createStatement();
                rs = stmnt.executeQuery(String.format(sbQuery.toString()));
                  
                // Parameters start with 1
                while (rs.next()) {
                    
                    Partner   partner  =  new  Partner();
                    
                    partner.setId(rs.getLong("id"));
                    partner.setSchemeName(rs.getString("billing_code"));
                    partner.setSchemeCode(rs.getString("partner_code"));
                    partner.setIsActive(rs.getBoolean("is_active"));
                    partner.setServiceId(rs.getString("service_id"));
                    partner.setServiceName(rs.getString("service_name")); 
                     
                    partners.add(partner); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
               stmnt.close();  rs.close();
                stmnt = null;   rs = null;
            } 
           return   partners; 
    }
     
     
     
     
    
}
