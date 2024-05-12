/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;

import i.ogeyingbo.onlinebookstore.model.objects.InventoryBook;
import i.ogeyingbo.onlinebookstore.model.objects.ShoppingCartBook;
import i.ogeyingbo.onlinebookstore.model.objects.UserProfile;
import i.ogeyingbo.onlinebookstore.model.objects.UserPurchaseHistory;
import i.ogeyingbo.onlinebookstore.model.objects.ShoppingCart;
import i.ogeyingbo.onlinebookstore.model.objects.UserPurchase;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement; 
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class PGDataRetriever {
    
   private   static  final   PGDataSource   pgDataSource  = PGDataSource.getInstance();
    
    private  static  PGDataRetriever   dataRetrieverx; 
    
    
    public static  PGDataRetriever  getInstance()
    {
        if (dataRetrieverx == null)
        {
            synchronized (PGDataRetriever.class)
            {
                dataRetrieverx = new PGDataRetriever();
            } 
        }
        return   dataRetrieverx;
    }
   
    
    private   PGDataRetriever(){}
    
    
    public  static  void  main(String[]  args){ 
        //System.out.println(""+PGDataRetriever.convertDateOfBirth("04/13/2023"));
    }
    
     
        
  
  
     
    
  public     ArrayList<InventoryBook>    getBookInventory(){
          
           Statement     stmnt =    null; 
           ResultSet row = null;
           ArrayList<InventoryBook>  inventoryBookList =  new   ArrayList<>(); 
           Connection  cron   = null;
           
            
           try { 
               
                
     
                StringBuilder    selectQuery  =  new  StringBuilder(200);
                selectQuery.append(" SELECT  book_inventory.id as id,  book_inventory.title as title,   ");
                selectQuery.append(" book_inventory.genre as genre,  book_inventory.isbn as isbn,  ");
                selectQuery.append(" book_inventory.author as author,  book_inventory.year_published as year_published,  ");
                selectQuery.append("  book_prices.price as price,  book_prices.units_in_stock as  units_in_stock "); 
                selectQuery.append("  FROM  book_inventory  JOIN  book_prices  ");
                selectQuery.append("  ON  (book_prices.book_id  =  book_inventory.id) ");
 
              
                cron   =  pgDataSource.getConnect();                
                System.out.println("cron = "+cron);
                
                stmnt =    cron.createStatement();
              
                row = stmnt.executeQuery(selectQuery.toString());
                  
                        // Parameters start with 1
                        while (row.next()) {

                             InventoryBook   inventoryBook  =  new  InventoryBook();
                        
                            inventoryBook.setId( row.getInt("id")); 
                            inventoryBook.setTitle(row.getString("title").trim());
                            inventoryBook.setGenre(row.getString("genre").trim());
                            inventoryBook.setIsbn(row.getString("isbn").trim());
                            inventoryBook.setAuthor(row.getString("author").trim());
                            inventoryBook.setYearPublished(row.getString("year_published").trim()); 
                            inventoryBook.setPrice(row.getBigDecimal("price"));
                            inventoryBook.setUnitsInStock( row.getInt("units_in_stock"));

                           inventoryBookList.add(inventoryBook);

                        } 
                                 
               // custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                 
                e.printStackTrace();
            }  finally{ 
               //selectQuery = null;
                 try{
                     if(stmnt !=  null){
                        stmnt.cancel();
                        stmnt.close();
                    }
                    
                    if(row != null){
                        row.close();
                    } 
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   inventoryBookList;
       }
     
  
  
       
   public     ShoppingCart    getShoppingCart(String  inOrderId){
          
           PreparedStatement    prepStmnt =    null; 
           ResultSet row = null;
           ShoppingCart   shoppingCart =   new ShoppingCart();  
           Connection  cron   = null;
             
           try { 
                   
                cron   =  pgDataSource.getConnect();                
                System.out.println("cron = "+cron);
              
                prepStmnt =    cron.prepareStatement("SELECT * FROM  shopping_cart_books  WHERE  order_serial = ? ");
                prepStmnt.setString(1, inOrderId);
                row = prepStmnt.executeQuery();
                  
                    // Parameters start with 1
                    while (row.next()) {

                        ShoppingCartBook   shoppingCartBook  =  new  ShoppingCartBook();
                        
                        shoppingCartBook.setId(row.getInt("id"));
                        shoppingCartBook.setOrderSerial(row.getString("order_serial").trim());
                        shoppingCartBook.setTitle(row.getString("title").trim());
                        shoppingCartBook.setGenre(row.getString("genre").trim());
                        shoppingCartBook.setIsbn(row.getString("isbn").trim());
                        shoppingCartBook.setAuthor(row.getString("author").trim());
                        shoppingCartBook.setYearPublished(row.getString("year_published").trim());
                        shoppingCartBook.setPrice(row.getBigDecimal("price"));
                        
                        shoppingCart.add(shoppingCartBook);
                    } 
                 
               // custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{  
                 try{
                     if(prepStmnt !=  null){
                        prepStmnt.cancel();
                        prepStmnt.close();
                    }
                    
                    if(row != null){
                        row.close();
                    } 
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   shoppingCart;
       }
     
   
   
    
   public      UserPurchaseHistory     getUserPurchaseHistory(int  userId) {
        
          StringBuilder   sbQuery = new StringBuilder(150);
           PreparedStatement    prepStmnt =    null; 
           ResultSet row = null;
           UserPurchaseHistory   userPurchaseHistory =   new UserPurchaseHistory(); 
           Connection  cron   = null;
            
           try { 
                
               String  query =  " SELECT * FROM  user_purchase_history  WHERE user_id = ?   "; 
              
                 cron   =  pgDataSource.getConnect();                
                System.out.println("cron = "+cron);
              
                prepStmnt =    cron.prepareStatement(query);
                prepStmnt.setInt(1, userId);
                row = prepStmnt.executeQuery();
                   
                    while (row.next()) {

                      UserPurchase  userPurchase  =  new  UserPurchase();
                        
                        userPurchase.setId(row.getInt("id"));
                        userPurchase.setOrderSerial(row.getString("order_serial").trim());
                        userPurchase.setTitle(row.getString("title").trim());
                        userPurchase.setGenre(row.getString("genre").trim());
                        userPurchase.setIsbn(row.getString("isbn").trim());
                        userPurchase.setAuthor(row.getString("author").trim());
                        userPurchase.setYearPublished(row.getString("year_published").trim());
                        userPurchase.setUserId( row.getInt("user_id"));
                        userPurchase.setUserName(row.getString("user_name").trim());
                        userPurchase.setUserPhoneNumber(row.getString("user_phone_number").trim());
                        userPurchase.setPurchasePrice(row.getBigDecimal("purchase_price"));
                        userPurchase.setPurchaseDate(row.getString("purchase_date").trim());
                        userPurchase.setPurchaseTime(row.getString("purchase_time").trim());
                 
                       userPurchaseHistory.add(userPurchase);
                    } 
                  
               // custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{  
                 try{
                     if(prepStmnt !=  null){
                        prepStmnt.cancel();
                        prepStmnt.close();
                    }
                    
                    if(row != null){
                        row.close();
                    } 
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   userPurchaseHistory;
       }
     
            
            
    public     ArrayList<UserProfile>    getUserProfiles(){
         
          Statement    stmnt =    null; 
           ResultSet row = null;
           ArrayList<UserProfile>   userProfileList =   new ArrayList<UserProfile>();
            Connection  cron   =  null;
            
           try { 
                
                String  query =  " SELECT   * FROM  user_profile  ";  
  
                cron   =  pgDataSource.getConnect();                
                System.out.println("cron = "+cron);
              
                stmnt =    cron.createStatement();
                                  
                row = stmnt.executeQuery(query);
                  
                // Parameters start with 1
                while (row.next()) {
                    
                      UserProfile   userProfile  =  new  UserProfile();
                      
                        userProfile.setId( row.getInt("id"));
                        userProfile.setUsername(row.getString("username").trim());
                        userProfile.setUserPassword(row.getString("user_password").trim());
                        userProfile.setFullName(row.getString("full_name").trim());
                        userProfile.setMobile(row.getString("mobile").trim());
                        userProfile.setEmail(row.getString("email").trim());
                        userProfile.setWalletBalance(row.getBigDecimal("wallet_balance"));
                        userProfile.setAuthPIN(row.getString("uath_pin").trim());
                        userProfile.setLastPurchaseDate(row.getString("last_purchase_date").trim());
                        userProfile.setLastPurchaseTime(row.getString("last_purchase_time").trim()); 
                        
                        userProfileList.add(userProfile);
                } 
                 
                //custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                e.printStackTrace();
            }  finally{  
                 try{
                     if(stmnt !=  null){
                        stmnt.cancel();
                        stmnt.close();
                    }
                    
                    if(row != null){
                        row.close();
                    } 
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   userProfileList;
       }
     
     
  
  
         
  public    int     makePayment(String  userName, String inPassword,  String PIN,  BigDecimal  inTotalAmount){
         
           StringBuilder   sbQuery = new StringBuilder(150);
           PreparedStatement    prepStmnt =    null; 
           int   resultCount  =  0;
           Connection  cron   = null;
           
            
           try { 
                
                StringBuilder   updateQuery  =  new  StringBuilder(200);
                updateQuery.append(" UPDATE   user_profile   SET  wallet_balance  =   wallet_balance  -  ? ");
                updateQuery.append(" WHERE  username = ?  AND  user_password   = ?   AND  wallet_balance >=  ?  ");  
              
                cron   =  pgDataSource.getConnect();                
                System.out.println("cron = "+cron);
                
                prepStmnt =    cron.prepareStatement(updateQuery.toString());
                
                prepStmnt.setBigDecimal(1, inTotalAmount);
                prepStmnt.setString(2, userName);
                prepStmnt.setString(3, inPassword);
                prepStmnt.setBigDecimal(4, inTotalAmount);
                        
                resultCount = prepStmnt.executeUpdate();
                           
               // custPool.closePoolConnection(identKey); 
            } catch (Exception e) {
                 
                e.printStackTrace();
            }  finally{ 
               sbQuery = null;
                 try{
                     if(prepStmnt !=  null){
                        prepStmnt.cancel();
                        prepStmnt.close();
                    }
                     
                    if(cron != null){
                        cron.close();
                    }
                } catch (Exception ex) {  
                    ex.printStackTrace();
                }
            } 
           return   resultCount;
       }
  
  
  
              
}
