/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.input;

    
import i.ogeyingbo.online.bookstore.dao.AccountDBInterface;
import java.util.Scanner;  // Import the Scanner class
/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class AccountingInput {
    
    final static String  errorMsg  =  "Error!: Invalid transaction entry.";
    
    final static String RESET = "\u001B[0m";
    final static String RED = "\u001B[31m";
    final static String GREEN = "\u001B[32m";
    final static String YELLOW = "\u001B[33m";
    
    private  static  AccountDBInterface    accountDBInterface = null; 
    
    static boolean trxnActionFound = false;
    static boolean trxnInstrumentFound  = false; 
    static boolean trxnItemFound  = false;
    static boolean trxnEntityFound = false;
    
    static String trxnAction = "";
    static String trxnInstrument  = ""; 
    static String trxnItem  = "";
    static String trxnEntity = "";
    
    
    static String trxnActionTable = "";
    static String trxnInstrumentTable  = ""; 
    static String trxnItemTable  = "";
    static String trxnEntityTable = "";
    
    
    public AccountingInput(){
        accountDBInterface =   AccountDBInterface.getInstance(); 
    }
    
    
  public static void main(String[] args) {
   
       AccountingInput.doAccountingEntry();
    
  }
   
  
  
  
  
  public  static void  doAccountingEntry(){
      
        Scanner initInputScan = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Enter accounting entry...");

        String accountEntry  = initInputScan.nextLine();  // Read user input
        System.out.println("Echo :: " + accountEntry);  // Output user input
           
      while(accountEntry.equalsIgnoreCase("Exit") == false){
          
            trxnActionFound = false;
            trxnInstrumentFound  = false; 
            trxnItemFound  = false;
            trxnEntityFound = false;
            
            trxnAction = "";
            trxnInstrument  = ""; 
            trxnItem  = "";
            trxnEntity = "";
            
            trxnActionTable = "";
            trxnInstrumentTable  = ""; 
            trxnItemTable  = "";
            trxnEntityTable = "";
          
            boolean errorMsgSet =  false;
            
          
           accountEntry  = accountEntry.toLowerCase();
     
           checkTrxnAction(accountEntry);
           checkTrxnInstrument(trxnAction, accountEntry);
            checkTrxnItem(accountEntry);
            
  
            if(trxnActionFound == false){
                if(errorMsgSet == false){
                   System.out.println(RED + errorMsg + RESET); errorMsgSet = true;    
                 }
                System.out.println("    Reason: No Transaction Action Found ");
            }
            
            if(trxnInstrumentFound == false){
                if(errorMsgSet == false){ 
                   System.out.println(RED + errorMsg + RESET); errorMsgSet = true;    
                 }
                System.out.println("    Reason: No Transaction Instrument Found ");
            }
            
            if(trxnItemFound == false){
                 if(errorMsgSet == false){
                   System.out.println(RED + errorMsg + RESET); errorMsgSet = true;   
                 }
                System.out.println("    Reason: No Transaction Item Found ");
            }
            
            
            if(trxnActionFound == true && trxnInstrumentFound == true && trxnItemFound == true){
                System.out.println(GREEN + "Input Accepted." + RESET);
            }
             
            Scanner inputScan = new Scanner(System.in);  // Create a Scanner object
            System.out.println("\n\nEnter accounting entry...");

            accountEntry  = inputScan.nextLine();  // Read user input
            System.out.println("Echo :: " + accountEntry);  // Output user input
    
      }
      
      
      
  }
 
  
  
  
    public  static  void   checkTrxnAction(String  inAccountEntry){
        
           if(inAccountEntry.contains("return")){

                trxnActionFound = true;  trxnAction = "return";
                if(inAccountEntry.contains("purchase") || inAccountEntry.contains("bought")){
                  trxnActionTable =   accountDBInterface.getAccountTableName("return_out");
                }
                
                if(inAccountEntry.contains("sold")){
                    trxnActionTable =   accountDBInterface.getAccountTableName("return_in");
                }
            }else if(inAccountEntry.contains("sold")){

                 trxnActionFound = true;   trxnAction = "sold";
                 trxnActionTable =   accountDBInterface.getAccountTableName("sold");
            }else if(inAccountEntry.contains("purchase")  || inAccountEntry.contains("bought")){

                trxnActionFound = true;   trxnAction = "purchase";
                trxnActionTable =   accountDBInterface.getAccountTableName("purchase");
            }
    }
  
    
  
  public  static  void   checkTrxnInstrument(String  inTrxnAction,  String  inAccountEntry){
       
            if(inAccountEntry.contains("cheque")){

                trxnInstrumentFound  = true;   trxnInstrument = "cheque";
            }else if(inAccountEntry.contains("bank")){

                trxnInstrumentFound  = true;   trxnInstrument = "bank";
            }else if(inAccountEntry.contains("credit")){

                trxnInstrumentFound  = true;  trxnInstrument = "credit";
                if(inTrxnAction.contains("purchase")  || inTrxnAction.contains("bought")){
                    trxnActionTable =   accountDBInterface.getAccountTableName("purchase_credit");
                }else if(inTrxnAction.contains("sold")  || inTrxnAction.contains("sell")){
                    trxnActionTable =   accountDBInterface.getAccountTableName("sold_credit");
                }
                
            }else if(inAccountEntry.contains("cash")){

                trxnInstrumentFound  = true;   trxnInstrument = "cash";
            }
  }
  
  
  
  public  static void   checkTrxnItem(String  inAccountEntry){
       
           if(inAccountEntry.contains("goods")){

                trxnItemFound = true;  trxnItem = "goods";
            }else if(inAccountEntry.contains("furniture")){

                trxnItemFound = true;  trxnItem = "furniture";
            }else if(inAccountEntry.contains("vehicle")){

                trxnItemFound = true;  trxnItem = "vehicle";
            }else if(inAccountEntry.contains("property")){

                trxnItemFound = true;  trxnItem = "property";
            }else if(inAccountEntry.contains("land")){

                trxnItemFound = true;  trxnItem = "land";
            } 
  }
  
  
  
  
  
  
 /*** 
   public  static void  doAccountingEntryII(){
      
        Scanner initInputScan = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Enter accounting entry...");

        String accountEntry  = initInputScan.nextLine();  // Read user input
        System.out.println("Echo :: " + accountEntry);  // Output user input
           
      while(accountEntry.equalsIgnoreCase("Exit") == false){
          
            boolean trxnActionFound = false;
            boolean trxnInstrumentFound  = false; 
            boolean trxnItemFound  = false;
            boolean trxnEntityFound = false;
          
            boolean errorMsgSet =  false;
            
          
           accountEntry  = accountEntry.toLowerCase();
     
            if(accountEntry.contains("sold")){

                 trxnActionFound = true; 
            }else if(accountEntry.contains("purchase")){

                trxnActionFound = true;                
            }


            if(accountEntry.contains("cheque")){

                trxnInstrumentFound  = true;
            }else if(accountEntry.contains("bank")){

                trxnInstrumentFound  = true;
            }else if(accountEntry.contains("credit")){

                trxnInstrumentFound  = true;
            }else if(accountEntry.contains("cash")){

                trxnInstrumentFound  = true;
            }


            if(accountEntry.contains("goods")){

                trxnItemFound = true;
            }else if(accountEntry.contains("furniture")){

                trxnItemFound = true;
            }else if(accountEntry.contains("vehicle")){

                trxnItemFound = true;
            }else if(accountEntry.contains("property")){

                trxnItemFound = true;
            }else if(accountEntry.contains("land")){

                trxnItemFound = true;
            }
            
            
            
            if(trxnActionFound == false){
                if(errorMsgSet == false){
                   System.out.println(RED + errorMsg + RESET); errorMsgSet = true;    
                 }
                System.out.println("    Reason: No Transaction Action Found ");
            }
            
            if(trxnInstrumentFound == false){
                if(errorMsgSet == false){ 
                   System.out.println(RED + errorMsg + RESET); errorMsgSet = true;    
                 }
                System.out.println("    Reason: No Transaction Instrument Found ");
            }
            
            if(trxnItemFound == false){
                 if(errorMsgSet == false){
                   System.out.println(RED + errorMsg + RESET); errorMsgSet = true;   
                 }
                System.out.println("    Reason: No Transaction Item Found ");
            }
            
            
            if(trxnActionFound == true && trxnInstrumentFound == true && trxnItemFound == true){
                System.out.println(GREEN + "Input Accepted." + RESET);
            }
             
            Scanner inputScan = new Scanner(System.in);  // Create a Scanner object
            System.out.println("\n\nEnter accounting entry...");

            accountEntry  = inputScan.nextLine();  // Read user input
            System.out.println("Echo :: " + accountEntry);  // Output user input
    
      }
      
      
      
  }
   
   ****/
   
   
   
   
}
