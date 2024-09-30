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
    private   boolean     isTotalChargesComputed   = false;
    
    private   BigDecimal  taxCharge =  new  BigDecimal(0.00);  
    private   boolean     isTaxChargeComputed   = false;
    
    private   BigDecimal   bankCommission =  new  BigDecimal(0.00); 
    private   boolean    isBankCommissionComputed   = false;
    
    private   BigDecimal   partnerCommission =  new  BigDecimal(0.00);  
    private   boolean      isPartnerCommissionComputed   = false;
    
    private   BigDecimal   loyaltyBonus  =  new  BigDecimal(0.00); 
    private   boolean     isLoyaltyBonusComputed   = false;
    
    private   BigDecimal  income =  new  BigDecimal(0.00); 
    private   boolean    isIncomeComputed   = false;
    
    
    private   BigDecimal  donation =  new  BigDecimal(0.00); 
    private   boolean   isDonationComputed   = false;
    
    private   BigDecimal  communication =  new  BigDecimal(0.00); 
    private   boolean    isCommunicationComputed   = false;
    
    
    private   BigDecimal  utility =  new  BigDecimal(0.00); 
    private   boolean    isUtilityComputed   = false;
    
    private   BigDecimal  legal =  new  BigDecimal(0.00); 
    private   boolean     isLegalComputed   = false;
    
    private   BigDecimal  healthCare =  new  BigDecimal(0.00); 
    private   boolean     isHealthCareComputed   = false;
    
     
    private   BigDecimal  housing =  new  BigDecimal(0.00); 
    private   boolean     isHousingComputed   = false;
    
    private   BigDecimal  housingAsset =  new  BigDecimal(0.00); 
    private   boolean     isHousingAssetComputed   = false;
    
    private   BigDecimal   educationTraining =  new  BigDecimal(0.00); 
    private   boolean     isEducationTrainingComputed   = false;
    
    
    
    public  TrxnCharge(BigDecimal  inReqTrxnAmount){
        trxnValue = inReqTrxnAmount; 
    }
    
   
    public  final BigDecimal    computeTotalToDebit(){
          totalToDebit  =  totalCharges.add(saveInvestPerSpend).add(loyaltyBonus)
                               .add(donation).add(communication)
                                  .add(utility).add(legal)
                                    .add(healthCare).add(housing)
                                        .add(housingAsset).add(educationTraining);
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
    
    
    public  void  setDonation(BigDecimal  inDonation){
       donation =  inDonation; 
    }
    
    
    public  void  setIsDonationComputed(boolean  inIsDonationComputed){
       isDonationComputed =  inIsDonationComputed; 
    }
    
    
    
    public  void  setCommunication(BigDecimal  inCommunication){
       communication =  inCommunication; 
    }
    
    
    public  void  setIsCommunicationComputed(boolean  inIsCommunicationComputed){
       isCommunicationComputed =  inIsCommunicationComputed; 
    }
    
    
    public  void  setUtility(BigDecimal  inUtility){
       utility =  inUtility; 
    }
    
    
    public  void  setIsUtilityComputed(boolean  inIsUtilityComputed){
       isUtilityComputed =  inIsUtilityComputed; 
    }
    
    
    public  void  setLegal(BigDecimal  inLegal){
       legal =  inLegal; 
    }
    
    
    public  void  setIsLegalComputed(boolean  inIsLegalComputed){
       isLegalComputed =  inIsLegalComputed; 
    }
    
    
    
    public  void  setHealthCare(BigDecimal  inHealthCare){
       healthCare =  inHealthCare; 
    }
    
    
    public  void  setIsHealthCareComputed(boolean  inIsHealthCareComputed){
       isHealthCareComputed =  inIsHealthCareComputed; 
    }
    
    
    
    public  void  setHousing(BigDecimal  inHousing){
       housing =  inHousing; 
    }
    
    
    public  void  setIsHousingComputed(boolean  inIsHousingComputed){
       isHousingComputed =  inIsHousingComputed; 
    }
    
    
    
    public  void  setHousingAsset(BigDecimal  inHousingAsset){
       housingAsset =  inHousingAsset; 
    }
    
    
    public  void  setIsHousingAssetComputed(boolean  inIsHousingAssetComputed){
       isHousingAssetComputed =  inIsHousingAssetComputed; 
    }
    
    
    
    public  void  setEducationTraining(BigDecimal  inEducationTraining){
       educationTraining =  inEducationTraining; 
    }
    
    
    public  void  setIsEducationTrainingComputed(boolean  inIsEducationTrainingComputed){
       isEducationTrainingComputed =  inIsEducationTrainingComputed; 
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
    
    
    public  void  setIsSaveInvestPerSpendComputed(boolean  inIsSaveInvestPerSpendComputed){
        isSaveInvestPerSpendComputed =  inIsSaveInvestPerSpendComputed;
    }
    
    
    
    
    
    
    
    public  BigDecimal  getTrxnValue(){
       return   trxnValue;
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
    
    
    public  boolean  getIsSaveInvestPerSpendComputed(){
        return  isSaveInvestPerSpendComputed;
    }
    
    
    public  BigDecimal  getDonation(){
       return  donation;
    }
    
    public  boolean  getIsDonationComputed(){
        return  isDonationComputed;
    }
    
    
    
    public  BigDecimal  getCommunication(BigDecimal  inCommunication){
       return   communication; 
    }
    
    
    public  boolean  getIsCommunicationComputed(){
       return   isCommunicationComputed; 
    }
    
    
    public  BigDecimal  getUtility(){
       return   utility; 
    }
    
    
    public  boolean  getIsUtilityComputed(){
       return   isUtilityComputed; 
    }
    
    
    public  BigDecimal  getLegal(){
       return   legal; 
    }
    
    
    public  boolean  getIsLegalComputed(){
       return   isLegalComputed; 
    }
    
    
    
    public  BigDecimal  getHealthCare(){
       return   healthCare; 
    }
    
    
    public  boolean  getIsHealthCareComputed(){
       return   isHealthCareComputed; 
    }
    
    
    
    public  BigDecimal  getHousing(){
       return   housing; 
    }
    
    
    public  boolean  getIsHousingComputed(){
       return   isHousingComputed; 
    }
    
    
    
    public  BigDecimal  getHousingAsset(){
       return   housingAsset; 
    }
    
    
    public  boolean  getIsHousingAssetComputed(){
       return   isHousingAssetComputed; 
    }
    
    
    
    public  BigDecimal  getEducationTraining(){
       return   educationTraining; 
    }
    
    
    public  boolean  getIsEducationTrainingComputed(){
       return   isEducationTrainingComputed; 
    }
    
    
    
}
