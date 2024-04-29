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
public class InventoryBook  extends Book  {
    
    private  int   id  =  0;
    
    private   BigDecimal  price    =  new  BigDecimal(0.00);
    
    private  int   unitsInStock  =  0;
    
    
    public   void  setId(int  inId){
        id = inId;
    }
    
    
    public   void  setPrice(BigDecimal   inPrice){
        price = inPrice;
    }
    
    
    public   void  setUnitsInStock(int  inUnitsInStock){
        unitsInStock  = inUnitsInStock;
    }
    
    
    
    
    public   int  getId(){
       return   id;
    }
    
    
    public   BigDecimal  getPrice(){
       return    price;
    }
    
    
    public   int  getUnitsInStock(){
       return    unitsInStock;
    }
    
    
    
}
