/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.model.objects;

import java.util.ArrayList;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class ResultBody<T extends Object>  extends  ArrayList<T> {
    
    private  boolean  isSuccess  = true;
    
    private  String  successMessage  =  "";
    
    private  String  failureMessage  =  "";
    
    
    public  static  void main(String[]  args){
        ResultBody  result  =  (new  ResultBody()).doAdd("Hello")
                                         .onSuccess()
                                           .sayItIsSuccessfull();
    }
    
    
    public  ResultBody  setSuccessMessage(String  inMsg){
        successMessage  =   inMsg;
        return  this;
    }
     
    
    public  ResultBody  setFailureMessage(String  inMsg){
        failureMessage  =   inMsg;
        return  this;
    }
     
     
      
    
    public  ResultBody  sayItIsSuccessfull(){
        System.out.println("Operation  is Successfull");
        return  this;
    }
     
   public  ResultBody  doAdd(T  t){
        if(super.add(t) == true){
               isSuccess  = true;
        }else{
            isSuccess  = false;
        }
      return  this;
    }
    
   
    @Override
    public  boolean  add(T t){
        super.add(t);
        return true;
    }
    
    public  void  setSuccessfull(){
        isSuccess  = true;
    }
    
    public  void  setFailed(){
        isSuccess  = false;
    }
    
   
    public  ResultBody  onSuccess(){
        return  this;
    }
    
    
    public  ResultBody  onFailure(){
        return  this;
    }
    
    
    public  String  setSuccessMessage(){ 
        return  successMessage;
    }
     
    
    public  String  setFailureMessage(){ 
        return  failureMessage;
    }
     
    
}
