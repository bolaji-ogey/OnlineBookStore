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
public class BillingChargeConfig  {
    
    
        
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
    private   BigDecimal  minimumSaveInvest =  new  BigDecimal(0.00);
    private   BigDecimal  saveInvestCap =  new  BigDecimal(0.00);
    
    private   BigDecimal  bonusShare =  new  BigDecimal(0.00);
    private   boolean    bonusAccelerate  =  false; 
    
    
    private   boolean     useDonationPercentage  =  false; 
    private   BigDecimal  donationPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumDonation =  new  BigDecimal(0.00);
    private   BigDecimal  donationCap =  new  BigDecimal(0.00);
    
    
    
    private   boolean     useCommunicationPercentage  =  false; 
    private   BigDecimal  communicationPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumCommunicationSaving =  new  BigDecimal(0.00);
    private   BigDecimal  communicationSaveCap =  new  BigDecimal(0.00);
    
    
    
    private   boolean     useUtilityPercentage  =  false; 
    private   BigDecimal  utilityPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumUtilitySaving  =  new  BigDecimal(0.00);
    private   BigDecimal  utilitySaveCap =  new  BigDecimal(0.00);
    
    
    
    private   boolean     useHealthCarePercentage  =  false; 
    private   BigDecimal  healthCarePercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumHealthCareSaving  =  new  BigDecimal(0.00);
    private   BigDecimal  healthCareSaveCap =  new  BigDecimal(0.00);
    
    
    
    private   boolean     useLegalPercentage  =  false; 
    private   BigDecimal  legalPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumLegalSaving  =  new  BigDecimal(0.00);
    private   BigDecimal  legalSaveCap =  new  BigDecimal(0.00);
    
    
    
    private   boolean     useHousingPercentage  =  false; 
    private   BigDecimal  housingPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumHousingSaving  =  new  BigDecimal(0.00);
    private   BigDecimal  housingSaveCap =  new  BigDecimal(0.00);
    
    
    
    private   boolean     useHousingAssetPercentage  =  false; 
    private   BigDecimal  housingAssetPercentageOrFixedValue =  new  BigDecimal(0.00);
    private   BigDecimal  minimumHousingAssetSaving  =  new  BigDecimal(0.00);
    private   BigDecimal  housingAssetSaveCap =  new  BigDecimal(0.00);
    
     
    
    
    
    
    public  TrxnCharge    computeAndGetTrxnCharges(BigDecimal   inTrxnAmount){
        
        TrxnCharge   trxnCharges   = null;
          
        if(inTrxnAmount.compareTo(lowerLimitValue) == 1   &&   inTrxnAmount.compareTo(upperLimitValue) <=  0){
                  
                  trxnCharges  = new TrxnCharge(inTrxnAmount);
                    this.computeAndGetSaveInvestPerSpend(trxnCharges);

                    if(inTrxnAmount.divide(new BigDecimal(10.00)).compareTo(bonusShare) == 1){
                        trxnCharges.setLoyaltyBonus(bonusShare);
                    }                
                   
                    this.computeAndGetTrxnCharge(trxnCharges);
                    this.computeAndGetTaxCharge(trxnCharges);
                    this.computeAndGetBankCommission(trxnCharges);
                    this.computeAndGetPartnerCommission(trxnCharges);
                    this.computeAndGetDonation(trxnCharges);
                    this.computeAndGetCommunicationSaving(trxnCharges);
                    this.computeAndGetUtilitySaving(trxnCharges);
                    this.computeAndGetLegalSaving(trxnCharges);
                    this.computeAndGetHealthCareSaving(trxnCharges);
                    this.computeAndGetHousingSaving(trxnCharges);
                    this.computeAndGetHousingAssetSaving(trxnCharges);
  
                    this.computeAndGetIncome(trxnCharges); 
                
                BigDecimal  totalToDebit  = trxnCharges.computeTotalToDebit();                 
                System.out.println("Total to DEBIT  -->>> "+totalToDebit); 
                
        }else{
            System.out.println("Cannot compute:  Transaction value out of range >>>> "+inTrxnAmount);
        }
        return   trxnCharges;
    }
    
    
    
    
     
