/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vertx.email.examples;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */
 
import io.vertx.circuitbreaker.CircuitBreaker;
import io.vertx.circuitbreaker.CircuitBreakerOptions;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.Launcher;
import static io.vertx.core.Vertx.vertx;
import io.vertx.core.buffer.Buffer;
import io.vertx.core.http.HttpMethod;

/**
 * @author <a href="pahan.224@gmail.com">Pahan</a>
 */

public class CircuitBreakerClient extends AbstractVerticle {

  public static void main(String[] args) {
    Launcher.executeCommand("run", CircuitBreakerClient.class.getName());
  }

  @Override
  public void start() {
    CircuitBreakerOptions options = new CircuitBreakerOptions()
      .setMaxFailures(5)
      .setTimeout(5000)
      .setFallbackOnFailure(true);

    CircuitBreaker breaker =
      CircuitBreaker.create("my-circuit-breaker", vertx, options)
        .openHandler(v -> {
          System.out.println("Circuit opened");
        }).closeHandler(v -> {
        System.out.println("Circuit closed");
      });

    breaker.executeWithFallback(promise -> {
      vertx.createHttpClient().request(HttpMethod.GET, 8080, "localhost", "/").compose(req -> {
        return req.send().compose(resp -> {
          if (resp.statusCode() != 200) {
            return Future.failedFuture("HTTP error");
          } else {
            return resp.body().map(Buffer::toString);
          }
        });
      }).onComplete(promise);
    }, v -> {
      // Executed when the circuit is opened
      return "Hello (fallback)";
    }, ar -> {
      // Do something with the result
      System.out.println("Result: " + ar.result());
    });
  }
  
  
  
}
