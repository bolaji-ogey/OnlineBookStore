/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.model.objects;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */ 
 

import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class  ObjectBody  {
    
    private  boolean  isSuccess  = true;
    
    private  String  successMessage  =  "";
    
    private  String  failureMessage  =  "";
    
    
    public  static  void main(String[]  args){
        ObjectBody  result  =  (new  ObjectBody()).onSuccess()
                                           .sayItIsSuccessfull();
    }
    
    
    public  ObjectBody  setSuccessMessage(String  inMsg){
        successMessage  =   inMsg;
        return  this;
    }
     
    
    public  ObjectBody  setFailureMessage(String  inMsg){
        failureMessage  =   inMsg;
        return  this;
    }
     
     
      
    
    public  ObjectBody  sayItIsSuccessfull(){
        System.out.println("Operation  is Successfull");
        return  this;
    }
     
    
   
    
    public  void  setSuccessfull(){
        isSuccess  = true;
    }
    
    public  void  setFailed(){
        isSuccess  = false;
    }
    
   
    public  ObjectBody  onSuccess(){
        return  this;
    }
    
    
    public  ObjectBody  onFailure(){
        return  this;
    }
    
    
    public  String  setSuccessMessage(){ 
        return  successMessage;
    }
     
    
    public  String  setFailureMessage(){ 
        return  failureMessage;
    }
     
    
}
