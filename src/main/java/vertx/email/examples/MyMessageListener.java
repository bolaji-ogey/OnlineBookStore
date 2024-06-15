/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vertx.email.examples;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
import org.apache.commons.io.IOUtils;
import org.subethamail.smtp.helper.SimpleMessageListener;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author <a href="http://escoffier.me">Clement Escoffier</a>
 */
public class MyMessageListener implements SimpleMessageListener {


  @Override
  public boolean accept(String from, String recipient) {
    return true;
  }

  @Override
  public void deliver(String from, String recipient, InputStream data) throws IOException {
    System.out.println("Sending mail from " + from + " to " + recipient
        + " (size: " + IOUtils.toByteArray(data).length + " bytes)");
  }
}