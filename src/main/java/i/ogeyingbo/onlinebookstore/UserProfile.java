/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.onlinebookstore;

import java.math.BigDecimal;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class UserProfile {
    
    private  int  id = -1;
    private String  username;
    private String  userPassword;
    private String  fullName;
    private String  mobile;
    private String  email;
    private BigDecimal  walletBalance =  new BigDecimal(0.00);
    private String  authPIN;
    private String  lastPurchaseDate;
    private String  lastPurchaseTime;
    
    
    public  void   setId(int inId){
        id = inId;
    }
    
    public  void   setUsername(String  inUsername){
        username = inUsername;
    }
    
    public  void   setUserPassword(String  inUserPassword){
        userPassword = inUserPassword;
    }
    
    public  void   setFullName(String  inFullName){
        fullName = inFullName;
    }
    
    public  void   setMobile(String  inMobile){
        mobile = inMobile;
    }
    
    public  void   setEmail(String  inEmail){
        email = inEmail;
    }
    
    public  void   setWalletBalance(BigDecimal   inWalletBalPlain){
        walletBalance = inWalletBalPlain;
    }
    
    
    public  void   setAuthPIN(String inAuthPIN){
        authPIN = inAuthPIN;
    }
    
    public  void   setLastPurchaseDate(String inLastPurchaseDate){
        lastPurchaseDate = inLastPurchaseDate;
    }
    
    public  void   setLastPurchaseTime(String inLastPurchaseTime){
       lastPurchaseTime = inLastPurchaseTime;
    }
    
     
}
