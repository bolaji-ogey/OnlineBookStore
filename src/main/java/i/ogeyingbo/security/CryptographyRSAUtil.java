/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.security;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.EncodedKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import javax.crypto.Cipher;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class CryptographyRSAUtil {
    
   
   public static  void  generateKeyPairs(){
        KeyPairGenerator  generator;
        try{
            generator  =  KeyPairGenerator.getInstance("RSA");
            generator.initialize(2048);
            KeyPair pair = generator.generateKeyPair();

            PrivateKey privateKey = pair.getPrivate();
            PublicKey publicKey = pair.getPublic();

            try (FileOutputStream fos = new FileOutputStream("C:\\Users\\BOLAJI-OGEYINGBO\\Downloads\\my-private.key")) {
                fos.write(privateKey.getEncoded());
             }catch(Exception ex){
                 ex.printStackTrace();
             }
            
            try (FileOutputStream fos = new FileOutputStream("C:\\Users\\BOLAJI-OGEYINGBO\\Downloads\\my-public.key")) {
                fos.write(publicKey.getEncoded());
             }catch(Exception ex){
                 ex.printStackTrace();
             }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    
    
   public static  String   encrypt(String  inSecretMessage){
        
        String encodedMessage =  null;
        KeyFactory keyFactory = null;
        File publicKeyFile = new File("C:\\Users\\BOLAJI-OGEYINGBO\\Downloads\\0x9D86EA6D-pub.asc");
     // File publicKeyFile = new File("C:\\Users\\BOLAJI-OGEYINGBO\\Downloads\\my-public.key");
        byte[] publicKeyBytes = null;
        
        try{

            System.out.println("publicKeyFile.toPath():  >>> "+publicKeyFile.toPath());
            publicKeyBytes = Files.readAllBytes(publicKeyFile.toPath());
            keyFactory = KeyFactory.getInstance("RSA");
             EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(publicKeyBytes);
           // EncodedKeySpec publicKeySpec = new PKCS8EncodedKeySpec(publicKeyBytes);
            PublicKey  publicKey  = keyFactory.generatePublic(publicKeySpec);

            Cipher encryptCipher = Cipher.getInstance("RSA");
           // Cipher encryptCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            encryptCipher.init(Cipher.ENCRYPT_MODE, publicKey);

            byte[] secretMessageBytes = inSecretMessage.getBytes(StandardCharsets.UTF_8);
            byte[] encryptedMessageBytes = encryptCipher.doFinal(secretMessageBytes);
           
            encodedMessage = Base64.getEncoder().encodeToString(encryptedMessageBytes);
        
        }catch(Exception e){ e.printStackTrace(); }
        
        return  encodedMessage;
    }
    
    
    
   
   public static  String   decrypt(String  inEncrySecretMessage){
        
        String decryptedMessage =  null;
        KeyFactory keyFactory = null;
       // File privateKeyFile = new File("C:\\Users\\BOLAJI-OGEYINGBO\\Downloads\\0x9D86EA6D-pub1.asc");
        File privateKeyFile = new File("C:\\Users\\BOLAJI-OGEYINGBO\\Downloads\\my-private.key");
        byte[] privateKeyBytes = null;
        
        try{

            System.out.println("publicKeyFile.toPath():  >>> "+privateKeyFile.toPath());
            privateKeyBytes = Files.readAllBytes(privateKeyFile.toPath());
            keyFactory = KeyFactory.getInstance("RSA");
           
            EncodedKeySpec privateKeySpec = new X509EncodedKeySpec(privateKeyBytes);
          //  EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
            PrivateKey  privateKey  = keyFactory.generatePrivate(privateKeySpec);

             Cipher decryptCipher = Cipher.getInstance("RSA");
           // Cipher decryptCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            
            decryptCipher.init(Cipher.DECRYPT_MODE, privateKey);

            byte[] encryptedMessageBytes = inEncrySecretMessage.getBytes(StandardCharsets.UTF_8);
            byte[] decryptedMessageBytes = decryptCipher.doFinal(encryptedMessageBytes);
            
            decryptedMessage = new String(decryptedMessageBytes, StandardCharsets.UTF_8);
        
        }catch(Exception e){ e.printStackTrace(); }
        
        return  decryptedMessage;
    } 
    
    
    
    public  static  void  main(String[] args){
        try{
          //  System.out.println(javax.crypto.Cipher.getMaxAllowedKeyLength("AES"));
           // System.out.println(javax.crypto.Cipher.getMaxAllowedParameterSpec("AES"));
            System.out.println(CryptographyRSAUtil.encrypt("This is me"));
        //   System.out.println(CryptographyRSAUtil.decrypt("\"));
          // CryptographyRSAUtil.generateKeyPairs();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
}
