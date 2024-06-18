/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.security;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class MerchSecurityVault {
    
    private  String    partnerCode;
    private  String    userAgent;  // Random string token
    private  String    requestToken;
    private  String    requestIP;
    private  String    secretSalt;   
    private  String    requestHashKey;  // The hash value of the initiation request IP +  secretSalt  
    private  long      tokenExpiryTime =  0L;
    
    
    public  MerchSecurityVault(String  inPartnerCode, String inUserAgent, String inRequestToken,  String inRequestIP,
                                            String   inSecretSalt,   String  inRequestHashKey,   long  inTokenExpiryTime){
      partnerCode = inPartnerCode.trim();
      userAgent = inUserAgent.trim();  
      requestToken = inRequestToken.trim();
      requestIP = inRequestIP.trim();
      secretSalt = inSecretSalt.trim();   
      requestHashKey  =  inRequestHashKey.trim();  // The hash value of the initiation request IP +  secretSalt  
      tokenExpiryTime =  inTokenExpiryTime;
    
    }
    
    
    public  boolean  refreshTokenExpiryTime(){
        boolean   isSucsess = false;
        tokenExpiryTime =  System.currentTimeMillis()  +  1800000;
        isSucsess = true;
        return isSucsess;
    }
    
    
    
    public  String  getPartnerCode(){
        return  this.partnerCode;
    }
    
    public  String  getUserAgent(){
        return  this.userAgent;
    }
    
    public  String  getRequestToken(){
        return  this.requestToken;
    }
    
    public  String  getRequestIP(){
        return  this.requestIP;
    }
    
    public  String  getSecretSalt(){
        return  this.secretSalt;
    }
    
    public  String  getRequestHashKey(){
        return  this.requestHashKey;
    }
    
    public  long  getTokenExpiryTime(){
        return  this.tokenExpiryTime;
    }
    
    
}
