/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;

import i.ogeyingbo.online.bookstore.model.InventoryBook;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class AccountDBInterface {
    
    
     private   static  final   PGDataSource   pgDataSource  = PGDataSource.getInstance("Accounts");
    
    private  static  AccountDBInterface   accountDBInterface; 
    
    
    public static  AccountDBInterface  getInstance()
    {
        if (accountDBInterface == null)
        {
            synchronized (AccountDBInterface.class)
            {
                accountDBInterface = new AccountDBInterface();
            } 
        }
        return   accountDBInterface;
    }
   
    
    private   AccountDBInterface(){}
    
    
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
                      
                  System.out.println("Inventory Books >>>> "+inventoryBookList.size());
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
     
  
  
       
    
}
