/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module;

import java.math.BigDecimal;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BillingChargeConfig {
    
    private   long  id   = -1;
    
    private   String  billingCode;
    private   String  billingReference;
    private   boolean  isActive = false;
    private   String  serviceId; 
    
    private   String  serviceName; 
    private   String  schemeCode; 
    private   String  appTrxnType; 
    private   String  trxnBand; 
    
    private   BigDecimal  lowerLimitValue =  new  BigDecimal(0.00); 
    private   BigDecimal  upperLimitValue =  new  BigDecimal(0.00);  
    
    private   boolean     usePercentage  =  false; 
    private   BigDecimal  percentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  trxnChargeCap =  new  BigDecimal(0.00);
    
    private   String      dateCOnfigured; 
    
    private   boolean     usePercentageForTax  =  false; 
    private   BigDecimal  taxPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  taxChargeCap =  new  BigDecimal(0.00);
    
    private   boolean     usePercentageForBankCommission  =  false; 
    private   BigDecimal  bankCommissionPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  bankCommissionShareCap =  new  BigDecimal(0.00);
    
    private   boolean     usePercentageForPartnerCommission  =  false; 
    private   BigDecimal  partnerCommissionPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  partnerCommissionShareCap =  new  BigDecimal(0.00);
    
    private   BigDecimal  bonusShare =  new  BigDecimal(0.00);
    private   boolean    bonusAccelerate  =  false; 
     
    
    
    
    
    public  TrxnCharge    computeAndGetTrxnCharges(BigDecimal   inTrxnAmount){
        
        TrxnCharge   trxnCharges   = new  TrxnCharge();
                
        BigDecimal    totalCharge  =  computeAndGetTotalTrxnCharge(inTrxnAmount).getChargValue();
        BigDecimal    taxCharge  =  computeAndGetTaxCharge(totalCharge).getChargValue();
        BigDecimal    bankCommission  =  computeAndGetBankCommission(totalCharge).getChargValue();
        BigDecimal    partnerCommission  =  computeAndGetPartnerCommission(totalCharge).getChargValue();
        
        BigDecimal    loyaltyBonus  =  computeAndGetPartnerCommission(totalCharge).getChargValue();
        
        trxnCharges.setTotalCharges(totalCharge);
        trxnCharges.setTaxCharge(taxCharge);
        trxnCharges.setBankCommission(bankCommission);
        trxnCharges.setPartnerCommission(partnerCommission);
        
        trxnCharges.setLoyaltyBonus(loyaltyBonus);
        
        trxnCharges.setIncome(totalCharge.subtract(taxCharge.add(bankCommission)
                                             .add(partnerCommission).add(loyaltyBonus)));
        
        return   trxnCharges;
    }
    
    
    
    
     
    private  TrxnChargeObject   computeAndGetTotalTrxnCharge(BigDecimal   inTrxnAmount){
        
        BigDecimal trxnAmount  =  inTrxnAmount;
        BigDecimal trxnChargeBalance = null;
        BigDecimal  totalChargeValue  =  new BigDecimal(0.00); 
        
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
        
        // Confirm Transaction amount is within range
         if((trxnAmount.compareTo(lowerLimitValue) == 1) && (trxnAmount .compareTo(upperLimitValue) == -1)){
             
             // COmpute total Charges
              if(percentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(usePercentage == true){
                      totalChargeValue  =  trxnAmount.multiply(percentageOrFixedValue.divide(new BigDecimal(100.00)));
                      if((totalChargeValue.compareTo(trxnChargeCap)  == 1) || (trxnChargeCap.compareTo(new BigDecimal(0.00)) == 0)){
                          trxnChargeObject.setChargValue(trxnChargeCap);
                      }else{   trxnChargeObject.setChargValue(totalChargeValue);  }
                  }else{
                      if(percentageOrFixedValue.compareTo(trxnChargeCap)  == 1) {
                            trxnChargeObject.setChargValue(trxnChargeCap);
                      }else{   trxnChargeObject.setChargValue(percentageOrFixedValue);  }                    
                  }
              } 
            trxnChargeObject.setIsComputed(true);
         } 
      return   trxnChargeObject;      
    }
    
    
    
    
    
    private  TrxnChargeObject   computeAndGetTaxCharge(BigDecimal   inTotalTrxnCharge){
         
        BigDecimal computedTaxCharge = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge; 
         
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
            // COmpute tax Charge
             if(taxPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForTax == true){
                     computedTaxCharge  =  totalChargeValue.multiply(taxPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedTaxCharge.compareTo(taxChargeCap)  == 1) || (taxChargeCap.compareTo(new BigDecimal(0.00)) == 0)){
                         trxnChargeObject.setChargValue(taxChargeCap);
                     }else{   trxnChargeObject.setChargValue(computedTaxCharge);  }
                 }else{
                     if(taxPercentageOrFixedValue.compareTo(taxChargeCap)  == 1) {
                           trxnChargeObject.setChargValue(taxChargeCap);
                     }else{   trxnChargeObject.setChargValue(taxPercentageOrFixedValue);  }                    
                 }
             } 
            trxnChargeObject.setIsComputed(true); 
      return   trxnChargeObject;      
    }
     
     
     
     
    private  TrxnChargeObject   computeAndGetBankCommission(BigDecimal   inTotalTrxnCharge){
         
        BigDecimal computedBankCommission = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge; 
         
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
            // COmpute tax Charge
             if(bankCommissionPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForBankCommission == true){
                     computedBankCommission  =  totalChargeValue.multiply(bankCommissionPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedBankCommission.compareTo(bankCommissionShareCap)  == 1) || (bankCommissionShareCap.compareTo(new BigDecimal(0.00)) == 0)){
                         trxnChargeObject.setChargValue(bankCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(computedBankCommission);  }
                 }else{
                     if(bankCommissionPercentageOrFixedValue.compareTo(bankCommissionShareCap)  == 1) {
                           trxnChargeObject.setChargValue(bankCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(bankCommissionPercentageOrFixedValue);  }                    
                 }
             } 
            trxnChargeObject.setIsComputed(true); 
      return   trxnChargeObject;      
    }
     
     
     
     
     
     
   
 private  TrxnChargeObject   computeAndGetPartnerCommission(BigDecimal   inTotalTrxnCharge){
         
        BigDecimal computedPartnerCommission = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge; 
         
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
            // COmpute tax Charge
             if(partnerCommissionPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForPartnerCommission == true){
                     computedPartnerCommission  =  totalChargeValue.multiply(partnerCommissionPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedPartnerCommission.compareTo(partnerCommissionShareCap)  == 1) || (partnerCommissionShareCap.compareTo(new BigDecimal(0.00)) == 0)){
                         trxnChargeObject.setChargValue(partnerCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(computedPartnerCommission);  }
                 }else{
                     if(partnerCommissionPercentageOrFixedValue.compareTo(partnerCommissionShareCap)  == 1) {
                           trxnChargeObject.setChargValue(partnerCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(partnerCommissionPercentageOrFixedValue);  }                    
                 }
             } 
            trxnChargeObject.setIsComputed(true); 
      return   trxnChargeObject;      
    }
      
      
      
      
      
    
     
     
     
     
     
     
         
         
         
    
}
