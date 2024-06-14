/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.api;

import i.ogeyingbo.online.bookstore.model.objects.InventoryBook;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.DeploymentOptions;
import io.vertx.core.ThreadingModel;
import io.vertx.core.Vertx;
import io.vertx.pgclient.PgBuilder;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.sqlclient.Pool;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.Row;
import io.vertx.sqlclient.RowSet;
import io.vertx.sqlclient.SqlClient;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class TestVerticle extends AbstractVerticle  {
    
     static  Pool   pool;
static PgConnectOptions connectOptions; 
static SqlClient   client;
    

  public   TestVerticle(){
              
         connectOptions = new PgConnectOptions()
                .setPort(5432)
                .setHost("localhost")
                .setDatabase("bookinventory")
                .setUser("root")
                .setPassword("admin");

              // Pool options
              PoolOptions poolOptions = new PoolOptions()
                .setMaxSize(15);

              // Create the client pool
              SqlClient client = PgBuilder
                .client()
                .with(poolOptions)
                .connectingTo(connectOptions)    
                .using(vertx)  
                .build();

              /***
                StringBuilder    selectQuery  =  new  StringBuilder(200);
                selectQuery.append(" SELECT  book_inventory.id as id,  book_inventory.title as title,   ");
                selectQuery.append(" book_inventory.genre as genre,  book_inventory.isbn as isbn,  ");
                selectQuery.append(" book_inventory.author as author,  book_inventory.year_published as year_published,  ");
                selectQuery.append("  book_prices.price as price,  book_prices.units_in_stock as  units_in_stock "); 
                selectQuery.append("  FROM  book_inventory  JOIN  book_prices  ");
                selectQuery.append("  ON  (book_prices.book_id  =  book_inventory.id) ");
                
                
              // A simple query
              try{
                client
                 // .query("SELECT * FROM users WHERE id='julien'")
                   .query(selectQuery.toString())
                  .execute()
                  .onComplete(ar -> {
                    if (ar.succeeded()) {
                      RowSet<Row> result = ar.result();
                      System.out.println("Got " + result.size() + " rows ");
                    } else {
                      System.out.println("Failure: " + ar.cause().getMessage());
                    }

                    // Now close the pool
                    client.close();
                  });
              }catch(Exception ex){
                  ex.printStackTrace();
              }
         **/
  }
   
   
  
   
  public static void main(String[] args) {
        
      Vertx vertx = Vertx.vertx(); 
      
       DeploymentOptions  deployOptions =  new  DeploymentOptions(); 
       deployOptions.setWorkerPoolSize(5);
       deployOptions.setThreadingModel(ThreadingModel.WORKER);
       
      vertx.deployVerticle(new TestVerticle(), deployOptions); 
  }
  
  
  
  
  
      
    
  public     ArrayList<InventoryBook>    getBookInventory(){
          
           Statement     stmnt =    null; 
           ResultSet row = null;
           ArrayList<InventoryBook>  inventoryBookList =  new   ArrayList<>();  
           
          try{
              
               StringBuilder    selectQuery  =  new  StringBuilder(200);
                selectQuery.append(" SELECT  book_inventory.id as id,  book_inventory.title as title,   ");
                selectQuery.append(" book_inventory.genre as genre,  book_inventory.isbn as isbn,  ");
                selectQuery.append(" book_inventory.author as author,  book_inventory.year_published as year_published,  ");
                selectQuery.append("  book_prices.price as price,  book_prices.units_in_stock as  units_in_stock "); 
                selectQuery.append("  FROM  book_inventory  JOIN  book_prices  ");
                selectQuery.append("  ON  (book_prices.book_id  =  book_inventory.id) ");
                
                client
                 // .query("SELECT * FROM users WHERE id='julien'")
                   .query(selectQuery.toString())
                  .execute()
                  .onComplete(ar -> {
                    if (ar.succeeded()) {
                      RowSet<Row> result = ar.result();
                      System.out.println("Got " + result.size() + " rows ");
                      
                      /****
                      try{
                          
                       while (result.next()) {
                           
                            InventoryBook   inventoryBook  =  new  InventoryBook();
                        
                            inventoryBook.setId( result.getInt("id")); 
                            inventoryBook.setTitle(row.getString("title").trim());
                            inventoryBook.setGenre(row.getString("genre").trim());
                            inventoryBook.setIsbn(row.getString("isbn").trim());
                            inventoryBook.setAuthor(row.getString("author").trim());
                            inventoryBook.setYearPublished(row.getString("year_published").trim()); 
                            inventoryBook.setPrice(row.getBigDecimal("price"));
                            inventoryBook.setUnitsInStock( row.getInt("units_in_stock"));

                           inventoryBookList.add(inventoryBook);
                           
                          }catch(Exception er){
                              er.printStackTrace();
                          }

                        } 
                        ***/
                    } else {
                      System.out.println("Failure: " + ar.cause().getMessage());
                    }
                    
                    // Now close the pool
                    client.close();
                  });
              }catch(Exception ex){
                  ex.printStackTrace();
              }
           return   inventoryBookList;
       }
     
  
  
  
  
  
}
