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
public class Scheme {
    
   private  long    id = -1;
   private  String  schemeName;
   private  String  schemeCode;
   private  int     eraId = -1;
   private  boolean  useSchemeKey  = false;
   private  String   poolBankCode;
   
   private  String       poolAccountNumber;
   private  String       poolAccountBalance;
   private  BigDecimal       poolAccountBalancePlain = new BigDecimal(0.00);
   
   private  String       schemeEncryKey;
   private  String       lastTrxnBankPostingDate;   
   private  String       lastTrxnBankPostingTime;
   private  String       schemeCreateDate;
   
   private  String       apiKey;
   private  String       secretKey;
   private  String       callBackUrl;
   
   private  boolean      isActive  = false;
   private  int          promotions = -1;
   private  boolean      makeSchemeIncurCustomerCharges  = false;
   
   
   
   
    public  void   setId(long   inId){
         id = inId;
    }
   
    public  void   setSchemeName(String   inSchemeName){
       schemeName = inSchemeName;
    }
    
    public  void   setSchemeCode(String   inSchemeCode){
       schemeCode = inSchemeCode;
    }
    
    public  void   setEraId(int   inEraId){
        eraId = inEraId;
    }
    
    public  void   setUseSchemeKey(boolean   inUseSchemeKey){
       useSchemeKey = inUseSchemeKey;
    }
    
    public  void   setPoolBankCode(String   inPoolBankCode){
        poolBankCode = inPoolBankCode;
    }
    
    public  void   setPoolAccountNumber(String   inPoolAccountNumber){
        poolAccountNumber = inPoolAccountNumber;
    }
   
    public  void   setPoolAccountBalance(String    inPoolAccountBalance){
        poolAccountBalance = inPoolAccountBalance;
    }
    
    public  void   setPoolAccountBalancePlain(BigDecimal  inPoolAccountBalancePlain){
        poolAccountBalancePlain = inPoolAccountBalancePlain;
    }
    
    
    public  void   setSchemeEncryKey(String   inSchemeEncryKey){
         schemeEncryKey = inSchemeEncryKey;
    }
    
    
    public  void   setLastTrxnBankPostingDate(String   inLastTrxnBankPostingDate){
       lastTrxnBankPostingDate = inLastTrxnBankPostingDate;
    }
    
    public  void   setLastTrxnBankPostingTime(String   inLastTrxnBankPostingTime){
         lastTrxnBankPostingTime = inLastTrxnBankPostingTime;
    }
    
    public  void  setSchemeCreateDate(String   inSchemeCreateDate){
         schemeCreateDate = inSchemeCreateDate;
    }
     
   
   public  void   setApiKey(String   inApiKey){
         apiKey = inApiKey;
    }
    
    
    public  void   setSecretKey(String   inSecretKey){
        secretKey = inSecretKey;
    }
    
    public  void   setCallBackUrl(String   inCallBackUrl){
        callBackUrl = inCallBackUrl;
    }
    
    public  void   setIsActive(boolean   inIsActive){
        isActive = inIsActive;
    }
    
    
    public  void   setPromotions(int    inPromotions){
        promotions = inPromotions;
    }
    
    
    public  void   setMakeSchemeIncurCustomerCharges(boolean   inMakeSchemeIncurCustomerCharges){
         makeSchemeIncurCustomerCharges = inMakeSchemeIncurCustomerCharges;
    }
    
    
    
    
    
    
    
   
    
   
    public  long   getId(){
        return  id;
    }
   
    public  String   getSchemeName(){
        return  schemeName;
    }
    
    public  String   getSchemeCode(){
        return  schemeCode;
    }
    
    public  int   getEraId(){
        return  eraId;
    }
    
    public  boolean   getUseSchemeKey(){
        return  useSchemeKey;
    }
    
    public  String   getPoolBankCode(){
        return  poolBankCode;
    }
    
    
    public  String   getPoolAccountNumber(){
        return  poolAccountNumber;
    }
    
   
    public  String   getPoolAccountBalance(){
        return  poolAccountBalance;
    }
    
    public   BigDecimal  getPoolAccountBalancePlain(){
        return  poolAccountBalancePlain;
    }
    
    
    public  String   getSchemeEncryKey(){
        return  schemeEncryKey;
    }
    
    
    public  String   getLastTrxnBankPostingDate(){
        return  lastTrxnBankPostingDate;
    }
    
    public  String   getLastTrxnBankPostingTime(){
        return  lastTrxnBankPostingTime;
    }
    
    public  String   getSchemeCreateDate(){
        return  schemeCreateDate;
    }
     
   
   public  String   getApiKey(){
        return  apiKey;
    }
    
    
    public  String   getSecretKey(){
        return  secretKey;
    }
    
    public  String   getCallBackUrl(){
        return  callBackUrl;
    }
    
    public  boolean   getIsActive(){
        return  isActive;
    }
    
    
    public  int   getPromotions(){
        return  promotions;
    }
    
    
    public  boolean   getMakeSchemeIncurCustomerCharges(){
        return  makeSchemeIncurCustomerCharges;
    }
    
    
   
    
}
