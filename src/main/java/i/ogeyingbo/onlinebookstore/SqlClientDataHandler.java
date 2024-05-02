/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.onlinebookstore;

import io.vertx.core.json.JsonArray;
import io.vertx.pgclient.PgBuilder;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.Row;
import io.vertx.sqlclient.RowSet;
import io.vertx.sqlclient.SqlClient;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class SqlClientDataHandler {
    
    SqlClient   client;
    
    
  private void  initPoolConnections(){
         
        PgConnectOptions connectOptions = new PgConnectOptions()
                                                    .setHost("the-host")
                                                    .setPort(5432) 
                                                    .setDatabase("the-db")
                                                    .setUser("user")
                                                    .setPassword("secret")
                                                    .setReconnectAttempts(20000)
                                                    .setReconnectInterval(1000)
                                                    .setPipeliningLimit(8);

          // Pool options
          PoolOptions poolOptions = new PoolOptions()
                                      .setMaxSize(5)
                                      .setShared(true);
          
          
          // Create the client pool
          client = PgBuilder
                        .client()
                        .connectingTo(connectOptions)
                        .with(poolOptions)
                      //.using(vertx);
                        .build();                  
              
    }
  
  
  
  
  
  
  
  
  /***
 public  ArrayList<ShoppingCartBook>  getShoppingCartBooks(String   inOrderSerial){
      
     ArrayList<ShoppingCartBook>  shoppingCartBookList =  new   ArrayList<>();
     
     String  query = "SELECT * FROM  shopping_cart_books  WHERE  order_serial = $1 ";
     JsonArray params = new JsonArray().add("Fox").add(9);
             
        client.query(query, params, ar ->  
          {
            if (ar.succeeded()) {
                    RowSet<Row> rows = ar.result();
                    System.out.println("Got " + rows.size() + " rows ");
                    for (Row row : rows) {
                        ShoppingCartBook   shoppingCartBook  =  new  ShoppingCartBook();
                        
                        shoppingCartBook.setId(Integer.valueOf(row.getString("id")));
                        shoppingCartBook.setOrderSerial(row.getString("order_serial"));
                        shoppingCartBook.setTitle(row.getString("title"));
                        shoppingCartBook.setGenre(row.getString("genre"));
                        shoppingCartBook.setIsbn(row.getString("isbn"));
                        shoppingCartBook.setAuthor(row.getString("author"));
                        shoppingCartBook.setYearPublished(row.getString("year_published"));
                        shoppingCartBook.setPrice(row.getBigDecimal("price"));
                        
                        shoppingCartBookList.add(shoppingCartBook);
                      }
                    
                   System.out.println("Done"); 
            } else {               
             // System.out.println("Failure: Something went wrong >>> " + ar.cause().getMessage());
              ar.cause().printStackTrace();
            }
           // if(ar.failed() --> Throwable::printStackTrace()));
          }); 
       return     shoppingCartBookList;
  }
 
 
 **/
 
  
    
}
