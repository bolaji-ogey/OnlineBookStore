/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.api;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;
import io.vertx.core.Vertx;
import io.vertx.core.http.HttpHeaders;
import io.vertx.core.http.HttpServerResponse;
import io.vertx.ext.web.AllowForwardHeaders;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.validation.builder.Bodies;
import io.vertx.ext.web.validation.builder.ValidationHandlerBuilder;
import io.vertx.json.schema.common.dsl.ObjectSchemaBuilder;
import static io.vertx.json.schema.common.dsl.Schemas.objectSchema;
import static io.vertx.json.schema.common.dsl.Schemas.stringSchema;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import org.hibernate.validator.messageinterpolation.ParameterMessageInterpolator;

 
import i.ogeyingbo.online.bookstore.dao.PGDataRetriever;
import i.ogeyingbo.onlinebookstore.model.objects.InventoryBook;
import i.ogeyingbo.onlinebookstore.model.objects.ShoppingCart;
import i.ogeyingbo.onlinebookstore.model.objects.UserProfile;
import i.ogeyingbo.onlinebookstore.model.objects.UserPurchaseHistory;
import io.vertx.core.http.HttpServerRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BookStoreAPI  extends AbstractVerticle  {
    
      
  private final Logger  lendersHttpServiceAPILog = LoggerFactory.getLogger(BookStoreAPI.class);
   
  private    Validator    validator;
  private  static  PGDataRetriever    pgDataRetriever =   PGDataRetriever.getInstance();
  
  
 
  /**
  static {
      ObjectSchemaBuilder bodySchemaBuilder = objectSchema()
            .property("username", stringSchema())
            .property("password", stringSchema());
          ValidationHandlerBuilder
            .create(schemaParser)
            .body(Bodies.json(bodySchemaBuilder))
            .body(Bodies.formUrlEncoded(bodySchemaBuilder));
      
  }
  **/
   
   
  
   
  public static void main(String[] args) {
        
      Vertx vertx = Vertx.vertx(); 
      vertx.deployVerticle(new BookStoreAPI()); 
  }
  
  
  
  
  public  void  initValidator(){
      
      
        
       validator  = Validation.byDefaultProvider()
                                        .configure()
                                        .messageInterpolator(new ParameterMessageInterpolator())
                                        .buildValidatorFactory()
               
                               .usingContext()
                                    .messageInterpolator(new ParameterMessageInterpolator())
                                    .getValidator();
  }
  
  
  
  
  @Override
  public void start(Promise<Void>  promise) { 
  // public void start() { 

    Router router = Router.router(vertx); 
    
   // initValidator();
    
    try{
        
        
        router.get("/bookstore/inventory/books/page").handler(this::handleBookInventoryPg);         
        router.get("/bookstore/shoppingcart/page").handler(this::handleShoppingCartPg);
        router.get("/fetch/users/page").handler(this::handleUserPage); 
        router.get("/fetch/user/purchase/history/page").handler(this::handleUserPurchasesPage);        
                
        router.get("/bookstore/inventory/books").handler(this::handleBookInventory);         
        router.get("/bookstore/shoppingcart/:orderId").handler(this::handleRetrieveShoppingCart);
        router.get("/fetch/user/purchases/:userId").handler(this::handleUserPurchaseHistory);
        
        router.get("/fetch/user/profiles").handler(this::handleUserProfileList);
         
         
    }catch(Exception ex){
        ex.printStackTrace();
    }
     
   
    
  vertx.createHttpServer().requestHandler(router.allowForward(AllowForwardHeaders.ALL)).listen(8080, ar -> {
 
        if (ar.succeeded()) {
                promise.complete();
                System.out.println("OnLineBookStore App Started......");
           } else {
                promise.fail(ar.cause());
                System.out.println("OnLineBookStore App  failed to strt");
          }
       });
  }
 
 
                        
   private  void handleBookInventoryPg(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
            if (file.isEmpty() || file.isBlank() || file.equals("/")) {
                file = "book-inventory.html";
                lendersHttpServiceAPILog.info(String.format("File served is:  %s", file));
                response.sendFile("web/" + file); 
           } else{
                response.sendFile("web/" + file); 
            }
  } 
   
   
   
   
   private  void handleShoppingCartPg(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
            if (file.isEmpty() || file.isBlank() || file.equals("/")) {
                file = "shopping-cart.html";
                lendersHttpServiceAPILog.info(String.format("File served is:  %s", file));
                response.sendFile("web/" + file); 
           } else{
                response.sendFile("web/" + file); 
            }
  } 
   
   
   
   
   private  void handleUserPage(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
            if (file.isEmpty() || file.isBlank() || file.equals("/")) {
                file = "users.html";
               lendersHttpServiceAPILog.info(String.format("File served is:  %s", file));
                response.sendFile("web/" + file); 
           } else{
                response.sendFile("web/" + file); 
            }
  } 
   
   
   
    private  void handleUserPurchasesPage(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
            if (file.isEmpty() || file.isBlank() || file.equals("/")) {
                file = "purchase-history.html";
                lendersHttpServiceAPILog.info(String.format("File served is:  %s", file));
                response.sendFile("web/" + file); 
           } else{
                response.sendFile("web/" + file); 
            }
  } 
    
    
   
    
  private  void handleBookInventory(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
        
       try{
                      
                       ArrayList<InventoryBook>    inventoryBookList = pgDataRetriever.getBookInventory();
                            
                       String  listData="{\"Result\":\"OK\",\"Records\":"+inventoryBookList+"}";
                            
                       response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(listData);
                         
                 
            }catch(Exception ex){  
                 String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
                response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                ex.printStackTrace();
            }
        
    } 
    
   
    
    
     
  private  void   handleRetrieveShoppingCart(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
        
       try{
                       String orderId = routingContext.pathParam("orderId"); 
                      
                       ShoppingCart    shoppingCart = pgDataRetriever.getShoppingCart(orderId);
                            
                       String  listData="{\"Result\":\"OK\",\"Records\":"+shoppingCart+"}";
                            
                       response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(listData);
                         
                 
            }catch(Exception ex){  
                 String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
                response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                ex.printStackTrace();
            }
        
    } 
  
  
    
  private  void    handleUserPurchaseHistory(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
        
       try{
                       String userId = routingContext.pathParam("userId"); 
                      
                       UserPurchaseHistory    userPurchaseHistory = pgDataRetriever.getUserPurchaseHistory(Integer.parseInt(userId));
                            
                       String  listData="{\"Result\":\"OK\",\"Records\":"+userPurchaseHistory+"}";
                            
                       response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(listData);
                         
                 
            }catch(Exception ex){  
                 String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
                response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                ex.printStackTrace();
            }
        
    } 
  
  
  
  
    
  private  void   handleUserProfileList(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
        
       try{
                       
                       ArrayList<UserProfile>    userProfileList = pgDataRetriever.getUserProfiles();
                            
                       String  listData="{\"Result\":\"OK\",\"Records\":"+userProfileList+"}";
                            
                       response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(listData);
                         
                 
            }catch(Exception ex){  
                 String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
                response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                ex.printStackTrace();
            }
        
    } 
  
  
  
  
 
    
}
