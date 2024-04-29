/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.onlinebookstore;

import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class ShoppingCart  extends   ArrayList<ShoppingCartBook> {
    
    
    public  boolean   clearCart(){
        
        return false;
    }
    
    public  boolean   addBook(ShoppingCartBook    newShoppingCartBook){
        newShoppingCartBook.includeInCart();
        this.add(newShoppingCartBook);
        return true;
    }
    
    public  boolean   checkOut(){
        
        return false;
    }
    
    
    
    
}
