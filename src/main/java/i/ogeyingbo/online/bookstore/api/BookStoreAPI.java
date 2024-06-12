/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.api;

import i.ogeyingbo.online.bookstore.dao.PGDataRetriever;
import i.ogeyingbo.online.bookstore.model.objects.InventoryBook;
import i.ogeyingbo.online.bookstore.model.objects.Payment;
import i.ogeyingbo.online.bookstore.model.objects.ShoppingCart;
import i.ogeyingbo.online.bookstore.model.objects.UserProfile;
import i.ogeyingbo.online.bookstore.model.objects.UserPurchaseHistory;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;
import io.vertx.core.Vertx;
import io.vertx.core.http.HttpHeaders;
import io.vertx.core.http.HttpServerRequest;
import io.vertx.core.http.HttpServerResponse;
import io.vertx.ext.web.AllowForwardHeaders;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.handler.BodyHandler;
import io.vertx.ext.web.handler.FaviconHandler;
import io.vertx.ext.web.handler.HSTSHandler;
import io.vertx.ext.web.handler.StaticHandler;
import io.vertx.ext.web.handler.TimeoutHandler;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.hibernate.validator.messageinterpolation.ParameterMessageInterpolator;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BookStoreAPI extends AbstractVerticle  {
    
      
  private final Logger  lendersHttpServiceAPILog = LoggerFactory.getLogger(BookStoreAPI.class);
   
  private    Validator    validator;
  private  static  PGDataRetriever    pgDataRetriever =   PGDataRetriever.getInstance(); 
  
  private  Map<String, String>  urlPageMap  =  new ConcurrentHashMap<>();
 
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
  
  
  
  
  public   BookStoreAPI(){
             
      urlPageMap.put("/bookstore/inventory/books/page", "book-inventory.html");
      urlPageMap.put("/bookstore/shoppingcart/page", "shopping-cart.html");
      
      urlPageMap.put("/fetch/users/page", "users.html");
      urlPageMap.put("/fetch/user/purchase/history/page", "purchase-history.html");
      
  }
   
   
  
   
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
    
    try{
        
         router.route().handler(StaticHandler.create()); 
          router.route().handler(FaviconHandler.create(vertx));
    
        router.get("/").handler(this::handleBookStoreDashBoard);  
        router.get("/*").handler(this::handleServerResources);  
        router.route().handler(TimeoutHandler.create(200));
         router.route().handler(HSTSHandler.create());
         
         
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
        String file =  "";  
                        
        System.out.println(String.format("request.path():  %s", request.path()));
        if (request.path().equals("/") || request.path().isEmpty() || request.path().isBlank()) {
            
            file = "onlinebookstore-dashboard.html"; //file = "login.html";
            System.out.println(String.format("handleServerResources A:  File served is:  %s", file));
            response.sendFile("web/" + file); 
            
        }else if(request.path().endsWith(".js")  || request.path().endsWith(".css")
                  || request.path().endsWith(".png")  || request.path().endsWith(".jpg")){
            
                file =  filterRequestPath(request.path()); 
                System.out.println(String.format("handleServerResources B:   File served is:  %s", file));
                response.setStatusCode(200).sendFile("web/"+file);     
                
        }else if(request.path().endsWith(".html") || request.path().endsWith(".htm")  ){
            
              file = filterAndGetView(request.path());
              System.out.println(String.format("handleServerResources C:   File served is:  %s", file));
              response.sendFile("web/"+file); 
              
        }else{
            
            if(request.path().endsWith("page") ||  request.path().endsWith("pg")){
                
                handleTargetPage(routingContext);
            }else {
                
                handleDataRetrieveJSON(routingContext);
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
          
          
       
 
  
    
     public   String   filterAndGetView(String   inRequestPath){ 
        String  requestPathTokens  = inRequestPath.replace("/", ",");
        requestPathTokens  = requestPathTokens.substring(1, requestPathTokens.length());
        String[]  requestTokens  = requestPathTokens.split(",");
        System.out.println("requestTokens[requestTokens.length - 1]  >>>> "+requestTokens[requestTokens.length - 1]);
        return  requestTokens[requestTokens.length - 1];
        
    }
     
     
    
  
    
    
 public   String    filterRequestPath(String   inRequestPath){ 
        String  requestPathTokens  = inRequestPath.replace("/", ",");
        requestPathTokens  = requestPathTokens.substring(1, requestPathTokens.length());
        System.out.println("requestPathTokens  >>> "+requestPathTokens);
        String[]  requestTokens  = requestPathTokens.split(",");
        
        boolean startCaching  = false;
        StringBuilder   newPath =  new StringBuilder(200);
        
        for(int v= 0; v < requestTokens.length; v++){
           
            if(startCaching  == false){
                if(requestTokens[v].equalsIgnoreCase("css") || requestTokens[v].equalsIgnoreCase("js")
                        ||  requestTokens[v].equalsIgnoreCase("themes")){
                    startCaching =  true; 
                }
            }
            
            if(startCaching  == true){
                newPath.append('/');
                newPath.append(requestTokens[v]);
            }
        }
         
        String   newPathString  =  newPath.toString().trim();
           
        System.out.println("newPathString: "+newPathString);
         return   newPathString;
    }
        
        
        
    
    
private  void   handleTargetPage(RoutingContext routingContext){
      // clean up results in memory and update result read status in database. 
       HttpServerRequest request = routingContext.request();  
       HttpServerResponse response = routingContext.response();   
           String file = request.path();  
           System.out.println(String.format("initial request.path():  %s", request.path()));
           
           String  targetPage = urlPageMap.get(request.path());
            
           if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  || request.path().endsWith(".css")
                         || request.path().endsWith(".map")){
                
               // file =  newFilterRequestPath(file); 
               
               System.out.println(String.format("handleTargetPage:   File served is:  %s", file));
               response.sendFile("web/" + file);
               
           }else{
                
                System.out.println(String.format("handleTargetPage:   File served is:  %s", targetPage));
                response.sendFile("web/" + targetPage); 
           } 
           
  } 
      
      
 
private  void    handleDataRetrieveJSON(RoutingContext  routingContext){
    
        HttpServerRequest request = routingContext.request();  
        HttpServerResponse response = routingContext.response();   
         String requestPath = request.path(); 
        JSONObject   jsonObjectResult  = new JSONObject();
        
        try{
             
            switch(requestPath){

                                case "/bookstore/inventory/books":  jsonObjectResult.put("data", (pgDataRetriever.getBookInventory()).toArray());
                                                                   break;

                               case "/bookstore/shoppingcart/:orderId": {
                                                                          String orderId = routingContext.pathParam("orderId");
                                                                          jsonObjectResult.put("data", (pgDataRetriever.getShoppingCart(orderId)).toArray());
                                                                        }                               
                                                                     break;

                               case "/fetch/user/purchases/:userId": {
                                                                        String userId = routingContext.pathParam("userId");
                                                                        jsonObjectResult.put("data", (pgDataRetriever.getUserPurchaseHistory(Integer.parseInt(userId))).toArray());
                                                                     }  
                                                                   break;

                               case "/fetch/user/profiles":  jsonObjectResult.put("data", (pgDataRetriever.getUserProfiles()).toArray());
                                                                   break;

                               case "/bookstore/inventory/books/json":  jsonObjectResult.put("data", (pgDataRetriever.getBookInventory()).toArray());
                                                                   break;

                               default:   jsonObjectResult.put("data", (pgDataRetriever.getBookInventory()).toArray());
                                                                   break;


               }
            
            /***
            ArrayList    list  =  (ArrayList)jsonObjectResult.get("data");
             System.out.println("List  size = "+list.size());
             String  listData="{\"Result\":\"OK\",\"Records\":"+list+"}";
              System.out.println("List    = "+list.toString());
              * ***/
          response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(jsonObjectResult.toString());
          
        }catch(Exception ex){
            String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
             response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
             ex.printStackTrace();
        }
}
     
     
 
 
 
 
 
    
}
