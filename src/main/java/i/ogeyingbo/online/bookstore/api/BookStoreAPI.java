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
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import org.hibernate.validator.messageinterpolation.ParameterMessageInterpolator;
import org.json.JSONObject; 
 
import i.ogeyingbo.online.bookstore.dao.PGDataRetriever;
import i.ogeyingbo.onlinebookstore.model.objects.InventoryBook;
import i.ogeyingbo.onlinebookstore.model.objects.ShoppingCart;
import i.ogeyingbo.onlinebookstore.model.objects.UserProfile;
import i.ogeyingbo.onlinebookstore.model.objects.UserPurchaseHistory;
import i.ogeyingbo.onlinebookstore.model.objects.Payment;
import io.vertx.core.http.HttpServerRequest;
import io.vertx.ext.web.handler.BodyHandler;
import io.vertx.ext.web.handler.FaviconHandler;
import io.vertx.ext.web.handler.StaticHandler;
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
    
    router.route().handler(BodyHandler.create());
    
   // initValidator();
    
    try{
        
         router.route().handler(StaticHandler.create()); 
          router.route().handler(FaviconHandler.create(vertx));
    
        router.get("/").handler(this::handleBookStoreDashBoard);  
        router.get("/*").handler(this::handleServerResources); 
        
        router.get("/bookstore/inventory/books/page/book-inventory.html").handler(this::handleBookInventoryPg);         
        router.get("/bookstore/shoppingcart/page/shopping-cart.html").handler(this::handleShoppingCartPg);
        router.get("/fetch/users/page/users.html").handler(this::handleUserPage); 
        router.get("/fetch/user/purchase/history/page/purchase-history.html").handler(this::handleUserPurchasesPage);        
                
        router.get("/bookstore/inventory/books").handler(this::handleBookInventory);         
        router.get("/bookstore/shoppingcart/:orderId").handler(this::handleRetrieveShoppingCart);
        router.get("/fetch/user/purchases/:userId").handler(this::handleUserPurchaseHistory);
        
        router.get("/fetch/user/profiles").handler(this::handleUserProfileList);
        
        router.get("/bookstore/inventory/books/json").handler(this::handleBookInventoryJSON); 
        
        
        router.get("/bookstore/inventory/books/page/book-inventory.html").handler(this::handleBookInventoryPg);  
         
         
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
 
  
  
 
    private  void handleServerResources(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();        
        String requestPath =  request.path(); 
        String  requestPathTokens  = requestPath.replace("/", ",");
        String[]  requestTokens  = requestPathTokens.split(",");
        
        String  file = "";
                        
        System.out.println(String.format("request.path():  %s", request.path()));
        if (request.path().equals("/") || request.path().isEmpty() || request.path().isBlank()) {
            
            file = "onlinebookstore-dashboard.html"; //file = "login.html";
            System.out.println(String.format("handleServerResources:  File served is:  %s", file));
            response.sendFile("web/" + file); 
            
        }else if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  
                      || request.path().endsWith(".css") || request.path().endsWith(".map")){
            
                file = request.path();   
                System.out.println(String.format("handleServerResources:   File served is:  %s", file));
                response.sendFile("web/"+file);     
                
        }else if(request.path().endsWith(".html")){
            
              file = requestTokens[requestTokens.length - 1];
              System.out.println(String.format("handleServerResources:   File served is:  %s", file));
              response.sendFile("web/"+file); 
              
        }else{
            
             switch(request.path()){
             
                 case "/bookstore/inventory/books":  handleBookInventory(routingContext);
                                                     break;
                                                     
                 case "/bookstore/shoppingcart/:orderId":  handleRetrieveShoppingCart(routingContext);
                                                     break;
                                                     
                 case "/fetch/user/purchases/:userId":  handleUserPurchaseHistory(routingContext);
                                                     break;
                                                     
                 case "/fetch/user/profiles":  handleUserProfileList(routingContext);
                                                     break;
                                                     
                 case "/bookstore/inventory/books/json":  handleBookInventoryJSON(routingContext);
                                                            break;
                                                     
                // default:   handleBookInventoryJSON(routingContext);
                 //           break;
             }
        
        }
        
  } 
    
    
    
  private  void  handleBookStoreDashBoard(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
           
            file = "onlinebookstore-dashboard.html";
           response.sendFile("web/" + file); 
           
          
  } 
          
          
          
                        
   private  void handleBookInventoryPg(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
           
           if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  || request.path().endsWith(".css")
                         || request.path().endsWith(".map")){
               
               file = request.path();
               System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
               response.sendFile("web/" + file);
               
           }else{
               
                 file = "book-inventory.html";
                 System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
                response.sendFile("web/" + file); 
           } 
            
  } 
   
   
   
   
   private  void handleShoppingCartPg(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
           
           
            if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  || request.path().endsWith(".css")
                         || request.path().endsWith(".map")){
               
               file = request.path();
               System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
               response.sendFile("web/" + file);
               
           }else{
               
                 file = "shopping-cart.html";
                 System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
                response.sendFile("web/" + file); 
           } 
             
  } 
   
   
   
   
   private  void handleUserPage(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
             
           if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  || request.path().endsWith(".css")
                         || request.path().endsWith(".map")){
               
               file = request.path();
               System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
               response.sendFile("web/" + file);
               
           }else{
               
                 file = "users.html";
                 System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
                response.sendFile("web/" + file); 
           } 
        
  } 
   
   
   
    private  void handleUserPurchasesPage(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
            
           if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  || request.path().endsWith(".css")
                         || request.path().endsWith(".map")){
               
               file = request.path();
               System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
               response.sendFile("web/" + file);
               
           }else{
               
                 file = "purchase-history.html";
                 System.out.println(String.format("handleBookInventoryPg:   File served is:  %s", file));
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
  
  
  
  
      
  private  void    handleUserPayment(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response(); 
       boolean  paymentSuccessfull  =  false;
       UserPurchaseHistory    userPurchaseHistory = null;
        
       try{
           
                  String reqData  =   routingContext.body().asJsonObject().toString();  
                  
                    if(reqData != null){
                        
                         Payment   payment  =   Payment.readFromJSON(reqData);
                         
                            if(pgDataRetriever.makePayment(payment.getUsername(), payment.getPassword(), 
                                                            payment.getPIN(), payment.getTotalAmount()) >  0){
                                   paymentSuccessfull = true ;
                                handleUserPurchaseHistory(routingContext); 
                            }

                             String  listData="{\"Result\":\"OK\",\"Records\":"+""+"}";

                             response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(listData);
                     }   
                 
            }catch(Exception ex){  
                 String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
                response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                ex.printStackTrace();
            }
        
    } 
  
  
  
  
  
  private  void handleBookInventoryJSON(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
        
       try{
                      
                       ArrayList<InventoryBook>    inventoryBookList = pgDataRetriever.getBookInventory();
                            
                       System.out.println("inventoryBookList  size = "+inventoryBookList.size());
                       String  listData="{\"Result\":\"OK\",\"Records\":"+inventoryBookList+"}";
                            
                      JSONObject   jsonObjectResult  = new JSONObject();
                      jsonObjectResult.put("data", inventoryBookList.toArray());
                      // response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(new JSONObject(inventoryBookList.get(0)).toString());
                       response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(jsonObjectResult.toString());
                          
                 
            }catch(Exception ex){  
                 String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
                response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                ex.printStackTrace();
            }
        
    } 
 
    
}
