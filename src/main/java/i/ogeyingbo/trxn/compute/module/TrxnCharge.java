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
public class TrxnCharge {
    
    private   BigDecimal  trxnValue =  new  BigDecimal(0.00); 
    
    private   BigDecimal  totalToDebit =  new  BigDecimal(0.00); 
    private   boolean     isTotalToDebitComputed  =  false;
            
    private   BigDecimal  saveInvestPerSpend =  new  BigDecimal(0.00); 
    private   boolean     isSaveInvestPerSpendComputed  =  false;
    
    private   boolean     computeSuccessfull  =  false;
    
    private   BigDecimal  totalCharges =  new  BigDecimal(0.00); 
    private   boolean  isTotalChargesComputed   = false;
    
    private   BigDecimal  taxCharge =  new  BigDecimal(0.00); 
    private   boolean  isTaxChargeComputed   = false;
    
    private   BigDecimal   bankCommission =  new  BigDecimal(0.00); 
    private   boolean  isBankCommissionComputed   = false;
    
    private   BigDecimal   partnerCommission =  new  BigDecimal(0.00); 
    private   boolean  isPartnerCommissionComputed   = false;
    
    private   BigDecimal   loyaltyBonus  =  new  BigDecimal(0.00);
    private   boolean  isLoyaltyBonusComputed   = false;
    
    private   BigDecimal  income =  new  BigDecimal(0.00);
    private   boolean  isIncomeComputed   = false;
    
    
   
    public  final BigDecimal    computeTotalToDebit(){
          totalToDebit  =  trxnValue.add(totalCharges).add(saveInvestPerSpend);
       return   totalToDebit;
    }
    
   
    public  final  BigDecimal   computeAndGetIncome(){ 
      
            income  = totalCharges.subtract(taxCharge.add(bankCommission
                                    .add(partnerCommission.add(loyaltyBonus))));
                                     
      return   income;      
   }
    
    
    
    public  void  setTotalToDebit(BigDecimal  inTotalToDebit){
       totalToDebit =  inTotalToDebit;
    }
    
    
    public  void  setSaveInvestPerSpend(BigDecimal  inSaveInvestPerSpend){
       saveInvestPerSpend =  inSaveInvestPerSpend;
    }
    
    
    public  void  setTotalCharges(BigDecimal  inTotalCharges){
       totalCharges =  inTotalCharges;
    }
    
    
    public  void  setTaxCharge(BigDecimal  inTaxCharge){
       taxCharge =  inTaxCharge;
    }
    
    
    public  void  setPartnerCommission(BigDecimal  inPartnerCommission){
       partnerCommission =  inPartnerCommission;
    }
    
    
    public  void  setBankCommission(BigDecimal  inBankCommission){
       bankCommission =  inBankCommission;
    }
    
    
    public  void  setLoyaltyBonus(BigDecimal  inLoyaltyBonus){
       loyaltyBonus =  inLoyaltyBonus;
    }
    
    
    public  void  setIncome(BigDecimal  inIncome){
       income =  inIncome;
    }
    
    
    
    
    
    public  void  setComputeSuccessfull(boolean  inComputeSuccessfull){
       computeSuccessfull =  inComputeSuccessfull;
    }
    
    public  void  setTotalChargesComputed(boolean  inTotalChargesComputed){
       isTotalChargesComputed =  inTotalChargesComputed;
    }
    
    
    
    public  void  setTaxChargeComputed(boolean  inTaxChargeComputed){
       isTaxChargeComputed =  inTaxChargeComputed;
    }
    
    
    public  void  setBankCommissionComputed(boolean  inBankCommissionComputed){
       isBankCommissionComputed =  inBankCommissionComputed;
    }
    
    
    public  void  setPartnerCommissionComputed(boolean  inPartnerCommissionComputed){
       isPartnerCommissionComputed =  inPartnerCommissionComputed;
    }
    
    
    public  void  setLoyaltyBonusComputed(boolean  inLoyaltyBonusComputed){
       isLoyaltyBonusComputed =  inLoyaltyBonusComputed;
    }
    
    
    public  void  setIncomeComputed(boolean  inIncomeComputed){
       isIncomeComputed =  inIncomeComputed;
    }
    
    
    
    
    
    public  BigDecimal  getTotalToDebit(){
       return   totalToDebit;
    }
    
    
    public  BigDecimal  getSaveInvestPerSpend(){
       return   saveInvestPerSpend;
    }
    
    
    
    public  BigDecimal  getTotalCharges(){
       return   totalCharges;
    }
    
    
    public  BigDecimal  getTaxCharge(){
       return  taxCharge;
    }
    
    
    public  BigDecimal  getPartnerCommission(){
       return  partnerCommission;
    }
    
    
    public  BigDecimal  getBankCommission(){
       return  bankCommission;
    }
    
    
    public  BigDecimal  getLoyaltyBonus(){
       return  loyaltyBonus;
    }
    
    
    public  BigDecimal  getIncome(){
       return  income;
    }
    
    
    
    
}
