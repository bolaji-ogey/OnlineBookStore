/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package i.ogeyingbo.input;

import java.awt.Toolkit;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class PrintColouredText {
    
    
     public static void main(String[] args) {
        // ANSI escape code constants for text colors
        String RESET = "\u001B[0m";
        String RED = "\u001B[31m";
        String GREEN = "\u001B[32m";
        String YELLOW = "\u001B[33m";

        // Print colored text to the console
        System.out.println(GREEN + "This text is green." + RESET);
        System.out.println(YELLOW + "This text is yellow." + RESET);
       System.out.println(RED + "This text is red." + RESET);
       
       Toolkit.getDefaultToolkit().beep();
    }
     
     
}
