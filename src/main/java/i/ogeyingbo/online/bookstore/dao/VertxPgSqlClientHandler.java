/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;
 
import i.ogeyingbo.online.bookstore.model.objects.InventoryBook;
import io.vertx.core.net.PemTrustOptions;
import io.vertx.pgclient.PgBuilder;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.pgclient.SslMode;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.Row;
import io.vertx.sqlclient.RowSet;
import io.vertx.sqlclient.SqlClient;
import java.sql.Statement;
import java.util.ArrayList;
import org.json.JSONObject;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class VertxPgSqlClientHandler {
     
static PgConnectOptions connectOptions; 
static SqlClient   client;
static  String   dbConnectionUrl  =  "jdbc:postgresql://localhost:5432/bookinventory?username=postgres&password=admin";
    
    

private  static  VertxPgSqlClientHandler   relDataHandler; 
        
    public static VertxPgSqlClientHandler getInstance()
    {
        if (relDataHandler == null)
        {
            synchronized (VertxPgSqlClientHandler.class)
            {
                relDataHandler = new VertxPgSqlClientHandler();
            } 
        }
        return   relDataHandler;
    }
   
    
    public  static  void main(String[]  args){
        VertxPgSqlClientHandler  relDataHandler  = VertxPgSqlClientHandler.getInstance();
        relDataHandler.getBookInventory();
    }
    
     
   
   private  VertxPgSqlClientHandler(){
       
               connectOptions = new PgConnectOptions()
                .setPort(5432)
                .setHost("localhost")
                .setDatabase("bookinventory")
                .setUser("postgres")
                .setPassword("admin")
                .setReconnectAttempts(20000)
                .setReconnectInterval(1000)
                // .setSslMode(SslMode.VERIFY_CA)
               //  .setPemTrustOptions(new PemTrustOptions().addCertPath("/path/to/cert.pem"))
                .setPipeliningLimit(12);
                       

              // Pool options
              PoolOptions poolOptions = new PoolOptions()
                .setMaxSize(15)
                .setShared(true)
                .setName("sql-client-pool")
                .setEventLoopSize(4) ;

              // Create the client pool
              client = PgBuilder
                .client()
                .with(poolOptions)
                 .connectingTo(connectOptions)  
               // .connectingTo(dbConnectionUrl)
                .build();
 
   }
  
    
   
        
    
  public     ArrayList<InventoryBook>    getBookInventory(){
          
           Statement     stmnt =    null;  
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
                .query(selectQuery.toString())
                  .execute()
                  .onComplete(ar -> {
                    if (ar.succeeded()) {
                      RowSet<Row> result = ar.result();
                      System.out.println("Got " + result.size() + " rows ");
                       
                       for (Row row : result) {
                           
                            InventoryBook   inventoryBook  =  new  InventoryBook();
                        
                            inventoryBook.setId( row.getInteger("id")); 
                            inventoryBook.setTitle(row.getString("title").trim());
                            inventoryBook.setGenre(row.getString("genre").trim());
                            inventoryBook.setIsbn(row.getString("isbn").trim());
                            inventoryBook.setAuthor(row.getString("author").trim());
                            inventoryBook.setYearPublished(row.getString("year_published").trim()); 
                            inventoryBook.setPrice(row.getBigDecimal("price"));
                            inventoryBook.setUnitsInStock( row.getInteger("units_in_stock"));

                           inventoryBookList.add(inventoryBook);
                           
                        } 
                       JSONObject   jsonObjectResult  = new JSONObject();
                       jsonObjectResult.put("data", inventoryBookList);
                       System.out.println(jsonObjectResult.toString());
                       
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
