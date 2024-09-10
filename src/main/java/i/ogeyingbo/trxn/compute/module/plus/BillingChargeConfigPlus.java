/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module.plus;
 
import java.math.BigDecimal;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BillingChargeConfigPlus {
    
    
        
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
                  
                  trxnCharges  = new TrxnCharge(inTrxnAmount);
                    this.computeAndGetSaveInvestPerSpend(trxnCharges);

                    if(inTrxnAmount.divide(new BigDecimal(10.00)).compareTo(bonusShare) == 1){
                        trxnCharges.setLoyaltyBonus(bonusShare);
                    }                
                   
                    this.computeAndGetTotalTrxnCharge(trxnCharges);
                    this.computeAndGetTaxCharge(trxnCharges);
                    this.computeAndGetBankCommission(trxnCharges);
                    this.computeAndGetPartnerCommission(trxnCharges);
  
                    this.computeAndGetIncome(trxnCharges); 
                
                BigDecimal  totalToDebit  = trxnCharges.computeTotalToDebit();                
                System.out.println("Total to DEBIT  -->>> "+totalToDebit); 
                
        }else{
            System.out.println("Cannot compute:  Transaction value out of range >>>> "+inTrxnAmount);
        }
        return   trxnCharges;
    }
    
    
    
    
     
    private  final void   computeAndGetTotalTrxnCharge(TrxnCharge   inTrxnCharges){
         
        BigDecimal totalChargeValue = null;           
        inTrxnCharges.setTotalChargesComputed(false);           
        
        // Confirm Transaction amount is within range
         if((inTrxnCharges.getTrxnValue().compareTo(lowerLimitValue) == 1) && (inTrxnCharges.getTrxnValue().compareTo(upperLimitValue) == -1)){
             
             // COmpute total Charges
              if(percentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(usePercentage == true){
                      System.out.println("Got Here");
                      totalChargeValue  =  inTrxnCharges.getTrxnValue().multiply(percentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("totalChargeValue:  "+totalChargeValue);
                     
                     if((totalChargeValue.compareTo(trxnChargeCap)  == 1)  && (trxnChargeCap.compareTo(new BigDecimal(0.00)) == 1)){
                          System.out.println("Got CAP Here");
                          inTrxnCharges.setTotalCharges(trxnChargeCap);
                      }else{   inTrxnCharges.setTotalCharges(totalChargeValue);  }
                  }else if(usePercentage == false){
                       System.out.println("Are we here");
                      if((percentageOrFixedValue.compareTo(trxnChargeCap)  == 1)  && (trxnChargeCap.compareTo(new BigDecimal(0.00)) == 1)){
                            inTrxnCharges.setTotalCharges(trxnChargeCap);
                      }else{   inTrxnCharges.setTotalCharges(percentageOrFixedValue);  }                    
                  }
               inTrxnCharges.setTotalChargesComputed(true);
              } 
            
         }      
    }
    
    
    
    
    
    private  final void    computeAndGetTaxCharge(TrxnCharge  inTrxnCharge){
         
        BigDecimal computedTaxCharge = null;  
        inTrxnCharge.setTaxChargeComputed(false); 
            // Compute tax Charge
             if(taxPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForTax == true){
                     computedTaxCharge  =  inTrxnCharge.getTotalCharges().multiply(taxPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedTaxCharge.compareTo(taxChargeCap)  == 1) && (taxChargeCap.compareTo(new BigDecimal(0.00)) == 1)){
                         System.out.println("Got CAP Here");
                         inTrxnCharge.setTaxCharge(taxChargeCap);
                     }else{   inTrxnCharge.setTaxCharge(computedTaxCharge);  }
                 }else if(usePercentageForTax == false){
                     if((taxPercentageOrFixedValue.compareTo(taxChargeCap)  == 1) && (taxChargeCap.compareTo(new BigDecimal(0.00)) == 1)){
                           inTrxnCharge.setTaxCharge(taxChargeCap);
                     }else{   inTrxnCharge.setTaxCharge(taxPercentageOrFixedValue);  }                    
                 }
                inTrxnCharge.setTaxChargeComputed(true);
             }        
    }
    
    
     
     
     
     
    private  final  void   computeAndGetBankCommission(TrxnCharge  inTrxnCharge){
         
        BigDecimal computedBankCommission = null;  
        inTrxnCharge.setBankCommissionComputed(false); 
            // Compute Bank Commission
             if(bankCommissionPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForBankCommission == true){
                     computedBankCommission  =  inTrxnCharge.getTotalCharges().multiply(bankCommissionPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedBankCommission.compareTo(bankCommissionShareCap)  == 1)  && (bankCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                         inTrxnCharge.setBankCommission(bankCommissionShareCap);
                     }else{   inTrxnCharge.setBankCommission (computedBankCommission);  }
                 }else if(usePercentageForBankCommission == false){
                     if((bankCommissionPercentageOrFixedValue.compareTo(bankCommissionShareCap)  == 1)  && (bankCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                           inTrxnCharge.setBankCommission(bankCommissionShareCap);
                     }else{   inTrxnCharge.setBankCommission(bankCommissionPercentageOrFixedValue);  }                    
                 }
                inTrxnCharge.setBankCommissionComputed(true);
             }       
    }
     
     
     
     
     
     
   
 private  final void   computeAndGetPartnerCommission(TrxnCharge  inTrxnCharge){
         
        BigDecimal computedPartnerCommission = null;           
        inTrxnCharge.setPartnerCommissionComputed(false); 
        
            // Compute Partner Commission
             if(partnerCommissionPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                 if(usePercentageForPartnerCommission == true){
                     computedPartnerCommission  =  inTrxnCharge.getTotalCharges().multiply(partnerCommissionPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                     if((computedPartnerCommission.compareTo(partnerCommissionShareCap)  == 1) && (partnerCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                         inTrxnCharge.setPartnerCommission(partnerCommissionShareCap);
                     }else{   inTrxnCharge.setPartnerCommission(computedPartnerCommission);  }
                 }else if(usePercentageForPartnerCommission == false){
                     if((partnerCommissionPercentageOrFixedValue.compareTo(partnerCommissionShareCap)  == 1) && (partnerCommissionShareCap.compareTo(new BigDecimal(0.00)) == 1)){
                           inTrxnCharge.setPartnerCommission(partnerCommissionShareCap);
                     }else{   inTrxnCharge.setPartnerCommission(partnerCommissionPercentageOrFixedValue);  }                    
                 }
                inTrxnCharge.setPartnerCommissionComputed(true); 
             }              
    }
      
      
      
     

   
  
 
 
 private  final  void   computeAndGetIncome(TrxnCharge  inTrxnCharge){ 
      
     inTrxnCharge.setIncome(inTrxnCharge.getTotalCharges().subtract(
                        inTrxnCharge.getTaxCharge().add(inTrxnCharge.getBankCommission()
                                    .add(inTrxnCharge.getPartnerCommission().add(inTrxnCharge.getLoyaltyBonus())))));
                                     
 }
  
  
   

 



 private  final void   computeAndGetSaveInvestPerSpend(TrxnCharge   inTrxnCharge){
         
        BigDecimal  saveInvestAmount  =  null;          
        inTrxnCharge.setIsSaveInvestPerSpendComputed(false);         
        System.out.println("Save Invest  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // COmpute total Charges
              if(saveInvestPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useSaveInvestPercentage == true){
                      System.out.println("Save Invest Got Here");
                      saveInvestAmount  =  inTrxnCharge.getTrxnValue().multiply(saveInvestPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("saveInvestAmount:  "+saveInvestAmount);
                     if((saveInvestAmount.compareTo(saveInvestCap)  == 1) && (saveInvestCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Save Invest Got CAP Here");
                          inTrxnCharge.setSaveInvestPerSpend(saveInvestCap);
                      }else{   inTrxnCharge.setSaveInvestPerSpend(saveInvestAmount);  }
                  }else if(useSaveInvestPercentage == false){
                       System.out.println("Save Invest Are we here");
                      if((saveInvestPercentageOrFixedValue.compareTo(saveInvestCap)  == 1) && (saveInvestCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setSaveInvestPerSpend(saveInvestCap);
                      }else{   inTrxnCharge.setSaveInvestPerSpend(saveInvestPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsSaveInvestPerSpendComputed(true); 
              }  
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
