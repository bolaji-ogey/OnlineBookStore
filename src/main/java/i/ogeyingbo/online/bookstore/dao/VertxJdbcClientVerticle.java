/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.dao;

import io.vertx.core.json.JsonArray;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.AsyncResult;
import io.vertx.core.DeploymentOptions;
import io.vertx.core.Future;
import io.vertx.core.Handler;
import io.vertx.core.Promise;
import io.vertx.core.Vertx;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.jdbc.JDBCClient;
import io.vertx.ext.sql.SQLConnection;
import io.vertx.ext.web.AllowForwardHeaders;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.handler.BodyHandler;

import  i.ogeyingbo.online.bookstore.model.objects.Whisky;
import io.vertx.core.json.Json;
import io.vertx.ext.sql.UpdateResult;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class VertxJdbcClientVerticle   extends AbstractVerticle  {
    
    static JDBCClient   jdbcClient;
    
     
  public   VertxJdbcClientVerticle(){
               
      
  }
   
   
  
   
  public static void main(String[] args) {
        
       Vertx vertx = Vertx.vertx(); 
       
       DeploymentOptions options = new DeploymentOptions()
            .setConfig(new JsonObject()
                .put("http.port", 8082)
                .put("url", "jdbc:postgresql://localhost:5432/bookinventory?username=postgres&password=admin")
                .put("driver_class", "org.postgresql.ds.PGSimpleDataSource")
            ); 
       
       
      vertx.deployVerticle(new VertxJdbcClientVerticle(), options); 
  }
  
  
   
  
  
  @Override
  public void start(Promise<Void>  promise) { 
  // public void start() {
     jdbcClient  = JDBCClient.createShared(vertx, config(), "My-Whisky-Collection");
   // configRet  = ConfigRetriever.create(vertx);
   // secureMailClient = MailClient.createShared(vertx, secureMailConfig, "exampleclient");
   //  mailClient = MailClient.createShared(vertx, mailConfig, "exampleclient");
    
     Router router = Router.router(vertx); 
      
    // Create a clustered session store using defaults
    /***
     SessionStore store = ClusteredSessionStore.create(vertx);
     SessionStore store2 = LocalSessionStore.create(vertx);
     SessionHandler sessionHandler = SessionHandler.create(store);
     sessionHandler.setCookieSameSite(CookieSameSite.STRICT);
     router.route().handler(sessionHandler);
     **/
     
    router.route().handler(BodyHandler.create()); 
     
    
  vertx.createHttpServer().requestHandler(router.allowForward(AllowForwardHeaders.ALL)).listen(8080, ar -> {
 
        if (ar.succeeded()) {
                promise.complete();
                System.out.println("VertxJdbcClientVerticle App Started......");
           } else {
                promise.fail(ar.cause());
                System.out.println("VertxJdbcClientVerticle App  failed to strt");
          }
       });
  }
 
  
 private   void startBackend(Handler<AsyncResult<SQLConnection>> next, Future<Void> fut) {
  jdbcClient.getConnection(ar -> {
    if (ar.failed()) {
       new Throwable(ar.cause()); 
        Future.failedFuture("Failed");
    } else {
      next.handle(Future.succeededFuture(ar.result()));
    }
  });
}
  
  
   

private void createSomeData(AsyncResult<SQLConnection> result,
    Handler<AsyncResult<Void>> next, Future<Void> fut) {
    if (result.failed()) {
      new Throwable(result.cause()); 
       Future.failedFuture("Failed"); 
    } else {
      SQLConnection connection = result.result();
      connection.execute(
          "CREATE TABLE IF NOT EXISTS Whisky (id INTEGER IDENTITY, name varchar(100), " +
          "origin varchar(100))",
          ar -> {
            if (ar.failed()) {
              new Throwable(ar.cause()); 
                 Future.failedFuture("Failed");
              connection.close();
              return;
            }
            connection.query("SELECT * FROM Whisky", select -> {
              if (select.failed()) {
                  new Throwable(ar.cause()); 
                     Future.failedFuture("Failed");
                connection.close();
                return;
              }
              if (select.result().getNumRows() == 0) {
                insert(
                    new Whisky("Bowmore 15 Years Laimrig", "Scotland, Islay"),
                    connection,
                    (v) -> insert(new Whisky("Talisker 57° North", "Scotland, Island"),
                        connection,
                        (r) -> {
                          next.handle(Future.<Void>succeededFuture());
                          connection.close();
                        }));													
              } else {
                next.handle(Future.<Void>succeededFuture());
                connection.close();
              }
            });
          });
    }
  }



 
  
  
  private void insert(Whisky whisky, SQLConnection connection, Handler<AsyncResult<Whisky>> next) {
      
       JsonArray   jsonArray  =  new JsonArray();
       
            jsonArray.add(whisky.getName());
            jsonArray.add(whisky.getOrigin());
       
        String sql = "INSERT INTO Whisky (name, origin) VALUES ?, ?";
        connection.updateWithParams(sql, jsonArray,
            (ar) -> {
              if (ar.failed()) {
                next.handle(Future.failedFuture("Failed"));
                return;
              }
              UpdateResult result = ar.result();
              // Build a new whisky instance with the generated id.
              Whisky w = new Whisky(result.getKeys().getInteger(0), whisky.getName(), whisky.getOrigin());
              next.handle(Future.succeededFuture(w));
            });
}
    
    
   private void getAll(RoutingContext routingContext) {
    jdbcClient.getConnection(ar -> {
      SQLConnection connection = ar.result();
      connection.query("SELECT * FROM Whisky", result -> {
        List<Whisky> whiskies = result.result().getRows().stream().map(Whisky::new).collect(Collectors.toList());
        routingContext.response()
            .putHeader("content-type", "application/json; charset=utf-8")
            .end(Json.encodePrettily(whiskies));
        connection.close(); // Close the connection		
      });
    });
  }
     
     
     
}
