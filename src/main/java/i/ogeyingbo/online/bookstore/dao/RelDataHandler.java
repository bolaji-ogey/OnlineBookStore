/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;
 
import i.ogeyingbo.onlinebookstore.*;
import io.vertx.core.json.JsonArray;
import io.vertx.core.json.JsonObject;
import io.vertx.pgclient.PgBuilder;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.sqlclient.Pool;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.Row; 
import io.vertx.sqlclient.RowSet;
import io.vertx.sqlclient.Tuple;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class RelDataHandler {
    
 static  Pool   pool;
static PgConnectOptions connectOptions; 
 // SqlClient   client;
    
    
 // private void  initPoolConnections(){
  static {
      
     String  rootPath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
     String appConfigFile = rootPath + "data_source.properties";
     
        Properties p = new Properties();
        try{
           p.load(new FileInputStream(appConfigFile));
        }catch(Exception ex){
            ex.printStackTrace();
        }
        JsonObject configJson = new JsonObject((Map) p);
        connectOptions = new PgConnectOptions(configJson);
        
       
      
       /***
       InputStream fins = getClass().getClassLoader().getResourceAsStream(appConfigFile); 
        try 
        {
            //prop.load(new FileInputStream(file));
            if(fins!=null)
                prop.load(fins);        
        }catch(Exception ex){
            ex.printStackTrace();
        }
        ***/
        connectOptions = new PgConnectOptions()
                                                    .setHost("localhost")
                                                    .setPort(5432) 
                                                    .setDatabase("bookinventory")
                                                    .setUser("postgres")
                                                    .setPassword("admin")
                                                    .setReconnectAttempts(20000)
                                                    .setReconnectInterval(1000)
                                                    .setPipeliningLimit(8);

          // Pool options
          PoolOptions poolOptions = new PoolOptions()
                                      .setMaxSize(5)
                                      .setShared(true)
                                      .setName("bolaji-ogey-pool");
          
                                      

          // Create the   pool
          pool = PgBuilder
                        .pool()
                        .connectingTo(connectOptions)
                        .with(poolOptions) 
                        .build();
                     
    }
  
  
  
  /***
  public  ArrayList<InventoryBook>  getBookInventory(){
      
     ArrayList<InventoryBook>  inventoryBookList =  new   ArrayList<>();
     
     StringBuilder    selectQuery  =  new  StringBuilder(200);
     selectQuery.append(" SELECT  book_inventory.id as id,  book_inventory.title as title,   ");
     selectQuery.append(" book_inventory.genre as genre,  book_inventory.isbn as isbn,  ");
     selectQuery.append(" book_inventory.author as author,  book_inventory.year_published as year_published,  ");
     selectQuery.append("  book_prices.price as price,  book_prices.units_in_stock as  units_in_stock "); 
     selectQuery.append("  FROM  book_inventory  JOIN  book_prices  ");
     selectQuery.append("  ON  (book_prices.book_id  =  book_inventory.id) ");
             
        pool.getConnection().compose(conn -> {
            System.out.println("Got a connection from the pool");
            JsonArray params = new JsonArray().add("Fox").add(9);
            // All operations execute on the same connection
            return conn
              .query(selectQuery.toString())
              .execute() 
          .onComplete(ar -> {
            if (ar.succeeded()) {
                    RowSet<Row> rows = ar.result();
                    System.out.println("Got " + rows.size() + " rows ");
                    for (Row row : rows) {
                        InventoryBook   inventoryBook  =  new  InventoryBook();
                        
                        inventoryBook.setId(Integer.valueOf(row.getString("id"))); 
                        inventoryBook.setTitle(row.getString("title"));
                        inventoryBook.setGenre(row.getString("genre"));
                        inventoryBook.setIsbn(row.getString("isbn"));
                        inventoryBook.setAuthor(row.getString("author"));
                        inventoryBook.setYearPublished(row.getString("year_published")); 
                        inventoryBook.setPrice(row.getBigDecimal("price"));
                        inventoryBook.setUnitsInStock(Integer.valueOf(row.getString("units_in_stock")));
                        
                       inventoryBookList.add(inventoryBook);
                      }
                    
                   System.out.println("Done");
                   conn.close();
            } else {               
             // System.out.println("Failure: Something went wrong >>> " + ar.cause().getMessage());
              ar.cause().printStackTrace();
            }
           // if(ar.failed() --> Throwable::printStackTrace()));
          });
       });
       return     inventoryBookList;
  }
  
  
  
  
 
  
 public  ArrayList<ShoppingCartBook>  getShoppingCartBooks(String   inOrderSerial){
      
     ArrayList<ShoppingCartBook>  shoppingCartBookList =  new   ArrayList<>();
             
        pool.getConnection().compose(conn -> {
            System.out.println("Got a connection from the pool");
            JsonArray params = new JsonArray().add("Fox").add(9);
            // All operations execute on the same connection
            return conn
              .preparedQuery("SELECT * FROM  shopping_cart_books  WHERE  order_serial = $1 ")
              .execute(Tuple.of(inOrderSerial)) 
          .onComplete(ar -> {
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
                   conn.close();
            } else {               
             // System.out.println("Failure: Something went wrong >>> " + ar.cause().getMessage());
              ar.cause().printStackTrace();
            }
           // if(ar.failed() --> Throwable::printStackTrace()));
          });
       });
       return     shoppingCartBookList;
  }
 
     
  
 
 
  
  public  ArrayList<UserPurchaseHistory>  getUserPurchaseHistory(int  userId){
      
     ArrayList<UserPurchaseHistory>  userPurchaseHistoryList =  new   ArrayList<>();
             
        pool.getConnection().compose(conn -> {
            System.out.println("Got a connection from the pool");
            JsonArray params = new JsonArray().add("Fox").add(9);
            // All operations execute on the same connection
            return conn
              .preparedQuery("SELECT * FROM  user_purchase_history  WHERE user_id = $1 ")
              .execute(Tuple.of(userId)) 
          .onComplete(ar -> {
            if (ar.succeeded()) {
                    RowSet<Row> rows = ar.result();
                    System.out.println("Got " + rows.size() + " rows ");
                    for (Row row : rows) {
                        UserPurchaseHistory   userPurchaseHistory  =  new  UserPurchaseHistory();
                        
                        userPurchaseHistory.setId(Integer.valueOf(row.getString("id")));
                        userPurchaseHistory.setOrderSerial(row.getString("order_serial"));
                        userPurchaseHistory.setTitle(row.getString("title"));
                        userPurchaseHistory.setGenre(row.getString("genre"));
                        userPurchaseHistory.setIsbn(row.getString("isbn"));
                        userPurchaseHistory.setAuthor(row.getString("author"));
                        userPurchaseHistory.setYearPublished(row.getString("year_published"));
                        userPurchaseHistory.setUserId(Integer.valueOf(row.getString("user_id")));
                        userPurchaseHistory.setUserName(row.getString("user_name"));
                        userPurchaseHistory.setUserPhoneNumber(row.getString("user_phone_number"));
                        userPurchaseHistory.setPurchasePrice(row.getBigDecimal("purchase_price"));
                        userPurchaseHistory.setPurchaseDate(row.getString("purchase_date"));
                        userPurchaseHistory.setPurchaseTime(row.getString("purchase_time"));
                       // System.out.println("User " + row.getString(0) + " " + row.getString(1));
                       userPurchaseHistoryList.add(userPurchaseHistory);
                      }
                    
                   System.out.println("Done");
                   conn.close();
            } else {               
             // System.out.println("Failure: Something went wrong >>> " + ar.cause().getMessage());
              ar.cause().printStackTrace();
            }
           // if(ar.failed() --> Throwable::printStackTrace()));
          });
       });
       return     userPurchaseHistoryList;
  }
  
  
   
  
  
  public  ArrayList<UserProfile>  getAllUsers(){
      
     ArrayList<UserProfile>  userProfileList =  new   ArrayList<>();
             
        pool.getConnection().compose(conn -> {
            System.out.println("Got a connection from the pool");
            JsonArray params = new JsonArray().add("Fox").add(9);
            // All operations execute on the same connection
            return conn
              .query("SELECT * FROM  user_profile   ")
              .execute() 
          .onComplete(ar -> {
            if (ar.succeeded()) {
                    RowSet<Row> rows = ar.result();
                    System.out.println("Got " + rows.size() + " rows ");
                    for (Row row : rows) {
                        UserProfile   userProfile  =  new  UserProfile();
                        userProfile.setId(Integer.valueOf(row.getString("id")));
                        userProfile.setUsername(row.getString("username"));
                        userProfile.setUserPassword(row.getString("user_password"));
                        userProfile.setFullName(row.getString("full_name"));
                        userProfile.setMobile(row.getString("mobile"));
                        userProfile.setEmail(row.getString("email"));
                        userProfile.setWalletBalance(row.getBigDecimal("wallet_balance"));
                        userProfile.setAuthPIN(row.getString("uath_pin"));
                        userProfile.setLastPurchaseDate(row.getString("last_purchase_date"));
                        userProfile.setLastPurchaseTime(row.getString("last_purchase_time")); 
                        
                        userProfileList.add(userProfile);
                      }
                    
                   System.out.println("Done");
                   conn.close();
            } else {               
             // System.out.println("Failure: Something went wrong >>> " + ar.cause().getMessage());
              ar.cause().printStackTrace();
            }
           // if(ar.failed() --> Throwable::printStackTrace()));
          });
       });
       return     userProfileList;
  }
  
  
  
  
  
  public  void  getRow(){
      
        pool.getConnection().compose(conn -> {
            System.out.println("Got a connection from the pool");

            // All operations execute on the same connection
            return conn
              .query("SELECT * FROM users WHERE id='julien'")
              .execute() 
          .onComplete(ar -> {
            if (ar.succeeded()) {
                    RowSet<Row> rows = ar.result();
                    System.out.println("Got " + rows.size() + " rows ");
                    for (Row row : rows) {
                        System.out.println("User " + row.getString(0) + " " + row.getString(1));
                      }
                   System.out.println("Done");
            } else {
              System.out.println("Failure: Something went wrong >>> " + ar.cause().getMessage());
            }
          });
       });
  }
  
  
  
  
   
    
  
  public  void  getRow2(){
      
        pool.getConnection().compose(conn -> {
            System.out.println("Got a connection from the pool");

            // All operations execute on the same connection
            return conn
              .query("SELECT * FROM users WHERE id='julien'")
              .execute()
              .compose(res -> conn
                .query("SELECT * FROM users WHERE id='emad'")
                .execute())
              .onComplete(ar -> {
                // Release the connection to the pool
                conn.close();
              });
          }).onComplete(ar -> {
            if (ar.succeeded()) {
              System.out.println("Done");
            } else {
              System.out.println("Something went wrong " + ar.cause().getMessage());
            }
          });
  }
 ***/ 
  
  
    
}
