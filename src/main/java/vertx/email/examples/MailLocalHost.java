/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vertx.email.examples;

 
import java.util.Arrays;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Launcher;
import io.vertx.ext.mail.MailClient;
import io.vertx.ext.mail.MailConfig;
import io.vertx.ext.mail.MailMessage;
 

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
public class MailLocalHost extends AbstractVerticle {

  public static void main(String[] args) {
    Launcher.executeCommand("run", MailLocalHost.class.getName());
  }

  @Override
  public void start() {
    // Start a local SMTP server, remove this line if you want to use your own server.
    // It just prints the sent message to the console
    LocalSmtpServer.start(2525);

    MailClient mailClient = MailClient.createShared(vertx, new MailConfig().setPort(2525));

    MailMessage email = new MailMessage()
        .setFrom("user@example.com (Sender)")
        .setTo(Arrays.asList(
               "bogeyingbo@gmail.com (Bolaji Ogeyingbo)",
            "user@example.com (User Name)",
            "other@example.com (Another User)"))
        .setBounceAddress("user@example.com (Bounce)")
        .setSubject("Test email")
        .setText("this is a test email");

    mailClient.sendMail(email, result -> {
      if (result.succeeded()) {
        System.out.println(result.result());
        System.out.println("Mail sent");
      } else {
        System.out.println("got exception");
        result.cause().printStackTrace();
      }
    });
  }

}