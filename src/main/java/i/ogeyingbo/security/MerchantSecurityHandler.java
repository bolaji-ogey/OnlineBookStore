/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */ 


import i.ogeyingbo.security.MerchSecurityVault;
import io.vertx.core.Future;
import io.vertx.core.Promise;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.StampedLock;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class MerchantSecurityHandler {
    
    private  int   nextAvailableSlot  =  0;
    
    private StampedLock  lock = new StampedLock();
  //  private   ReentrantLock   relock = new ReentrantLock();
    
   // private  ConcurrentHashMap<String, Integer>  securityKey  =  new ConcurrentHashMap<>(8, 0.6f, 5);
    private  ConcurrentHashMap<String, Integer>   securityKey   =  new ConcurrentHashMap<>();
    private  static ArrayList<Integer>   freeVaultSlots   =   new  ArrayList<>();
    
    private  static  MerchSecurityVault[]    securityVault  =  new  MerchSecurityVault[130];
    
    
    
    
   private  static  MerchantSecurityHandler   merchantSecurityHandler; 
        
    public static MerchantSecurityHandler getInstance()
    {
        if (merchantSecurityHandler == null)
        {
            synchronized (MerchantSecurityHandler.class)
            {
                merchantSecurityHandler = new MerchantSecurityHandler();
            } 
        }
        return   merchantSecurityHandler;
    }
   
    
    
    private  MerchantSecurityHandler() {}
    
    
    
    /***
    public  Future<Integer>   setSecurityKey(){
      Promise<Integer> promise = Promise.promise(); 
      
      return  promise.future();
    }
    **/
    
    
    
    public   boolean   initSecurityVault(MerchSecurityVault   merchSecurityVault){
        boolean  isSuccess  =  false;
        int   securityVaultSlot = -1; 
        
         long stamp = lock.writeLock();
            try {
                securityVaultSlot = nextAvailableSlot;
                securityVault[nextAvailableSlot]   =   merchSecurityVault;
                securityKey.put(merchSecurityVault.getPartnerCode(), securityVaultSlot);
                nextAvailableSlot  =  nextAvailableSlot  + 1;
                isSuccess  =  true;
           } finally {
            lock.unlockWrite(stamp);
         } 
      return  isSuccess;
    }
    
     
    
    
    public   boolean   refreshTokenExpiryTime(String  inPartnerCode){
        long stamp = lock.writeLock();
        boolean  isSuccess  =  false;
            try {
                int  vaultId  =  securityKey.get(inPartnerCode);
                securityVault[vaultId].refreshTokenExpiryTime(); 
                isSuccess  =  true;
           } finally {
            lock.unlockWrite(stamp);
         } 
        return  isSuccess;
    }
    
    
    
    
    public  Future<Integer>   setSecurityKey(){
      Promise<Integer> promise = Promise.promise(); 
      
      return  promise.future();
    }
    
    
    
    
    
    
}
