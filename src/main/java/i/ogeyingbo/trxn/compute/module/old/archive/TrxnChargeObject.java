/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module.old.archive;

import java.math.BigDecimal;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class TrxnChargeObject {
    
    private   BigDecimal  income =  new  BigDecimal(0.00);
    private   BigDecimal  chargeValue =  new  BigDecimal(0.00);
    private   boolean  isComputed   = false;
    
    
    
    public  void  setIncome(BigDecimal  inIncome){
       income =  inIncome;
    }
    
    
    public  void  setChargValue(BigDecimal  inChargeValue){
       chargeValue =  inChargeValue;
    }
    
    
    
    public  void  setIsComputed(boolean  inIsComputed){
       isComputed =  inIsComputed;
    }
    
    
    
    
    
    
    public  BigDecimal  getIncome(){
      return   income;
    }
    
    
    
    public  BigDecimal  getChargValue(){
      return   chargeValue;
    }
    
    
    
    public  boolean  getIsComputed(){
      return   isComputed;
    }
    
    
    
    
    
}
