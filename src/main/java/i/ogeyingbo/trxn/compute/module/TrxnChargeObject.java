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
public class TrxnChargeObject {
    
    private   BigDecimal  inChargeValue =  new  BigDecimal(0.00);
    private   boolean  isComputed   = false;
    
    
    public  void  setChargValue(BigDecimal  inChargeValue){
       inChargeValue =  inChargeValue;
    }
    
    
    
    public  void  setIsComputed(boolean  inIsComputed){
       isComputed =  inIsComputed;
    }
    
    
    
    
    
    public  BigDecimal  getChargValue(){
      return   inChargeValue;
    }
    
    
    
    public  boolean  getIsComputed(){
      return   isComputed;
    }
    
    
    
    
    
}
