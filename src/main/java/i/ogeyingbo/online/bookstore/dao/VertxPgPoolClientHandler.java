/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;
 
import i.ogeyingbo.online.bookstore.model.objects.InventoryBook;
import io.vertx.core.Future;
import io.vertx.core.net.PemTrustOptions;
import io.vertx.pgclient.PgBuilder;
import static io.vertx.pgclient.PgBuilder.client;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.pgclient.SslMode;
import io.vertx.sqlclient.Pool;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.Row;
import io.vertx.sqlclient.RowSet;
import io.vertx.sqlclient.SqlConnection;
import java.sql.Statement;
import java.util.ArrayList;
import org.json.JSONObject;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class VertxPgPoolClientHandler {
    
 static  Pool   pool;
static PgConnectOptions connectOptions;  
    
    

private  static  VertxPgPoolClientHandler   relDataHandler; 
        
    public static VertxPgPoolClientHandler getInstance()
    {
        if (relDataHandler == null)
        {
            synchronized (VertxPgSqlClientHandler.class)
            {
                relDataHandler = new VertxPgPoolClientHandler();
            } 
        }
        return   relDataHandler;
    }
   
    
    public  static  void main(String[]  args){
        VertxPgPoolClientHandler  relDataHandler  = VertxPgPoolClientHandler.getInstance();
        relDataHandler.getBookInventory();
    }
    
     
   
   
   private  VertxPgPoolClientHandler(){
       
               connectOptions = new PgConnectOptions()
                .setPort(5432)
                .setHost("localhost")
                .setDatabase("bookinventory")
                .setUser("postgres")
                .setPassword("admin")
                .setReconnectAttempts(20000)
                .setReconnectInterval(1000)
               //.setSslMode(SslMode.VERIFY_CA)
              // .setPemTrustOptions(new PemTrustOptions().addCertPath("/path/to/cert.pem"))
                .setPipeliningLimit(8);

              // Pool options
              PoolOptions poolOptions = new PoolOptions()
                .setMaxSize(15)
                .setShared(true)
                .setName("my-pg-pool")
                .setEventLoopSize(4) ;

              // Create the   pool
             pool = PgBuilder
                        .pool()
                        .connectingTo(connectOptions)
                        .with(poolOptions)  
                        .build();
 
   }
  
    
   
        
    
  public     ArrayList<InventoryBook>    getBookInventory(){
          
           Statement     stmnt =    null;  
           ArrayList<InventoryBook>  inventoryBookList =  new   ArrayList<>();  
           
           // Runs a transaction using the Pool connection
           pool.getConnection()
                // Transaction must use a connection
                .onSuccess(conn -> {
                // Begin the transaction
                conn.begin()
                  .compose(tx -> conn
                    // Various statements
                    .query("INSERT INTO Users (first_name,last_name) VALUES ('Julien','Viet')")
                    .execute()
                    .compose(res2 -> conn
                      .query("INSERT INTO Users (first_name,last_name) VALUES ('Emad','Alblueshi')")
                      .execute())
                    // Commit the transaction
                    .compose(res3 -> tx.commit()))
                  // Return the connection to the pool
                  .eventually(v -> conn.close())
                  .onSuccess(v -> System.out.println("Transaction succeeded"))
                  .onFailure(err -> System.out.println("Transaction failed: " + err.getMessage()));
              });
           
           
           return   inventoryBookList;
       }
     
  
  
  
  
    
}
