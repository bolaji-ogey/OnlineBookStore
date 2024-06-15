/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.api;

import i.ogeyingbo.online.bookstore.dao.PGDataRetriever;
import i.ogeyingbo.online.bookstore.model.objects.InventoryBook;
import i.ogeyingbo.online.bookstore.model.objects.UserProfile;
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
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.hibernate.validator.messageinterpolation.ParameterMessageInterpolator;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import  io.vertx.config.ConfigRetriever;


import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import i.ogeyingbo.online.bookstore.model.objects.ShoppingCartBook;
import i.ogeyingbo.online.bookstore.model.objects.UserPurchase;
import io.vertx.core.DeploymentOptions;
import io.vertx.core.ThreadingModel;
import io.vertx.core.buffer.Buffer;
import io.vertx.core.http.CookieSameSite;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.mail.DKIMSignOptions;
import io.vertx.ext.mail.MailAttachment;
import io.vertx.ext.mail.MailClient;
import io.vertx.ext.mail.MailConfig;
import io.vertx.ext.mail.MailMessage;
import io.vertx.ext.mail.StartTLSOptions;
import io.vertx.ext.web.Session;
import io.vertx.ext.web.handler.CSPHandler;
import io.vertx.ext.web.handler.SessionHandler;
import io.vertx.ext.web.handler.XFrameHandler;
import io.vertx.ext.web.sstore.ClusteredSessionStore;
import io.vertx.ext.web.sstore.LocalSessionStore;
import io.vertx.ext.web.sstore.SessionStore;
/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BookStoreAPI extends AbstractVerticle  {
    
      
  private final Logger  lendersHttpServiceAPILog = LoggerFactory.getLogger(BookStoreAPI.class);
   
  ConfigRetriever configRet =  null;    //ConfigRetriever.create(vertx);
  private    Validator    validator;
  private  static  PGDataRetriever    pgDataRetriever = null;  //   PGDataRetriever.getInstance(); 
  
  private  Map<String, String>  urlPageMap  =  new ConcurrentHashMap<>();
  
  //DomainKeys Identified Mail (DKIM) Signature signing to secure your emails.
  DKIMSignOptions dkimSignOptions =   null;
  MailConfig secureMailConfig = new MailConfig();
  MailClient    secureMailClient =   null;
          
  MailConfig   mailConfig = new MailConfig();
  MailClient    mailClient =   null;
  
 
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
              
       
       pgDataRetriever =   PGDataRetriever.getInstance();  
       
      urlPageMap.put("/bookstore/inventory/books/page", "book-inventory.html");
      urlPageMap.put("/bookstore/shoppingcart/page", "shopping-cart.html");
      
      urlPageMap.put("/fetch/users/page", "users.html");
      urlPageMap.put("/fetch/user/purchase/history/page", "purchase-history.html");
      
     dkimSignOptions = new DKIMSignOptions();
     dkimSignOptions.setPrivateKey("PKCS8 Private Key Base64 String");
     dkimSignOptions.setAuid("identifier@example.com");
     dkimSignOptions.setSelector("selector");
     dkimSignOptions.setSdid("example.com");
     
     secureMailConfig.setDKIMSignOption(dkimSignOptions).setEnableDKIM(true);
     
      mailConfig.setHostname("mail.example.com");
      mailConfig.setPort(587);
      mailConfig.setStarttls(StartTLSOptions.REQUIRED);
      mailConfig.setUsername("user");
      mailConfig.setPassword("password");
      
  }
   
   
  
   
  public static void main(String[] args) {
        
       Vertx vertx = Vertx.vertx(); 
      
       DeploymentOptions  deployOptions =  new  DeploymentOptions(); 
       deployOptions.setThreadingModel(ThreadingModel.WORKER); 
       deployOptions.setWorkerPoolSize(5);
       
       
      vertx.deployVerticle(new BookStoreAPI(), deployOptions); 
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
  /***
    configRet  = ConfigRetriever.create(vertx);
    secureMailClient = MailClient.createShared(vertx, secureMailConfig, "exampleclient");
     mailClient = MailClient.createShared(vertx, mailConfig, "exampleclient");
    ***/
  
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
    
    
    try{
        
          router.route().handler(StaticHandler.create()); 
          router.route().handler(FaviconHandler.create(vertx));
          
          router.route().handler(HSTSHandler.create());
          router.route().handler(XFrameHandler.create(XFrameHandler.DENY));
          router.route().handler(CSPHandler.create()
               .addDirective("default-src", "*.trusted.com"));
          
        // router.get("/fetch/*").consumes("application/json").handler(this::handleServerResources); 
    
        router.get("/").handler(this::handleBookStoreDashBoard); 
        router.get("/dashboard/*").handler(this::handleSecuredResources); 
        router.get("/bookstore/*").handler(this::handleServerResources);   
        router.get("/fetch/*").handler(this::handleServerResources); 
        router.get("/view/*").handler(this::handleServerResources); 
        router.route().handler(TimeoutHandler.create(200));
        router.route().handler(HSTSHandler.create());
          
    
         router.get("/filter/user/session/:userId").handler(context->{
             HttpServerResponse response = context.response();
             String  userId = context.request().getParam("userId");
            
            Session session = context.session();
            session.put("foo", "bar");
            int age = session.get("foo");
            JsonObject obj = session.remove("myobj");
            JSONObject   jsonObjectResult  = new JSONObject();
            jsonObjectResult.put("data", "");
            response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(200).send(jsonObjectResult.toString());
        }); 
         
         
         
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
 
  
  
   private  void  handleSecuredResources(RoutingContext routingContext){
       
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
           
            if(request.path().endsWith(".htm")  || request.path().endsWith(".js")  || request.path().endsWith(".css")
                         || request.path().endsWith(".map")){
                
               // file =  newFilterRequestPath(file); 
               
               System.out.println(String.format("handleTargetPage:   File served is:  %s", file));
               response.sendFile("web/" + file);
               
           }else{
                
                  String  targetPage = urlPageMap.get(request.path());
                if(targetPage != null  && !targetPage.isBlank()){
                    System.out.println(String.format("handleTargetPage:   File served is:  %s", targetPage));
                    response.sendFile("web/" + targetPage); 
                }else{
                     String error="{\"Result\":\"ERROR\",\"Message\":\"Forbiden URL Path. Url Path does not exist\"}"; 
                    response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json").setStatusCode(201).send(error);
                }
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
     
     
 


  private   void  sendSimpleMail(){
        MailMessage message = new MailMessage();
        message.setFrom("user@example.com (Example User)");
        message.setTo("recipient@example.org");
        message.setCc("Another User <another@example.net>");
        message.setBcc("Another User <another@example.net>");
        message.setText("this is the plain message text");
        message.setHtml("this is html text <a href=\"http://vertx.io\">vertx.io</a>");
        
         mailClient.sendMail(message)
        .onSuccess(System.out::println)
        .onFailure(Throwable::printStackTrace);
  }

  
  
  
  private   void  sendMailWithAttach(){
        MailMessage message = new MailMessage();
        message.setFrom("user@example.com (Example User)");
        message.setTo("recipient@example.org");
        message.setCc("Another User <another@example.net>");
        message.setBcc("Another User <another@example.net>");
        message.setText("this is the plain message text");
        message.setHtml("this is html text <a href=\"http://vertx.io\">vertx.io</a>");
        
        MailAttachment attachEmbeddedImage = MailAttachment.create();
        attachEmbeddedImage.setContentType("image/jpeg");
        attachEmbeddedImage.setData(Buffer.buffer("image data"));
        attachEmbeddedImage.setDisposition("inline");
        attachEmbeddedImage.setContentId("<image1@example.com>");
        message.setInlineAttachment(attachEmbeddedImage);
        
        MailAttachment attachment = MailAttachment.create();
        attachment.setContentType("text/plain");
        attachment.setData(Buffer.buffer("attachment file"));

        message.setAttachment(attachment);
        
        mailClient.sendMail(message)
        .onSuccess(System.out::println)
        .onFailure(Throwable::printStackTrace);
  }

   
  
  
  private   void  sendHtmlMailWithAttach(){
        MailMessage message = new MailMessage();
        message.setFrom("user@example.com (Example User)");
        message.setTo("recipient@example.org");
        message.setCc("Another User <another@example.net>"); 
        message.setBcc("Another User <another@example.net>");
        message.setHtml("this is html text <a href=\"http://vertx.io\">vertx.io</a>");
        
        MailAttachment attachEmbeddedImage = MailAttachment.create();
        attachEmbeddedImage.setContentType("image/jpeg");
        attachEmbeddedImage.setData(Buffer.buffer("image data"));
        attachEmbeddedImage.setDisposition("inline");
        attachEmbeddedImage.setContentId("<image1@example.com>");
        message.setInlineAttachment(attachEmbeddedImage);
        
        MailAttachment attachment = MailAttachment.create();
        attachment.setContentType("text/plain");
        attachment.setData(Buffer.buffer("attachment file")); 

        message.setAttachment(attachment);
        
        mailClient.sendMail(message)
        .onSuccess(System.out::println)
        .onFailure(Throwable::printStackTrace);
  }
    
    
}
