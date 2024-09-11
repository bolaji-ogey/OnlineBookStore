/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module.old.archive;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class Partner {
    
    private   long   id = -1;
    private   String  partnerCode;
    private   String  partnerName;
    
    private   String  partnerPoolBankCode;
    private   String  partnerPoolBank;
    private   String  partnerPoolAccountNumber;
    
    private   String  partnerRcNumber;
    
    private  boolean  isActive  = false;
    
    
    
    public  void   setId(long  inId){
        id = inId;
    }
    
    public  void   setPartnerCode(String  inPartnerCode){
        partnerCode = inPartnerCode;
    }
    
    public  void   setPartnerName(String  inPartnerName){
        partnerName = inPartnerName;
    }
    
    public  void   setPartnerPoolBankCode(String  inPartnerPoolBankCode){
        partnerPoolBankCode = inPartnerPoolBankCode;
    }
    
    public  void   setPartnerPoolBank(String  inPartnerPoolBank){
        partnerPoolBank = inPartnerPoolBank;
    }
    
    public  void   setPartnerPoolAccountNumber(String  inPartnerPoolAccountNumber){
        partnerPoolAccountNumber = inPartnerPoolAccountNumber;
    }
    
    public  void   setPartnerRcNumber(String  inPartnerRcNumber){
        partnerRcNumber = inPartnerRcNumber;
    }
    
    
    public  void   setIsActive(boolean  inIsActive){
        isActive = inIsActive;
    }
    
    
    
     
    
    
    
    
    
    public  long   getId(){
       return    id;
    }
    
    public  String   getPartnerCode(){
       return    partnerCode;
    }
    
    public  String   getPartnerName(){
       return    partnerName;
    }
    
    public  String   getPartnerPoolBankCode(){
       return    partnerPoolBankCode;
    }
    
    public  String   getPartnerPoolBank(){
       return    partnerPoolBank;
    }
    
    public  String   getPartnerPoolAccountNumber(){
       return    partnerPoolAccountNumber;
    }
    
    public  String   getPartnerRcNumber(){
       return    partnerRcNumber;
    }
    
    
    public  boolean   getIsActive(){
        return   isActive;
    }
    
    
    
}
