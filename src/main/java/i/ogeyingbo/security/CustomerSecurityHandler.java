/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.security;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */ 
import io.vertx.core.Future;
import io.vertx.core.Promise;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.StampedLock;

import io.vertx.core.Future;
import io.vertx.core.Promise;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.StampedLock;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class CustomerSecurityHandler {
    
    private  int   nextAvailableSlot  =  0;
    
    private StampedLock  lock = new StampedLock();
  //  private   ReentrantLock   relock = new ReentrantLock();
    
   // private  ConcurrentHashMap<String, Integer>  securityKey  =  new ConcurrentHashMap<>(8, 0.6f, 5);
    private  ConcurrentHashMap<String, Integer>   securityKey   =  new ConcurrentHashMap<>();
    private  static ArrayList<Integer>   freeVaultSlots   =   new  ArrayList<>();
    
    private  static  CustSecurityVault[]    securityVault  =  new  CustSecurityVault[130];
    
    
    
    
   private  static  CustomerSecurityHandler   customerSecurityHandler; 
        
    public static CustomerSecurityHandler getInstance()
    {
        if (customerSecurityHandler == null)
        {
            synchronized (CustomerSecurityHandler.class)
            {
                customerSecurityHandler = new CustomerSecurityHandler();
            } 
        }
        return   customerSecurityHandler;
    }
   
    
    
    private  CustomerSecurityHandler() {}
    
    
    
    /***
    public  Future<Integer>   setSecurityKey(){
      Promise<Integer> promise = Promise.promise(); 
      
      return  promise.future();
    }
    **/
    
    
    
    public   boolean   initSecurityVault(CustSecurityVault   custSecurityVault){
        long stamp = lock.writeLock();
        int   securityVaultSlot = -1;
        boolean  isSuccess  =  false;   
            try {
                securityVaultSlot = nextAvailableSlot;
                securityVault[nextAvailableSlot]   =   custSecurityVault;
                securityKey.put(custSecurityVault.getCustomerReference(), securityVaultSlot);
                nextAvailableSlot  =  nextAvailableSlot  + 1;
                isSuccess  =  true;
           } finally {
            lock.unlockWrite(stamp);
         } 
      return  isSuccess;
    }
    
     
    
    
    public   boolean   setNextEncryptionKey(String  inPartnerCode){
        long stamp = lock.writeLock();
        boolean  isSuccess  =  false;
        String   newNextEncryptKey =  "";
            try {
                int  vaultId  =  securityKey.get(inPartnerCode);
                securityVault[vaultId].setNextEncryptionKey(newNextEncryptKey); 
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

