/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.trxn.compute.module;

import i.ogeyingbo.online.bookstore.dao.PGDataSource;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class TransactionHandlerDao  extends  TransactionHandler  {
    
     
    private   static  final   PGDataSource   pgDataSource  = PGDataSource.getInstance();
    
    private  static  TransactionHandlerDao   transactionHandlerDao; 
    
    
    public static  TransactionHandlerDao  getInstance()
    {
        if (transactionHandlerDao == null)
        {
            synchronized (TransactionHandlerDao.class)
            {
                transactionHandlerDao = new  TransactionHandlerDao();
            } 
        }
        return   transactionHandlerDao;
    }
   
    
    private   TransactionHandlerDao(){}
    
    
    
    public  static  void  main(String[]   args){
        
    }
    
    
    
    
    
}
