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
import io.vertx.ext.auth.impl.jose.JWT;
import io.vertx.ext.web.AllowForwardHeaders;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.validation.builder.Bodies;
import io.vertx.ext.web.validation.builder.ValidationHandlerBuilder;
import io.vertx.json.schema.common.dsl.ObjectSchemaBuilder;
import static io.vertx.json.schema.common.dsl.Schemas.objectSchema;
import static io.vertx.json.schema.common.dsl.Schemas.stringSchema;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import java.net.http.HttpResponse.BodyHandler;
import java.sql.Date;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import org.hibernate.validator.messageinterpolation.ParameterMessageInterpolator;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class BookStoreAPI  extends AbstractVerticle  {
    
      
 //  private final Logger  lendersHttpServiceAPILog = LoggerFactory.getLogger(PouchiiSchoolPortalHttpAPI.class);
   
    private    Validator    validator;
  private  static  DataRetriever   dataRetriever =   DataRetriever.getInstance();
  
  private  static  ConcurrentHashMap<String, String>   authKeys  =  new ConcurrentHashMap<>();
  public  static  long   lastTokenTime  =  0L;
  
  Algorithm algorithm =  null;
    
    JWTVerifier verifier = null;
  
  static    JWTAuth authProvider =  null;
  
  static {
      ObjectSchemaBuilder bodySchemaBuilder = objectSchema()
            .property("username", stringSchema())
            .property("password", stringSchema());
          ValidationHandlerBuilder
            .create(schemaParser)
            .body(Bodies.json(bodySchemaBuilder))
            .body(Bodies.formUrlEncoded(bodySchemaBuilder));
      
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
    
    initValidator();
    
    try{
        
        
          algorithm = Algorithm.HMAC256("Trinity");
    
          verifier = JWT.require(algorithm)
            .withIssuer("Trinity")
            .build();
    
        /** 
         JWTAuthOptions authConfig = new JWTAuthOptions()
                            .setKeyStore(new KeyStoreOptions() 
                              .setPath("keystore.jceks")
                              .setPassword("secret")
                             .setType("jceks"));
        
       JWTAuth jwtAuth = JWTAuth
         .create(vertx, new JWTAuthOptions()
           .setJWTOptions(new JWTOptions().setExpiresInSeconds(60)));
            
         router.route("/fetch/*").handler(JWTAuthHandler.create(authProvider)); 
         ***/
         

        router.post("/api/Authorize/GenerateToken").handler(this::handleAuthReq);
        
        //router.post("/fetch/*").handler(this::isAuthourized);
        
        router.get("/fetch/student/details/:matricOrJambNumber").handler(this::handleStudentDetailFetch);
        router.get("/fetch/student/session/feesdetails/:matricOrJambNumber").handler(this::handleStudentFeesDetailFetch);
        
        router.get("/fetch/student/academic/session/:matricOrJambNumber").handler(this::handleActiveSessionFetchReq);
        
        router.get("/fetch/active/faculty/list").handler(this::handleFacultyFetchReq);
        router.get("/fetch/active/department/:facultyCode").handler(this::handleDepartmentFetchReq);
        router.get("/fetch/active/courses/:departmentCode").handler(this::handleActiveCoursesByDeptFetchReq);
        
        router.get("/departmental/resultsheet/:sessionId/:semestercode/:facultyCode}/:matricOrJambNumber").handler(this::handleStudentResultFetchReq);
        
        router.get("/staff/info/:staffId").handler(this::handleStaffDetailFetch);
       // router.get("/fetch/staff/info/:staffId").handler(this::handleStaffDetailFetch);
        
        
    }catch(Exception ex){
        ex.printStackTrace();
    }
     
   
    
  vertx.createHttpServer().requestHandler(router.allowForward(AllowForwardHeaders.ALL)).listen(8080, ar -> {
 
        if (ar.succeeded()) {
                promise.complete();
                System.out.println("PouchiiSchoolPortalHttpAPI Started......");
           } else {
                promise.fail(ar.cause());
                System.out.println("PouchiiSchoolPortalHttpAPI  failed to strt");
          }
       });
  }
 
 
                        
  
  private  boolean   isAuthourized(RoutingContext  routingContext){
      String authorization = routingContext.request().headers().get(HttpHeaders.AUTHORIZATION);  
      if(authorization !=  null){
            String[]   headers =  authorization.split(" "); 
            long  currentTime  =  System.currentTimeMillis();
            System.out.println("headers[1] >>> "+headers[1]);
            System.out.println("authKeys.get(POUCHII) >>> "+authKeys.get("POUCHII"));
            System.out.println("currentTime >>> "+currentTime);
            
            if(headers[0] != null && !headers[0].isEmpty() && headers[0].trim().equalsIgnoreCase("Bearer")){
                if(headers[1] != null && !headers[1].isEmpty()){
                   
                    if((headers[1].trim().equalsIgnoreCase(authKeys.get("POUCHII")) == true) && (currentTime < lastTokenTime)){
                       System.out.println("headers[1] >>> "+headers[1]);
                       System.out.println("currentTime >>> "+currentTime);
                        return true;
                    }
                    /***
                    if(headers[1].trim().equalsIgnoreCase(authKeys.get("POUCHII")) == true) {
                       System.out.println("headers[1] >>> "+headers[1]);
                       System.out.println("currentTime >>> "+currentTime);
                        return true;
                    }
                    ***/
                } 
            }
      }
      return  false;
  }
    
  
  
   private  void handleAuthReq(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response =  routingContext.response(); 
       String  reqData  =   null; 
       
       System.out.println(routingContext.body().asJsonObject().toString());

       ActivationAuthourization  activationAuthourization =  null;
     
      JSONObject  respData  =  new JSONObject();
      
      ActivationAuthourizationResp  activationAuthourizationResp  =  new  ActivationAuthourizationResp();  
      FailedResp   failedResp  =  null;
      
       try{
           
            response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
             reqData  =   routingContext.body().asJsonObject().toString();  
           
           System.out.println("GOT HERE  35");
                if(reqData != null){
                     try{
                        activationAuthourization  =   ActivationAuthourization.readFromJSON(reqData);
                        
                        // ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                       // Validator validator = factory.getValidator();
                        Set<ConstraintViolation<ActivationAuthourization>> violations = validator.validate(activationAuthourization);

                        System.out.println("NUMBER OF VIOLATIONS  =  "+violations.size());
                        for (ConstraintViolation<ActivationAuthourization> violation : violations) {
                                System.out.println(violation.getMessage()); 
                            }
                          
                     }catch(Exception ex){
                          System.out.println("Error Here");
                         ex.printStackTrace();
                     }

                     System.out.println("activationAuthourization:  "+activationAuthourization);
                     if(activationAuthourization != null){


                           System.out.println(activationAuthourization.toString());

                           lastTokenTime =  System.currentTimeMillis() +  60000L;
                            
                           /****
                          String token = authProvider.generateToken(new JsonObject(), 
                                  new JWTOptions().setAlgorithm("HS256")
                                         .setExpiresInSeconds(60));
                          ***/
                           
                            // RandomStringUtils.random(30,true,false);
                          
                          String jwtToken = JWT.create()
                            .withIssuer("Trinity")
                            .withSubject("Trinity School Portal")
                            .withClaim("userId", RandomStringUtils.random(30,true,false))
                            .withIssuedAt(new Date(System.currentTimeMillis()))
                            .withExpiresAt(new Date(System.currentTimeMillis() + 60000L))
                            .withJWTId(UUID.randomUUID()
                              .toString())
                            .withNotBefore(new Date(System.currentTimeMillis() + 1000L))
                            .sign(algorithm);
                          
                           
                           activationAuthourizationResp.getData().setToken(jwtToken);
                           activationAuthourizationResp.getData().setExpiredAt(lastTokenTime); 
                           activationAuthourizationResp.setResponseCode(200);
                           activationAuthourizationResp.setResponseMessage("Successful");

                           authKeys.put("POUCHII", activationAuthourizationResp.getData().getToken());
                           System.out.println("token = "+authKeys.get("POUCHII"));
                          
                            System.out.println(activationAuthourizationResp.toString());
                           System.out.println("Response Code: "+activationAuthourizationResp.getResponseCode());

                           System.out.println("ReETURNED:  "+new JSONObject(activationAuthourizationResp).toString());
                           
                           
                           response.send(new JSONObject(activationAuthourizationResp).toString());
                           
                     }else{

                           failedResp  =  new FailedResp();
                           failedResp.setResponseCode(300);
                           failedResp.setResponseMessage("Failed");
                           
                           response.putHeader("Content-Type", "json").send(new JSONObject(failedResp).toString());
                     }
                  }else{

                       failedResp  =  new FailedResp();
                       failedResp.setResponseCode(400);
                       failedResp.setResponseMessage("Failed");
                       
                       response.send(new JSONObject(failedResp).toString());
                }
                 
                
       }catch(Exception ex){
            failedResp.setResponseCode(300);
            failedResp.setResponseMessage("Failed"); 
            response.send(new JSONObject(failedResp).toString());
           System.out.println(ex.getMessage());
         // ex.printStackTrace();
       }
       
  } 
       
   
   
   
    
  private  void handleStudentDetailFetch(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
         
       FetchStudentDetailResp    fetchStudentDetailResp =  null;       
       FailedResp   failedResp  =  null;  
        
            try{
                    response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
                    String authorization = routingContext.request().headers().get(HttpHeaders.AUTHORIZATION);                    
                    String[]   headers =  authorization.split(" "); 
      
                    System.out.println(headers[0]);
                    System.out.println(headers[1]);
      
                     String matricOrJambNumber = routingContext.pathParam("matricOrJambNumber"); 
                     
                     if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }

                   
                      if((matricOrJambNumber != null) && (matricOrJambNumber.isEmpty() == false)){
                             
                            fetchStudentDetailResp = dataRetriever.getStudentDetail(authorization);
                            
                            if(fetchStudentDetailResp.getData() != null){
                                
                                response.send(new JSONObject(fetchStudentDetailResp).toString());
                                
                            }else{
                                
                                     failedResp  =  new  FailedResp(); 
                                    failedResp.setResponseCode(201);
                                    failedResp.setResponseMessage("Student Record Not Found");
                                   response.send(new JSONObject(failedResp).toString());
                            }
                              
                            
                      }else{

                              failedResp  =  new  FailedResp(); 
                              failedResp.setResponseCode(201);
                              failedResp.setResponseMessage("Student Record Not Found");
                            
                            response.send(new JSONObject(failedResp).toString());
                      }
                   
                 
            }catch(Exception ex){  
                 fetchStudentDetailResp.setResponseCode(300);
                 fetchStudentDetailResp.setResponseMessage("Error while processing request"); 
                response.send(new JSONObject(failedResp).toString());
                ex.printStackTrace();
            }
        
    } 
    
   
    
    
   
    
    private  void  handleStudentFeesDetailFetch(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();   
      FetchStudentSchoolFeesResp   fetchStudentSchoolFeesResp  =  null;  
       FailedResp     failedResp   =  null;
       
            try{
                    response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
                    String matricOrJambNumber = routingContext.pathParam("matricOrJambNumber"); 
                    
                    if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }

       
                         if((matricOrJambNumber != null) && (matricOrJambNumber.isEmpty() == false)){

                              //  System.out.println(loanApplicationNotifyReq.getTenureRate());
                               System.out.println(matricOrJambNumber.toString());

                               fetchStudentSchoolFeesResp = dataRetriever.getStudentFeeDetails(matricOrJambNumber);
                            
                                if(fetchStudentSchoolFeesResp.getData().getFees() != null){

                                    response.send(new JSONObject(fetchStudentSchoolFeesResp).toString());

                                }else{

                                         failedResp  =  new  FailedResp(); 
                                        failedResp.setResponseCode(201);
                                        failedResp.setResponseMessage("Student Record Not Found");

                                       response.send(new JSONObject(failedResp).toString());
                                }
                              
                               
                         }else{

                               failedResp = new FailedResp();
                               failedResp.setResponseCode(201);
                               failedResp.setResponseMessage("Student Record Not Found");
                               
                               response.send(new JSONObject(failedResp).toString());
                         } 
                    
            }catch(Exception  ex){
                failedResp   =   new  FailedResp();
                 failedResp.setResponseCode(300);
                failedResp.setResponseMessage("Error while processing request"); 
                response.send(new JSONObject(failedResp).toString());
                ex.printStackTrace();
            }
             
       
    } 
      
      
     
    
   
    
    
    
    
   private   void   handleActiveSessionFetchReq(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database.  
       HttpServerResponse response = routingContext.response();  
       FetchActiveSessionResp   fetchActiveSessionResp =  null; 
       FailedResp     failedResp   =  null;
            
        try{
            
               response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
               String facultyCode = routingContext.pathParam("facultyCode"); 
                    
                    if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }

                
                     if(facultyCode != null){
  
                         //  fetchCourseOfStudyListByDeptResp =  new  F 
                           fetchActiveSessionResp = dataRetriever.getActiveAcdemicSession();
                            

                           if(fetchActiveSessionResp.getData()  != null){
                                
                                fetchActiveSessionResp.setResponseCode(200);
                                fetchActiveSessionResp.setResponseMessage("Successful"); 

                                 System.out.println("getDepartmentByFacultyCode  ???? "+new JSONObject(fetchActiveSessionResp).toString());
                                System.out.println("Response Code: "+fetchActiveSessionResp.getResponseCode());

                                response.send(new JSONObject(fetchActiveSessionResp).toString());
                                
                           }else{
                               failedResp   =   new  FailedResp();
                                failedResp.setResponseCode(201);
                                failedResp.setResponseMessage("session not found");

                                response.send(new JSONObject(failedResp).toString());
                               
                           }
                           
                     }else{

                           failedResp   =   new  FailedResp();
                           failedResp.setResponseCode(201);
                           failedResp.setResponseMessage("Session not found");
                           
                           response.send(new JSONObject(failedResp).toString());
                     }
                  
             
        }catch(Exception ex){
            failedResp   =   new  FailedResp();
             failedResp.setResponseCode(300);
            failedResp.setResponseMessage("Error while processing request"); 
            response.send(new JSONObject(failedResp).toString());
            ex.printStackTrace();
        }
         
    } 
   
   
   
   
   
    
     
   private  void handleFacultyFetchReq(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database.  
       HttpServerResponse response = routingContext.response();  
       FetchSchoolFacultiesResp   fetchSchoolFacultiesResp =  null; 
       FailedResp     failedResp   =  null;
            
        try{ 
            
                         response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
            
                          
                           if(!isAuthourized(routingContext)){
                                failedResp  =  new  FailedResp(); 
                                failedResp.setResponseCode(201);
                                failedResp.setResponseMessage("Un-Authorized");
                                response.send(new JSONObject(failedResp).toString());
                                return;
                            }
                          
               
                           fetchSchoolFacultiesResp = dataRetriever.getFaculties();
                            

                           if(fetchSchoolFacultiesResp.getData() != null){
                                
                                fetchSchoolFacultiesResp.setResponseCode(200);
                                fetchSchoolFacultiesResp.setResponseMessage("Successful"); 

                                 System.out.println("getFaculties()  ???? "+new JSONObject(fetchSchoolFacultiesResp).toString());
                                System.out.println("Response Code: "+fetchSchoolFacultiesResp.getResponseCode());

                                response.send(new JSONObject(fetchSchoolFacultiesResp).toString());
                                
                           }else{
                               
                                 failedResp.setResponseCode(201);
                                failedResp.setResponseMessage("Faculty information list not found"); 
                                response.send(new JSONObject(failedResp).toString()); 
                               
                           }
                           
                  
        }catch(Exception ex){
            failedResp   =   new  FailedResp();
             failedResp.setResponseCode(300);
            failedResp.setResponseMessage("Error while processing request");  
            response.send(new JSONObject(failedResp).toString());
            ex.printStackTrace();
        }
        
       
    } 
    
   
   
   
   
   
   
    
   private   void   handleDepartmentFetchReq(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database.  
       HttpServerResponse response = routingContext.response();  
       FetchSchoolDeptResp   fetchSchoolDeptResp =  null; 
       FailedResp     failedResp   =  null;
            
        try{
            
               response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
               String facultyCode = routingContext.pathParam("facultyCode"); 
               
                    if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }
      
                     if(facultyCode != null){
  
                         //  fetchCourseOfStudyListByDeptResp =  new  F 
                           fetchSchoolDeptResp = dataRetriever.getDepartmentByFacultyCode(facultyCode);
                            

                           if(fetchSchoolDeptResp.getData()  != null){
                                
                                fetchSchoolDeptResp.setResponseCode(200);
                                fetchSchoolDeptResp.setResponseMessage("Successful"); 

                                 System.out.println("getDepartmentByFacultyCode  ???? "+new JSONObject(fetchSchoolDeptResp).toString());
                                System.out.println("Response Code: "+fetchSchoolDeptResp.getResponseCode());

                                response.send(new JSONObject(fetchSchoolDeptResp).toString());
                                
                           }else{
                               failedResp   =   new  FailedResp();
                                failedResp.setResponseCode(201);
                                failedResp.setResponseMessage("Department information list not found");

                                response.send(new JSONObject(failedResp).toString());
                               
                           }
                           
                     }else{

                           failedResp   =   new  FailedResp();
                           failedResp.setResponseCode(201);
                           failedResp.setResponseMessage("Department information list not found");
                           
                           response.send(new JSONObject(failedResp).toString());
                     }
                  
             
        }catch(Exception ex){
            failedResp   =   new  FailedResp();
             failedResp.setResponseCode(300);
            failedResp.setResponseMessage("Error while processing request"); 
            response.send(new JSONObject(failedResp).toString());
            ex.printStackTrace();
        }
        
       
    } 
    
    
    
    
   private  void handleActiveCoursesByDeptFetchReq(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database.  
       HttpServerResponse response = routingContext.response();  
       FetchCourseOfStudyListByDeptResp   fetchCourseOfStudyListByDeptResp =  null; 
       FailedResp     failedResp   =  null;
            
        try{
            
               response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
               String departmentCode = routingContext.pathParam("departmentCode"); 
                    
                    if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }

                
                     if((departmentCode != null) && (departmentCode.isEmpty() == false)){

                           // System.out.println(loanApplicationNotifyReq.getTenureRate());
                           System.out.println("Department Code >>> "+departmentCode.toString());

                         //  fetchCourseOfStudyListByDeptResp =  new  F 
                           fetchCourseOfStudyListByDeptResp = dataRetriever.getCourseOfStudyByDepartmentCode(departmentCode);
                            

                           if(fetchCourseOfStudyListByDeptResp.getData() != null){
                                
                                fetchCourseOfStudyListByDeptResp.setResponseCode(200);
                                fetchCourseOfStudyListByDeptResp.setResponseMessage("Successful"); 

                                 System.out.println("fetchCourseOfStudyListByDeptResp  ???? "+new JSONObject(fetchCourseOfStudyListByDeptResp).toString());
                                System.out.println("Response Code: "+fetchCourseOfStudyListByDeptResp.getResponseCode());

                                response.send(new JSONObject(fetchCourseOfStudyListByDeptResp).toString());
                                
                           }else{
                               failedResp   =   new  FailedResp();
                                failedResp.setResponseCode(201);
                                failedResp.setResponseMessage("Course information list not found");

                                response.send(new JSONObject(failedResp).toString());
                               
                           }
                           
                     }else{

                           failedResp   =   new  FailedResp();
                           failedResp.setResponseCode(201);
                           failedResp.setResponseMessage("Course information list not found");
                           
                           response.send(new JSONObject(failedResp).toString());
                     }
                  
             
        }catch(Exception ex){
             failedResp   =   new  FailedResp();
             failedResp.setResponseCode(300);
            failedResp.setResponseMessage("Error while processing request"); 
            response.send(new JSONObject(failedResp).toString());
            ex.printStackTrace();
        }
        
       
    } 
    
   
   
    
  
   
   
   
   
       
      
  private   void handleStudentResultFetchReq(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database.  
       HttpServerResponse response = routingContext.response();  
       FetchStudentResultResp   fetchStudentResultResp =  null; 
       FailedResp     failedResp   =  null;
            
        try{
            
              response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
              if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }

            
             //  matric_no   =  ?   AND  session =  ?  AND semester = ?
               String[]    inParams =  new String[3];
               inParams[0] = routingContext.pathParam("matricOrJambNumber"); 
               inParams[1] = routingContext.pathParam("sessionId"); 
               inParams[2] = routingContext.pathParam("semesterCode"); 
      
                
                     if((inParams[0] != null)   &&  (inParams[1] != null) && (inParams[2] != null)){
  
                           fetchStudentResultResp = dataRetriever.getStudentResult(inParams);
                            

                           if(fetchStudentResultResp.getData()  != null){
                                
                                fetchStudentResultResp.setResponseCode(200);
                                fetchStudentResultResp.setResponseMessage("Successful"); 

                                 System.out.println("fetchCourseOfStudyListByDeptResp  ???? "+new JSONObject(fetchStudentResultResp).toString());
                                System.out.println("Response Code: "+fetchStudentResultResp.getResponseCode());

                                response.send(new JSONObject(fetchStudentResultResp).toString());
                                
                           }else{
                               
                               failedResp   =   new  FailedResp();
                                failedResp.setResponseCode(201);
                                failedResp.setResponseMessage("Invalid student matriculation number");

                                response.send(new JSONObject(failedResp).toString());
                               
                           }
                           
                     }else{

                           failedResp   =   new  FailedResp();
                           failedResp.setResponseCode(201);
                           failedResp.setResponseMessage("Invalid student matriculation number");
                           
                           response.send(new JSONObject(failedResp).toString());
                     }
                  
             
        }catch(Exception ex){
             failedResp.setResponseCode(300);
            failedResp.setResponseMessage("Error while processing request"); 
            response.send(new JSONObject(failedResp).toString());
            ex.printStackTrace();
        }
        
       
    }
         
         
    
  
  
  
       
 private  void    handleStaffDetailFetch(RoutingContext  routingContext){
      // clean up results in memory and update result read status in database. 
      
       HttpServerResponse response = routingContext.response();  
         
       FetchStaffResp    fetchStaffResp =  null;       
       FailedResp   failedResp  =  null;  
        
            try{
                    response.putHeader(HttpHeaders.CONTENT_TYPE.toString(), "application/json");
                    String authorization = routingContext.request().headers().get(HttpHeaders.AUTHORIZATION);                    
                    String[]   headers =  authorization.split(" "); 
      
                    System.out.println(headers[0]);
                    System.out.println(headers[1]);
      
                     String matricOrJambNumber = routingContext.pathParam("matricOrJambNumber"); 
                     
                     if(!isAuthourized(routingContext)){
                         failedResp  =  new  FailedResp(); 
                         failedResp.setResponseCode(201);
                         failedResp.setResponseMessage("Un-Authorized");
                         response.send(new JSONObject(failedResp).toString());
                         return;
                     }

                   
                      if((matricOrJambNumber != null) && (matricOrJambNumber.isEmpty() == false)){
                             
                            fetchStaffResp = dataRetriever.getStaffDetail(authorization);
                            
                            if(fetchStaffResp.getData() != null){
                                
                                response.send(new JSONObject(fetchStaffResp).toString());
                                
                            }else{
                                
                                     failedResp  =  new  FailedResp(); 
                                    failedResp.setResponseCode(201);
                                    failedResp.setResponseMessage("Staff Record Not Found");
                                   response.send(new JSONObject(failedResp).toString());
                            }
                              
                            
                      }else{

                              failedResp  =  new  FailedResp(); 
                              failedResp.setResponseCode(201);
                              failedResp.setResponseMessage("Staff Record Not Found");
                            
                            response.send(new JSONObject(failedResp).toString());
                      }
                   
                 
            }catch(Exception ex){
                failedResp  =  new  FailedResp(); 
                 failedResp.setResponseCode(300);
                 failedResp.setResponseMessage("Error while processing request"); 
                response.send(new JSONObject(failedResp).toString());
                ex.printStackTrace();
            }
        
    } 
    
  
    
}
