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
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.hibernate.validator.messageinterpolation.ParameterMessageInterpolator;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import i.ogeyingbo.online.bookstore.model.objects.ShoppingCartBook;
import i.ogeyingbo.online.bookstore.model.objects.UserPurchase;
import io.vertx.core.json.JsonObject;
/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BookStoreAPIPlus extends AbstractVerticle  {
    
      
  private final Logger  lendersHttpServiceAPILog = LoggerFactory.getLogger(BookStoreAPIPlus.class);
   
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
  
  
  
  
  public   BookStoreAPIPlus(){
             
      urlPageMap.put("/bookstore/inventory/books/page", "book-inventory.html");
      urlPageMap.put("/bookstore/shoppingcart/page", "shopping-cart.html");
      
      urlPageMap.put("/fetch/users/page", "users.html");
      urlPageMap.put("/fetch/user/purchase/history/page", "purchase-history.html");
      
  }
   
   
  
   
  public static void main(String[] args) {
        
      Vertx vertx = Vertx.vertx(); 
      vertx.deployVerticle(new BookStoreAPIPlus()); 
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
        router.get("/bookstore/*").handler(this::handleServerResources);   
        router.get("/fetch/*").handler(this::handleServerResources); 
        router.get("/view/*").handler(this::handleServerResources); 
        router.route().handler(TimeoutHandler.create(200));
        router.route().handler(HSTSHandler.create());
         
        
         
        router.get("/filter/user/purchases/:userId").handler(context->{

            HttpServerResponse response = context.response();
            String  userId = context.request().getParam("userId");
           // MulitMap  params = context.request().params();
            StringBuilder   result  = new StringBuilder(500);
            System.out.println("Data Retrieve method:  getUserPurchaseHistory()"); 
            JSONObject   jsonObjectResult  = new JSONObject();
            jsonObjectResult.put("data", (pgDataRetriever.getUserPurchaseHistory(Integer.parseInt(userId))).toArray());
             response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(jsonObjectResult.toString());
             
       }); 
        
        
        router.get("/filter/bookstore/shoppingcart/:orderId").handler(context->{

            HttpServerResponse response = context.response();
            String  orderId = context.request().getParam("orderId");
           // MulitMap  params = context.request().params();
            StringBuilder   result  = new StringBuilder(500);
            JSONObject   jsonObjectResult  = new JSONObject();
            jsonObjectResult.put("data", (pgDataRetriever.getShoppingCart(orderId)).toArray());
            response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(jsonObjectResult.toString());

       });
           
         
        router.get("/filter/user/purchases/:userId/view").handler(context->{

            HttpServerResponse response = context.response();
            String  userId = context.request().getParam("userId");
           // MulitMap  params = context.request().params();
            StringBuilder   result  = new StringBuilder(500);
            System.out.println("Data Retrieve method:  getUserPurchaseHistory()"); 
            result.append("\"Records\":");
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(pgDataRetriever.getUserPurchaseHistory(Integer.parseInt(userId)), new TypeToken<List<UserPurchase>>() {}.getType());
            com.google.gson.JsonArray jsonArray = element.getAsJsonArray();
            result.append(jsonArray.toString()); 
            result.append("}");  
            response.putHeader("Cache-control", "no-cache, no-store");
            response.putHeader("Pragma", "no-cache");
            response.putHeader("Expires", "-1");  
           response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(result.toString());

       }); 
        
        
        router.get("/filter/bookstore/shoppingcart/:orderId/view").handler(context->{

            HttpServerResponse response = context.response();
            String  orderId = context.request().getParam("orderId");
           // MulitMap  params = context.request().params();
            StringBuilder   result  = new StringBuilder(500);
            System.out.println("Data Retrieve method:  getShoppingCart()"); 
            result.append("\"Records\":");
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(pgDataRetriever.getShoppingCart(orderId), new TypeToken<List<ShoppingCartBook>>() {}.getType());
            com.google.gson.JsonArray jsonArray = element.getAsJsonArray();
            result.append(jsonArray.toString()); 
            result.append("}");  
            response.putHeader("Cache-control", "no-cache, no-store");
            response.putHeader("Pragma", "no-cache");
            response.putHeader("Expires", "-1");  
           response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(result.toString());

       });
           
         
         
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
                
                 System.out.println(String.format("handleTargetPage"));
                handleTargetPage(routingContext);
                
            }else if(request.path().startsWith("/view") ||  request.path().endsWith("/view")
                      ||  request.path().startsWith("/vw")  ||  request.path().endsWith("/vw")){
                
                System.out.println(String.format("handleDataRetrieveViewJSON"));
                handleDataRetrieveViewJSON(routingContext);
                
            }else {
                
                 System.out.println(String.format("handleDataRetrieveJSON"));
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
          
          
       
 
  
    
    private   String   filterAndGetView(String   inRequestPath){ 
        String  requestPathTokens  = inRequestPath.replace("/", ",");
        requestPathTokens  = requestPathTokens.substring(1, requestPathTokens.length());
        String[]  requestTokens  = requestPathTokens.split(",");
        System.out.println("requestTokens[requestTokens.length - 1]  >>>> "+requestTokens[requestTokens.length - 1]);
        return  requestTokens[requestTokens.length - 1];
        
    }
     
     
    
  
    
    
 private   String    filterRequestPath(String   inRequestPath){ 
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
             System.out.println("Switch Request Path"+requestPath);
            switch(requestPath){

                    case "/bookstore/inventory/books":  { jsonObjectResult.put("data", (pgDataRetriever.getBookInventory()).toArray()); }
                                                       break; 

                   case "/fetch/user/profiles":  jsonObjectResult.put("data", (pgDataRetriever.getUserProfiles()).toArray());
                                                       break;

                   case "/bookstore/inventory/books/json":  jsonObjectResult.put("data", (pgDataRetriever.getBookInventory()).toArray());
                                                       break;

                   default:   jsonObjectResult.put("data", (pgDataRetriever.getBookInventory()).toArray());
                                                       break;


               }
            
             
          response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(jsonObjectResult.toString());
          
        }catch(Exception ex){
            String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
             response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
             ex.printStackTrace();
        }
}
     
     
 
 
 
 
 
private  void    handleDataRetrieveViewJSON(RoutingContext  routingContext){
    
        HttpServerRequest request = routingContext.request();  
        HttpServerResponse response = routingContext.response();   
         String requestPath = request.path(); 
        JSONObject   jsonObjectResult  = new JSONObject();
        
        StringBuilder   result  = new StringBuilder(500);
        result.append("{\"Result\":\"OK\",");
        
        try{
             System.out.println("Switch Request Path"+requestPath);
            switch(requestPath){

                    case  "/view/bookstore/inventory/books" :  {
                                                                 System.out.println("Data Retrieve method:  getBookInventory()");
                                                                result.append("\"Records\":");
                                                                Gson gson = new Gson();
                                                                JsonElement element = gson.toJsonTree(pgDataRetriever.getBookInventory(), new TypeToken<List<InventoryBook>>() {}.getType());
                                                                com.google.gson.JsonArray jsonArray = element.getAsJsonArray();
                                                                result.append(jsonArray.toString());
                                                                result.append("}");                                                                             
                                                            }
                                                       break;   

                   case "/view/fetch/user/purchases":   {
                                                                     System.out.println("Data Retrieve method:  getUserPurchaseHistory()");
                                                                    String userId = routingContext.pathParam("userId");
                                                                    result.append("\"Records\":");
                                                                    Gson gson = new Gson();
                                                                    JsonElement element = gson.toJsonTree(pgDataRetriever.getUserPurchaseHistory(Integer.parseInt(userId)), new TypeToken<List<UserPurchase>>() {}.getType());
                                                                    com.google.gson.JsonArray jsonArray = element.getAsJsonArray();
                                                                    result.append(jsonArray.toString()); 
                                                                    result.append("}");                                                                         
                                                                 }  
                                                               break; 
                   case "/view/fetch/user/profiles":  {
                                                            System.out.println("Data Retrieve method:  getUserProfiles()");
                                                            result.append("\"Records\":");
                                                            Gson gson = new Gson();
                                                            JsonElement element = gson.toJsonTree(pgDataRetriever.getUserProfiles(), new TypeToken<List<UserProfile>>() {}.getType());
                                                            com.google.gson.JsonArray jsonArray = element.getAsJsonArray();
                                                            result.append(jsonArray.toString()); 
                                                           result.append("}");                                                                             
                                                       } 
                                                       break;


                   case "/view/bookstore/inventory/books/json":   {
                                                                    result.append("\"Records\":");
                                                                    Gson gson = new Gson();
                                                                    JsonElement element = gson.toJsonTree(pgDataRetriever.getBookInventory(), new TypeToken<List<InventoryBook>>() {}.getType());
                                                                    com.google.gson.JsonArray jsonArray = element.getAsJsonArray();
                                                                    result.append(jsonArray.toString()); 
                                                                    result.append("}");                                                                             
                                                                }
                                                       break;

                                            default:   {
                                                           String error="{\"Result\":\"ERROR\",\"Message\":\"Resource NOT available\"}"; 
                                                           result  = new StringBuilder(200);
                                                           result.append(error);
                                                       }
                                                       break;


               } 
            
             response.putHeader("Cache-control", "no-cache, no-store");
            response.putHeader("Pragma", "no-cache");
            response.putHeader("Expires", "-1");  
           response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(result.toString());
          
        }catch(Exception ex){
            String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}"; 
             response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
             ex.printStackTrace();
        }
}
     
     
 



    
}
