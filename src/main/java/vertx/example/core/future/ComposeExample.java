/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vertx.example.core.future;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.Launcher;
import io.vertx.core.Promise;

import java.util.function.Function;

/**
 * An example showing how to use {@link io.vertx.core.Future#compose(Function)}
 */
public class ComposeExample extends AbstractVerticle {

  public static void main(String[] args) {
    Launcher.executeCommand("run", ComposeExample.class.getName());
  }


  @Override
  public void start() throws Exception {
    Future<String> future = anAsyncAction();
    future.compose(this::anotherAsyncAction)
      .onComplete(ar -> {
        if (ar.failed()) {
          System.out.println("Something bad happened");
          ar.cause().printStackTrace();
        } else {
          System.out.println("Result: " + ar.result());
        }
      });
  }

  private Future<String> anAsyncAction() {
    Promise<String> promise = Promise.promise();
    // mimic something that take times
    vertx.setTimer(100, l -> promise.complete("world"));
    return promise.future();
  }

  private Future<String> anotherAsyncAction(String name) {
    Promise<String> promise = Promise.promise();
    // mimic something that take times
    vertx.setTimer(100, l -> promise.complete("hello " + name));
    return promise.future();
  }


}