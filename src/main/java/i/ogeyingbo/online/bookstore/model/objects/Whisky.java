/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.model.objects;

import io.vertx.core.json.JsonObject;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class Whisky {
    
    private  int  id = -1;    
    private String name;    
    private String  origin;
    
    
    public  Whisky(String inName, String inOrigin){ 
        name = inName;
        origin = inOrigin;
    }
    
    public  Whisky(int inId,  String inName, String inOrigin){
        id  = inId;
        name = inName;
        origin = inOrigin;
    }
    
    public  Whisky(JsonObject   jsonObject){ 
    }
    
    
    public void setId(int inId){
        id = inId;
    }
    
    public void setName(String inName){
        name = inName;
    }
    
    
    public void setOrigin(String inOrigin){
        origin = inOrigin;
    }
    
    
    
    public int getId(){
       return  id;
    }
    
    public String getName(){
       return  name;
    }
    
    
    public String getOrigin(){
       return  origin;
    }
    
    
}