    private  final void   computeAndGetTrxnCharge(TrxnCharge   inTrxnCharges){
         
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
                      }else if((saveInvestAmount.compareTo(minimumSaveInvest)  == -1) && (minimumSaveInvest.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setSaveInvestPerSpend(minimumSaveInvest);
                     }else {     inTrxnCharge.setSaveInvestPerSpend(saveInvestAmount);      }
                  }else if(useSaveInvestPercentage == false){
                       System.out.println("Save Invest Are we here");
                      if((saveInvestPercentageOrFixedValue.compareTo(saveInvestCap)  == 1) && (saveInvestCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setSaveInvestPerSpend(saveInvestCap);
                      }else if((saveInvestPercentageOrFixedValue.compareTo(minimumSaveInvest)  == -1) && (minimumSaveInvest.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setSaveInvestPerSpend(minimumSaveInvest);
                      }else{  inTrxnCharge.setSaveInvestPerSpend(saveInvestPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsSaveInvestPerSpendComputed(true); 
              }  
    }
 
 
 
 
 
    private  final void   computeAndGetDonation(TrxnCharge   inTrxnCharge){
         
        BigDecimal  donationAmount  =  null;          
        inTrxnCharge.setIsDonationComputed(false);         
        System.out.println("Donation  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // COmpute total Charges
              if(donationPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useDonationPercentage == true){
                      System.out.println("Donation Got Here");
                      donationAmount  =  inTrxnCharge.getTrxnValue().multiply(donationPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("donationAmount:  "+donationAmount);
                     if((donationAmount.compareTo(donationCap)  == 1) && (donationCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Donation Got CAP Here");
                          inTrxnCharge.setDonation(donationCap);
                      }else if((donationAmount.compareTo(minimumDonation)  == -1) && (minimumDonation.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setDonation(minimumDonation);
                     }else {     inTrxnCharge.setDonation(donationAmount);      }
                  }else if(useDonationPercentage == false){
                       System.out.println("DOnation Are we here");
                      if((donationPercentageOrFixedValue.compareTo(donationCap)  == 1) && (donationCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setDonation(donationCap);
                      }else if((donationPercentageOrFixedValue.compareTo(minimumDonation)  == -1) && (minimumDonation.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setDonation(minimumDonation);
                      }else{  inTrxnCharge.setDonation(donationPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsDonationComputed(true); 
              }  
    }
       
       
       
    
    
    private  final void   computeAndGetCommunicationSaving(TrxnCharge   inTrxnCharge){
         
        BigDecimal  communicationAmount  =  null;          
        inTrxnCharge.setIsCommunicationComputed(false);         
        System.out.println("Communication  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // Compute total Charges
              if(communicationPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useCommunicationPercentage == true){
                      System.out.println("Communication Got Here");
                      communicationAmount  =  inTrxnCharge.getTrxnValue().multiply(communicationPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("CommunicationAmount:  "+communicationAmount);
                     if((communicationAmount.compareTo(communicationSaveCap)  == 1) && (communicationSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Communication Got CAP Here");
                          inTrxnCharge.setCommunication(communicationSaveCap);
                      }else if((communicationAmount.compareTo(minimumCommunicationSaving)  == -1) && (minimumCommunicationSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setCommunication(minimumCommunicationSaving);
                     }else {     inTrxnCharge.setCommunication(communicationAmount);      }
                  }else if(useCommunicationPercentage == false){
                       System.out.println("Communication Are we here");
                      if((communicationPercentageOrFixedValue.compareTo(communicationSaveCap)  == 1) && (communicationSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setCommunication(communicationSaveCap);
                      }else if((communicationPercentageOrFixedValue.compareTo(minimumCommunicationSaving)  == -1) && (minimumCommunicationSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setCommunication(minimumCommunicationSaving);
                      }else{  inTrxnCharge.setCommunication(communicationPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsCommunicationComputed(true); 
              }  
    }
        
        
     
        
          
    private  final void   computeAndGetUtilitySaving(TrxnCharge   inTrxnCharge){
         
        BigDecimal  utilityAmount  =  null;          
        inTrxnCharge.setIsUtilityComputed(false);         
        System.out.println("Utility  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // COmpute total Charges
              if(utilityPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useUtilityPercentage == true){
                      System.out.println("Utility Got Here");
                      utilityAmount  =  inTrxnCharge.getTrxnValue().multiply(utilityPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("UtilityAmount:  "+utilityAmount);
                     if((utilityAmount.compareTo(utilitySaveCap)  == 1) && (utilitySaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Utility Got CAP Here");
                          inTrxnCharge.setUtility(utilitySaveCap);
                      }else if((utilityAmount.compareTo(minimumUtilitySaving)  == -1) && (minimumUtilitySaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setUtility(minimumUtilitySaving);
                     }else {     inTrxnCharge.setUtility(utilityAmount);      }
                  }else if(useUtilityPercentage == false){
                       System.out.println("Utility Are we here");
                      if((utilityPercentageOrFixedValue.compareTo(utilitySaveCap)  == 1) && (utilitySaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setUtility(utilitySaveCap);
                      }else if((utilityPercentageOrFixedValue.compareTo(minimumUtilitySaving)  == -1) && (minimumUtilitySaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setUtility(minimumUtilitySaving);
                      }else{  inTrxnCharge.setUtility(utilityPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsUtilityComputed(true); 
              }  
    }
            
    
     
   
    
    private  final void   computeAndGetLegalSaving(TrxnCharge   inTrxnCharge){
         
        BigDecimal  legalAmount  =  null;          
        inTrxnCharge.setIsLegalComputed(false);         
        System.out.println("Legal  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // Compute total Charges
              if(legalPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useLegalPercentage == true){
                      System.out.println("Legal Got Here");
                      legalAmount  =  inTrxnCharge.getTrxnValue().multiply(legalPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("LegalAmount:  "+legalAmount);
                     if((legalAmount.compareTo(legalSaveCap)  == 1) && (legalSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Legal Got CAP Here");
                          inTrxnCharge.setLegal(legalSaveCap);
                      }else if((legalAmount.compareTo(minimumLegalSaving)  == -1) && (minimumLegalSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setLegal(minimumLegalSaving);
                     }else {     inTrxnCharge.setLegal(legalAmount);      }
                  }else if(useLegalPercentage == false){
                       System.out.println("Legal Are we here");
                      if((legalPercentageOrFixedValue.compareTo(legalSaveCap)  == 1) && (legalSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setLegal(legalSaveCap);
                      }else if((legalPercentageOrFixedValue.compareTo(minimumLegalSaving)  == -1) && (minimumLegalSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setLegal(minimumLegalSaving);
                      }else{  inTrxnCharge.setLegal(legalPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsLegalComputed(true); 
              }  
    }
        
        
        
        
    private  final void   computeAndGetHealthCareSaving(TrxnCharge   inTrxnCharge){
         
        BigDecimal  healthCareAmount  =  null;          
        inTrxnCharge.setIsHealthCareComputed(false);         
        System.out.println("HealthCare  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // COmpute total Charges
              if(healthCarePercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useHealthCarePercentage == true){
                      System.out.println("HealthCare Got Here");
                      healthCareAmount  =  inTrxnCharge.getTrxnValue().multiply(healthCarePercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("HealthCareAmount:  "+healthCareAmount);
                     if((healthCareAmount.compareTo(healthCareSaveCap)  == 1) && (healthCareSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("HealthCare Got CAP Here");
                          inTrxnCharge.setHealthCare(healthCareSaveCap);
                      }else if((healthCareAmount.compareTo(minimumHealthCareSaving)  == -1) && (minimumHealthCareSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setHealthCare(minimumHealthCareSaving);
                     }else {     inTrxnCharge.setHealthCare(healthCareAmount);      }
                  }else if(useHealthCarePercentage == false){
                       System.out.println("HealthCare Are we here");
                      if((healthCarePercentageOrFixedValue.compareTo(healthCareSaveCap)  == 1) && (healthCareSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setHealthCare(healthCareSaveCap);
                      }else if((healthCarePercentageOrFixedValue.compareTo(minimumHealthCareSaving)  == -1) && (minimumHealthCareSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setHealthCare(minimumHealthCareSaving);
                      }else{  inTrxnCharge.setHealthCare(healthCarePercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsHealthCareComputed(true); 
              }  
    }
       
        
        
        
        
    private  final void   computeAndGetHousingSaving(TrxnCharge   inTrxnCharge){
         
        BigDecimal  housingAmount  =  null;          
        inTrxnCharge.setIsHousingComputed(false);         
        System.out.println("Housing  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // Compute total Charges
              if(housingPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useHousingPercentage == true){
                      System.out.println("Housing Got Here");
                      housingAmount  =  inTrxnCharge.getTrxnValue().multiply(housingPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("HousingAmount:  "+housingAmount);
                     if((housingAmount.compareTo(housingSaveCap)  == 1) && (housingSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("Housing Got CAP Here");
                          inTrxnCharge.setHousing(housingSaveCap);
                      }else if((housingAmount.compareTo(minimumHousingSaving)  == -1) && (minimumHousingSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setHousing(minimumHousingSaving);
                     }else {     inTrxnCharge.setHousing(housingAmount);      }
                  }else if(useHousingPercentage == false){
                       System.out.println("Housing Are we here");
                      if((housingPercentageOrFixedValue.compareTo(housingSaveCap)  == 1) && (housingSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setHousing(housingSaveCap);
                      }else if((housingPercentageOrFixedValue.compareTo(minimumHousingSaving)  == -1) && (minimumHousingSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setHousing(minimumHousingSaving);
                      }else{  inTrxnCharge.setHousing(housingPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsHousingComputed(true); 
              }  
    }
        
        
        
        
    private  final void   computeAndGetHousingAssetSaving(TrxnCharge   inTrxnCharge){
         
        BigDecimal  housingAssetAmount  =  null;          
        inTrxnCharge.setIsHousingAssetComputed(false);         
        System.out.println("HousingAsset  trxnAmount:  "+inTrxnCharge.getTrxnValue());
           
             // COmpute total Charges
              if(housingAssetPercentageOrFixedValue.compareTo(new BigDecimal(0.00)) == 1){
                  if(useHousingAssetPercentage == true){
                      System.out.println("HousingAsset Got Here");
                      housingAssetAmount  =  inTrxnCharge.getTrxnValue().multiply(housingAssetPercentageOrFixedValue.divide(new BigDecimal(100.00)));
                      System.out.println("HousingAssetAmount:  "+housingAssetAmount);
                     if((housingAssetAmount.compareTo(housingAssetSaveCap)  == 1) && (housingAssetSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                          System.out.println("HousingAsset Got CAP Here");
                          inTrxnCharge.setHousingAsset(housingAssetSaveCap);
                      }else if((housingAssetAmount.compareTo(minimumHousingAssetSaving)  == -1) && (minimumHousingAssetSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setHousingAsset(minimumHousingAssetSaving);
                     }else {     inTrxnCharge.setHousingAsset(housingAssetAmount);      }
                  }else if(useHousingAssetPercentage == false){
                       System.out.println("HousingAsset Are we here");
                      if((housingAssetPercentageOrFixedValue.compareTo(housingAssetSaveCap)  == 1) && (housingAssetSaveCap.compareTo(new BigDecimal(0.00)) == 1)){ 
                            inTrxnCharge.setHousingAsset(housingAssetSaveCap);
                      }else if((housingAssetPercentageOrFixedValue.compareTo(minimumHousingAssetSaving)  == -1) && (minimumHousingAssetSaving.compareTo(new BigDecimal(0.00)) == 1)){   
                          inTrxnCharge.setHousingAsset(minimumHousingAssetSaving);
                      }else{  inTrxnCharge.setHousingAsset(housingAssetPercentageOrFixedValue);  }                    
                  }                  
                  inTrxnCharge.setIsHousingAssetComputed(true); 
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
    
    
    public  void  setMinimumSaveInvest(BigDecimal  inMinimumSaveInvest){
        minimumSaveInvest = inMinimumSaveInvest;
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
    
    
    public  BigDecimal  getMinimumSaveInvest(){
        return    minimumSaveInvest;
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
