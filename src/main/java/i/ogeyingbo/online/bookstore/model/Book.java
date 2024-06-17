/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.online.bookstore.model;

 


/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class Book {
    
    
     
    private String title;  // must contain only numbers and letters) 
     
    private String genre;  // it should be limited to Friction, Thriller, Mystery, Poetry, Horror, and Satire 
     
    private String isbn; // must contain only numbers and dash(-)
     
    private String author;
     
    private String yearPublished;
    
    
    public  void  setTitle(String  inTitle){
        title = inTitle;
    }
    
    public  void  setGenre(String  inGenre){
        genre = inGenre;
    }
    
    public  void  setIsbn(String  inIsbnCode){
        isbn  = inIsbnCode;
    }
    
    public  void  setAuthor(String  inAuthor){
        author = inAuthor;
    }
    
    public  void  setYearPublished(String  inYearPublished){
        yearPublished = inYearPublished;
    }
    
    
    
    
    
    
    
    public  String  getTitle(){
       return   title;
    }
    
    public  String  getGenre(){
        return   genre;
    }
    
    public  String  getIsbn(){
        return   isbn;
    }
    
    public  String  getAuthor(){
        return   author;
    }
    
    public  String  getYearPublished(){
        return   yearPublished;
    }
    
    
    
    
     
}
