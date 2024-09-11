/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module.old.archive;
 
import i.ogeyingbo.online.bookstore.dao.PGDataRetriever;
import i.ogeyingbo.online.bookstore.dao.PGDataSource;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BillingConfigListDao {
    
    
    private   static  final   PGDataSource   pgDataSource  = PGDataSource.getInstance();
    
    private  static  BillingConfigListDao   billingConfigListDao; 
    
    
    public static  BillingConfigListDao  getInstance()
    {
        if (billingConfigListDao == null)
        {
            synchronized (BillingConfigListDao.class)
            {
                billingConfigListDao = new BillingConfigListDao();
            } 
        }
        return   billingConfigListDao;
    }
   
    
    private   BillingConfigListDao(){}
    
    
    
    public  static  void  main(String[]   args){
        
        BillingConfigListDao   billingConfigListDao  =   BillingConfigListDao.getInstance();
        
        try{
           BillingConfigList   billingConfigs  =  billingConfigListDao
                                                   .getBillingConfigListsByTrxnType(pgDataSource.getConnect(), 
                                   "ndoadndadd",  "jahddd",  "WalletToBank");
           
           System.out.println(billingConfigs.size());
           
          BillingChargeConfig    billingChargeConfig  =  billingConfigs.get(0); 
          TrxnCharge    trxnCharge  =  billingChargeConfig.computeAndGetTrxnCharges(new BigDecimal(4999.00));
          
          if(trxnCharge !=  null){
                System.out.println("Income  = "+trxnCharge.getIncome()+"\n\n");

                System.out.println("Total Trxn Charges = "+trxnCharge.getTotalCharges());
                System.out.println("Tax Charge = "+trxnCharge.getTaxCharge());
                System.out.println("Bank Commission = "+trxnCharge.getBankCommission());
                System.out.println("Partner Commission = "+trxnCharge.getPartnerCommission()+"\n\n"); 
                System.out.println("Income = "+trxnCharge.getIncome());
                
                 System.out.println("Save and Invest per spend = "+trxnCharge.getSaveInvestPerSpend());

                System.out.println("Test DIVIDE = "+(new BigDecimal(500.00).divide(new BigDecimal(20.00))));
                System.out.println("Test MULTIPLE = "+(new BigDecimal(80.00)).multiply((new BigDecimal(20.00).divide(new BigDecimal(500.00)))));
           }
        }catch(Exception  ex){
            ex.printStackTrace();
        }
    }
    
    
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
                sbQuery.append(" partner_commission_percentage_or_fixedvalue,  partner_commission_share_cap,  use_save_invest_percentage, "); 
                sbQuery.append(" save_invest_percentage_or_fixedvalue,  minimum_save_invest, save_invest_cap, bonus_share,  bonus_accelerate "); 
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
                    
                    billingChargeConfig.setUseSaveInvestPercentage(rs.getBoolean("use_save_invest_percentage"));                      
                    billingChargeConfig.setSaveInvestPercentageOrFixedValue(rs.getBigDecimal("save_invest_percentage_or_fixedvalue")); 
                    billingChargeConfig.setMinimumSaveInvest(rs.getBigDecimal("minimum_save_invest")); 
                    billingChargeConfig.setSaveInvestCap(rs.getBigDecimal("save_invest_cap")); 
                     
                    billingChargeConfig.setBonusShare(rs.getBigDecimal("bonus_share")); 
                    billingChargeConfig.setBonusAccelerate(rs.getBoolean("bonus_accelerate"));  
                 
                    billingConfigs.add(billingChargeConfig); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
               try{  stmnt.close();  rs.close();  }catch(Exception ex){  ex.printStackTrace();  }
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
                sbQuery.append(" scheme_encry_key, last_trxn_bank_posting_date, last_trxn_bank_posting_time,  "); 
                sbQuery.append(" scheme_create_date, api_key, secret_key,  call_back_url,  is_active,  promotions,   ");  
                sbQuery.append(" make_scheme_incur_customer_charges  FROM  schemes  ");  
               
                stmnt =    con.createStatement();
                rs = stmnt.executeQuery(String.format(sbQuery.toString()));
                  
                // Parameters start with 1
                while (rs.next()) {
                    
                    Scheme   scheme  =  new  Scheme();
                    
                    scheme.setId(rs.getLong("id"));
                    scheme.setSchemeName(rs.getString("scheme_name"));
                    scheme.setSchemeCode(rs.getString("scheme_code"));
                    scheme.setEraId(rs.getInt("era_id"));
                    scheme.setUseSchemeKey(rs.getBoolean("use_scheme_key"));
                    scheme.setPoolBankCode(rs.getString("pool_bank_code"));
                    scheme.setPoolAccountNumber(rs.getString("pool_account_number")); 
                    
                    scheme.setPoolAccountBalance(rs.getString("pool_account_balance"));
                    scheme.setPoolAccountBalancePlain(rs.getBigDecimal("pool_account_balance_plain"));
                    
                    scheme.setSchemeEncryKey(rs.getString("scheme_encry_key")); 
                    scheme.setCallBackUrl(rs.getString("call_back_url")); 
                    scheme.setIsActive(rs.getBoolean("is_active")); 
                    
                    scheme.setPromotions(rs.getInt("promotions")); 
                    scheme.setMakeSchemeIncurCustomerCharges(rs.getBoolean("make_scheme_incur_customer_charges")); 
                     
                    schemes.add(scheme); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
               try{  stmnt.close();  rs.close();  }catch(Exception ex){  ex.printStackTrace();  }
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
            
                sbQuery.append(" SELECT   id,  partner_code,  partner_name, partner_pool_bank_code, ");
                sbQuery.append("  partner_pool_bank, pool_accpartner_pool_account_number,  ount_balance,  ");
                sbQuery.append(" partner_rc_number,   is_active,  ");    
                sbQuery.append(" FROM  partners  ");  
               
                stmnt =    con.createStatement();
                rs = stmnt.executeQuery(String.format(sbQuery.toString()));
                  
                // Parameters start with 1
                while (rs.next()) {
                    
                    Partner   partner  =  new  Partner();
                     
                    partner.setId(rs.getLong("id"));
                    partner.setPartnerCode(rs.getString("partner_code"));
                    partner.setPartnerName(rs.getString("partner_name"));
                    partner.setPartnerPoolBankCode(rs.getString("partner_pool_bank_code"));
                    
                    partner.setPartnerPoolBank(rs.getString("partner_pool_bank"));
                    partner.setPartnerPoolAccountNumber(rs.getString("partner_pool_account_number"));
                    partner.setPartnerRcNumber(rs.getString("partner_rc_number"));
                    partner.setIsActive(rs.getBoolean("is_active"));
                    
                    partners.add(partner); 
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
               try{  stmnt.close();  rs.close();  }catch(Exception ex){  ex.printStackTrace();  }
                stmnt = null;   rs = null;
            } 
           return   partners; 
    }
     
     
     
     
    
}
