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
    private   String  partnerCode;
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
    
    private   String      dateConfigured; 
    
    private   boolean     usePercentageForTax  =  false; 
    private   BigDecimal  taxPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  taxChargeCap =  new  BigDecimal(0.00);
    
    private   boolean     usePercentageForBankCommission  =  false; 
    private   BigDecimal  bankCommissionPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  bankCommissionShareCap =  new  BigDecimal(0.00);
    
    private   boolean     usePercentageForPartnerCommission  =  false; 
    private   BigDecimal  partnerCommissionPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  partnerCommissionShareCap =  new  BigDecimal(0.00);
    
    private   boolean     useSaveInvestPercentage  =  false; 
    private   BigDecimal  saveInvestPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  saveInvestCap =  new  BigDecimal(0.00);
    
    private   BigDecimal  bonusShare =  new  BigDecimal(0.00);
    private   boolean    bonusAccelerate  =  false; 
     
    
    
    
    
    public  TrxnCharge    computeAndGetTrxnCharges(BigDecimal   inTrxnAmount){
        
        TrxnCharge   trxnCharges   = null;
          
        if(inTrxnAmount.compareTo(lowerLimitValue) == 1   &&   inTrxnAmount.compareTo(upperLimitValue) <=  0){
                 trxnCharges   = new  TrxnCharge();
                 
                /***
                BigDecimal    totalCharge  =  computeAndGetTotalTrxnCharge(inTrxnAmount).getChargValue();
                BigDecimal    taxCharge  =  computeAndGetTaxCharge(totalCharge).getChargValue();
                BigDecimal    bankCommission  =  computeAndGetBankCommission(totalCharge).getChargValue();
                BigDecimal    partnerCommission  =  computeAndGetPartnerCommission(totalCharge).getChargValue();

                BigDecimal    loyaltyBonus  =  computeAndGetLoyaltyBonus(totalCharge).getChargValue();
                **/

                TrxnChargeObject    totalTrxnCharge  =  computeAndGetTotalTrxnCharge(inTrxnAmount);
                TrxnChargeObject    taxCharge  =  computeAndGetTaxCharge(totalTrxnCharge.getChargValue());
                TrxnChargeObject    bankComm  =  computeAndGetBankCommission(totalTrxnCharge.getChargValue());
                TrxnChargeObject    partnerCommission  =  computeAndGetPartnerCommission(totalTrxnCharge.getChargValue());

                TrxnChargeObject    loyaltyBonus  =  computeAndGetLoyaltyBonus(totalTrxnCharge.getChargValue());
                
                TrxnChargeObject    saveInvestAmount  =  computeAndGetSaveInvestPerSpend(inTrxnAmount);



                trxnCharges.setTotalCharges(totalTrxnCharge.getChargValue());
                trxnCharges.setTaxCharge(taxCharge.getChargValue());
                trxnCharges.setBankCommission(bankComm.getChargValue());
                trxnCharges.setPartnerCommission(partnerCommission.getChargValue());
                
                trxnCharges.setSaveInvestPerSpend(saveInvestAmount.getChargValue());

                TrxnChargeObject    income   =   computeAndGetIncome(trxnCharges);
                trxnCharges.setIncome(income.getIncome());
                
                BigDecimal  totalToDebit  = trxnCharges.computeTotalToDebit();
                
                System.out.println("Total to DEBIT  -->>> "+totalToDebit);

               // trxnCharges.setLoyaltyBonus(loyaltyBonus);

               // trxnCharges  =  computeAndGetIncome(trxnCharges);
                System.out.println("Is Income Computed = "+income.getIsComputed()+"\n\n");

                  System.out.println("Is Total Trxn Charges Computed = "+totalTrxnCharge.getIsComputed());
                System.out.println("Is Tax Charge Computed = "+taxCharge.getIsComputed());
                System.out.println("Is Bank Commission Charges Computed = "+bankComm.getIsComputed());
                 System.out.println("Is Partner Commission Computed = "+partnerCommission.getIsComputed());

                  System.out.println("Is Income Computed = "+partnerCommission.getIsComputed());

                 /***
                trxnCharges.setIncome(totalCharge.subtract(taxCharge.add(bankCommission)
                                                     .add(partnerCommission).add(loyaltyBonus)));
                **/
        }else{
            System.out.println("Cannot compute:  Transaction value out of range >>>> "+inTrxnAmount);
        }
        return   trxnCharges;
    }
    
    
    
    
     
    private  TrxnChargeObject   computeAndGetTotalTrxnCharge(BigDecimal   inTrxnAmount){
        
        BigDecimal trxnAmount  =  inTrxnAmount;
        BigDecimal trxnChargeBalance = null;
        BigDecimal  totalChargeValue  =  new BigDecimal(0.00); 
        
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
        trxnChargeObject.setIsComputed(false); 
        
        System.out.println("trxnAmount:  "+trxnAmount);
        
        // Confirm Transaction amount is within range
         if((trxnAmount.compareTo(lowerLimitValue) == 1) && (trxnAmount .compareTo(upperLimitValue) == -1)){
             
             // COmpute total Charges
              if(percentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(usePercentage == true){
                      System.out.println("Got Here");
                      totalChargeValue  =  trxnAmount.multiply(percentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("totalChargeValue:  "+totalChargeValue);
                     // if((totalChargeValue.compareTo(trxnChargeCap)  == 1) && (!(trxnChargeCap.compareTo(new BigDecimal(0.00)) == 0))){
                     if(totalChargeValue.compareTo(trxnChargeCap)  == 1) {
                          System.out.println("Got CAP Here");
                          trxnChargeObject.setChargValue(trxnChargeCap);
                      }else{   trxnChargeObject.setChargValue(totalChargeValue);  }
                  }else if(usePercentage == false){
                       System.out.println("Are we here");
                      if(percentageOrFixedValue.compareTo(trxnChargeCap)  == 1) {
                            trxnChargeObject.setChargValue(trxnChargeCap);
                      }else{   trxnChargeObject.setChargValue(percentageOrFixedValue);  }                    
                  }
               trxnChargeObject.setIsComputed(true);
              } 
            
         } 
      return   trxnChargeObject;      
    }
    
    
    
    
    
    private  TrxnChargeObject   computeAndGetTaxCharge(BigDecimal   inTotalTrxnCharge){
         
        BigDecimal computedTaxCharge = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge; 
         
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
        trxnChargeObject.setIsComputed(false); 
            // COmpute tax Charge
             if(taxPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForTax == true){
                     computedTaxCharge  =  totalChargeValue.multiply(taxPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedTaxCharge.compareTo(taxChargeCap)  == 1) && (taxChargeCap.compareTo(new BigDecimal(0.00)) == 1)){
                         System.out.println("Got CAP Here");
                         trxnChargeObject.setChargValue(taxChargeCap);
                     }else{   trxnChargeObject.setChargValue(computedTaxCharge);  }
                 }else if(usePercentageForTax == false){
                     if((taxPercentageOrFixedValue.compareTo(taxChargeCap)  == 1) && (taxChargeCap.compareTo(new BigDecimal(0.00)) == 1)){
                           trxnChargeObject.setChargValue(taxChargeCap);
                     }else{   trxnChargeObject.setChargValue(taxPercentageOrFixedValue);  }                    
                 }
                trxnChargeObject.setIsComputed(true);
             } 
            // System.out.println(taxPercentageOrFixedValue);
             
      return   trxnChargeObject;      
    }
     
     
     
     
    private  TrxnChargeObject   computeAndGetBankCommission(BigDecimal   inTotalTrxnCharge){
         
        BigDecimal computedBankCommission = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge; 
         
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
        trxnChargeObject.setIsComputed(false); 
            // COmpute tax Charge
             if(bankCommissionPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForBankCommission == true){
                     computedBankCommission  =  totalChargeValue.multiply(bankCommissionPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedBankCommission.compareTo(bankCommissionShareCap)  == 1)  && (bankCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                         trxnChargeObject.setChargValue(bankCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(computedBankCommission);  }
                 }else if(usePercentageForBankCommission == false){
                     if((bankCommissionPercentageOrFixedValue.compareTo(bankCommissionShareCap)  == 1)  && (bankCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                           trxnChargeObject.setChargValue(bankCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(bankCommissionPercentageOrFixedValue);  }                    
                 }
                 trxnChargeObject.setIsComputed(true);
             }  
      return   trxnChargeObject;      
    }
     
     
     
     
     
     
   
 private  TrxnChargeObject   computeAndGetPartnerCommission(BigDecimal   inTotalTrxnCharge){
         
        BigDecimal computedPartnerCommission = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge; 
         
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
        trxnChargeObject.setIsComputed(false); 
        
            // COmpute tax Charge
             if(partnerCommissionPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForPartnerCommission == true){
                     computedPartnerCommission  =  totalChargeValue.multiply(partnerCommissionPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedPartnerCommission.compareTo(partnerCommissionShareCap)  == 1) && (partnerCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                         trxnChargeObject.setChargValue(partnerCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(computedPartnerCommission);  }
                 }else if(usePercentageForPartnerCommission == false){
                     if((partnerCommissionPercentageOrFixedValue.compareTo(partnerCommissionShareCap)  == 1) && (partnerCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                           trxnChargeObject.setChargValue(partnerCommissionShareCap);
                     }else{   trxnChargeObject.setChargValue(partnerCommissionPercentageOrFixedValue);  }                    
                 }
                 trxnChargeObject.setIsComputed(true); 
             }             
      return   trxnChargeObject;      
    }
      
      
      
     

   
 private  TrxnChargeObject   computeAndGetLoyaltyBonus(BigDecimal   inTotalTrxnCharge){
      TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
       /***  
        BigDecimal computedPartnerCommission = null;
        BigDecimal  totalChargeValue  =   inTotalTrxnCharge;  
       
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
            ***/
      return   trxnChargeObject;      
    }

 
 
 
 
 private  TrxnChargeObject   computeAndGetIncome(TrxnCharge  inTrxnCharge){ 
     
     TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
     trxnChargeObject.setIncome(inTrxnCharge.getTotalCharges().subtract(
                        inTrxnCharge.getTaxCharge().add(inTrxnCharge.getBankCommission()
                                    .add(inTrxnCharge.getPartnerCommission().add(inTrxnCharge.getLoyaltyBonus())))));
                                     
      return   trxnChargeObject;      
 }
  
  
   

 /***
 private  TrxnCharge   computeAndGetIncome(TrxnCharge  inTrxnCharge){ 
     
     inTrxnCharge.setIncome(inTrxnCharge.getTotalCharges().subtract(
                        inTrxnCharge.getTaxCharge().add(inTrxnCharge.getBankCommission()
                                    .add(inTrxnCharge.getPartnerCommission().add(inTrxnCharge.getLoyaltyBonus())))));
                                     
      return   inTrxnCharge;      
 }
***/



 private  TrxnChargeObject   computeAndGetSaveInvestPerSpend(BigDecimal   inTrxnAmount){
        
        BigDecimal trxnAmount  =  inTrxnAmount; 
        BigDecimal  saveInvestAmount  =  null; 
        
        TrxnChargeObject trxnChargeObject =  new  TrxnChargeObject();
        trxnChargeObject.setIsComputed(false); 
        
        System.out.println("Save Invest  trxnAmount:  "+trxnAmount);
           
             // COmpute total Charges
              if(saveInvestPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useSaveInvestPercentage == true){
                      System.out.println("Save Invest Got Here");
                      saveInvestAmount  =  trxnAmount.multiply(saveInvestPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("saveInvestAmount:  "+saveInvestAmount);
                     if((saveInvestAmount.compareTo(saveInvestCap)  == 1) && (saveInvestCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Save Invest Got CAP Here");
                          trxnChargeObject.setChargValue(saveInvestCap);
                      }else{   trxnChargeObject.setChargValue(saveInvestAmount);  }
                  }else if(useSaveInvestPercentage == false){
                       System.out.println("Save Invest Are we here");
                      if((saveInvestPercentageOrFixedValue.compareTo(saveInvestCap)  == 1) && (saveInvestCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            trxnChargeObject.setChargValue(saveInvestCap);
                      }else{   trxnChargeObject.setChargValue(saveInvestPercentageOrFixedValue);  }                    
                  }
               trxnChargeObject.setIsComputed(true);
              } 
             
      return   trxnChargeObject;      
    }
 
     
    public  void   setId(long inId){
        id = inId;
    } 
    
    
    public  void  setBillingCode(String  inBillingCode){
        billingCode  =  inBillingCode;
    }
     
    public  void  setPartnerCode(String  inPartnerCode){
        partnerCode  =  inPartnerCode;
    }
    
    public  void  setIsActive(boolean  inIsActive){
        isActive  =  inIsActive;
    }
    
    public  void  setServiceId(String  inServiceId){
        serviceId  =  inServiceId;
    }
   
    public  void  setServiceName(String  inServiceName){
        serviceName  =  inServiceName;
    }
    
    
    public  void  setSchemeCode(String  inSchemeCode){
        schemeCode  =  inSchemeCode;
    }
    
    
    public  void  setAppTrxnType(String  inAppTrxnType){
        appTrxnType  =  inAppTrxnType;
    }
    
    public  void  setTrxnBand(String  inTrxnBand){
        trxnBand  =  inTrxnBand;
    }
    
      
    public  void  setLowerLimitValue(BigDecimal  inLowerLimitValue){
        lowerLimitValue  =  inLowerLimitValue;
    }
    
    public  void  setUpperLimitValue(BigDecimal  inUpperLimitValue){
        upperLimitValue  =  inUpperLimitValue;
    }
    
    public  void  setUsePercentage(boolean  inUsePercentage){
        usePercentage  =  inUsePercentage;
    }
    
    public  void  setPercentageOrFixedValue(BigDecimal  inPercentageOrFixedValue){
        percentageOrFixedValue  =  inPercentageOrFixedValue;
    }
    
    public  void  setTrxnChargeCap(BigDecimal  inTrxnChargeCap){
        trxnChargeCap  =  inTrxnChargeCap;
    }
    
    public  void  setDateConfigured(String  inDateConfigured){
        dateConfigured  =  inDateConfigured;
    }
    
    
    
    public  void  setUsePercentageForTax(boolean  inUsePercentageForTax){
        usePercentageForTax  =  inUsePercentageForTax;
    }
    
    public  void  setTaxPercentageOrFixedValue(BigDecimal  inTaxPercentageOrFixedValue){
        taxPercentageOrFixedValue  =  inTaxPercentageOrFixedValue;
    }
    
    public  void  setTaxChargeCap(BigDecimal  inTaxChargeCap){
        taxChargeCap  =  inTaxChargeCap;
    }
    
     
    
    public  void  setUsePercentageForBankCommission(boolean  inUsePercentageForBankCommission){
        usePercentageForBankCommission  =  inUsePercentageForBankCommission;
    }
    
    public  void  setBankCommissionPercentageOrFixedValue(BigDecimal  inBankCommissionPercentageOrFixedValue){
        bankCommissionPercentageOrFixedValue  =  inBankCommissionPercentageOrFixedValue;
    }
    
    public  void  setBankCommissionShareCap(BigDecimal  inBankCommissionShareCap){
        bankCommissionShareCap  =  inBankCommissionShareCap;
    } 
    
    
    public  void  setUsePercentageForPartnerCommission(boolean  inUsePercentageForPartnerCommission){
        usePercentageForPartnerCommission  =  inUsePercentageForPartnerCommission;
    }
    
    public  void  setPartnerCommissionPercentageOrFixedValue(BigDecimal  inPartnerCommissionPercentageOrFixedValue){
        partnerCommissionPercentageOrFixedValue  =  inPartnerCommissionPercentageOrFixedValue;
    }
    
    public  void  setPartnerCommissionShareCap(BigDecimal  inPartnerCommissionShareCap){
        partnerCommissionShareCap  =  inPartnerCommissionShareCap;
    }
    
    
    public  void  setUseSaveInvestPercentage(boolean  inUseSaveInvestPercentage){
        useSaveInvestPercentage = inUseSaveInvestPercentage;
    }
    
    public  void  setSaveInvestPercentageOrFixedValue(BigDecimal  inSaveInvestPercentageOrFixedValue){
       saveInvestPercentageOrFixedValue = inSaveInvestPercentageOrFixedValue;
    }
    
    public  void  setSaveInvestCap(BigDecimal  inSaveInvestCap){
        saveInvestCap = inSaveInvestCap;
    }
    
    public  void  setBonusShare(BigDecimal  inBonusShare){
        bonusShare  =  inBonusShare;
    }
    
    
    public  void  setBonusAccelerate(boolean  inBonusAccelerate){
        bonusAccelerate  =  inBonusAccelerate;
    }
     
     
    
    
     
         
         
    
    
    
    
     
    public  long   getId(long inId){
       return    id = inId;
    } 
    
    
    public  String  getBillingCode(){
        return   billingCode;
    }
     
    public  String  getPartnerCode(){
        return   partnerCode;
    }
    
    public  boolean  getIsActive(){
        return   isActive;
    }
    
    public  String  getServiceId(){
        return   serviceId;
    }
   
    public  String  getServiceName(){
        return   serviceName;
    }
    
    
    public  String  getSchemeCode(){
       return    schemeCode;
    }
    
    
    public  String  getAppTrxnType(){
        return   appTrxnType;
    }
    
    public  String  getTrxnBand(){
        return   trxnBand;
    }
    
      
    public  BigDecimal  getLowerLimitValue(){
        return   lowerLimitValue;
    }
    
    public  BigDecimal  getUpperLimitValue(){
        return   upperLimitValue;
    }
    
    public  boolean  getUsePercentage(){
        return   usePercentage;
    }
    
    public  BigDecimal  getPercentageOrFixedValue(){
        return   percentageOrFixedValue;
    }
    
    public  BigDecimal  getTrxnChargeCap(){
        return   trxnChargeCap;
    }
    
    public  String  getDateConfigured(){
        return   dateConfigured;
    }
    
    
    
    public  boolean  getUsePercentageForTax(){
        return   usePercentageForTax;
    }
    
    public  BigDecimal  getTaxPercentageOrFixedValue(){
        return   taxPercentageOrFixedValue;
    }
    
    public  BigDecimal  getTaxChargeCap(){
        return   taxChargeCap;
    }
    
     
    
    public  boolean  getUsePercentageForBankCommission(){
        return   usePercentageForBankCommission;
    }
    
    public  BigDecimal  getBankCommissionPercentageOrFixedValue(){
        return   bankCommissionPercentageOrFixedValue;
    }
    
    public  BigDecimal  getBankCommissionShareCap(){
       return    bankCommissionShareCap;
    } 
    
    
    public  boolean  getUsePercentageForPartnerCommission(){
       return    usePercentageForPartnerCommission;
    }
    
    public  BigDecimal  getPartnerCommissionPercentageOrFixedValue(){
       return    partnerCommissionPercentageOrFixedValue;
    }
    
    public  BigDecimal  getPartnerCommissionShareCap(){
       return    partnerCommissionShareCap;
    }
    
     
    
   public  boolean  getUseSaveInvestPercentage(){
       return    useSaveInvestPercentage;
    }
    
    public  BigDecimal  getSaveInvestPercentageOrFixedValue(){
       return    saveInvestPercentageOrFixedValue;
    }
    
    public  BigDecimal  getSaveInvestCap(){
       return    saveInvestCap;
    }
    
    
    public  BigDecimal  getBonusShare(){
        return   bonusShare;
    }
    
    
    public  boolean  getBonusAccelerate(){
        return   bonusAccelerate;
    }
    
    
    
         
    
}
