/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.security;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class CustSecurityVault {
    
    private  String    customerReference; 
    private  String    requestIP;
    private  String    secretSalt; 
    private  String    requestHashKey;      
    private  String    requestEncryptionKey;
    
    
    
    public  CustSecurityVault(String  inCustomerReference,  String inRequestIP,  String   inSecretSalt,  
                                                    String  inRequestHashKey,   String  inRequestEncryptionKey){
      customerReference = inCustomerReference.trim(); 
      requestIP = inRequestIP.trim();
      secretSalt = inSecretSalt.trim();   
      requestHashKey  =  inRequestHashKey.trim();  // The hash value of the initiation request IP +  secretSalt  
      requestEncryptionKey =  inRequestEncryptionKey.trim();
    
    }
     
    
    
    public  boolean  setNextEncryptionKey(String  newRequestEncryptionKey){
        boolean   isSucsess = false;
        requestEncryptionKey =  newRequestEncryptionKey;
        isSucsess = true;
        return isSucsess;
    }
    
    
    
    public  String  getCustomerReference(){
        return  this.customerReference;
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
    
    public  String   getRequestEncryptionKey(){
        return  this.requestEncryptionKey;
    }
    
    
    
    
}
