/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vertx.email.examples;

/**
 *
 * @author BOLAJI-OGEYINGBO
 */ 

//import org.testcontainers.containers.PostgreSQLContainer;


import io.vertx.core.AbstractVerticle;
import io.vertx.core.Vertx;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.sqlclient.Pool;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.Row;
import io.vertx.sqlclient.SqlConnectOptions;

/*
 * @author <a href="mailto:pmlopes@gmail.com">Paulo Lopes</a>
 */
public class SqlClientExample extends AbstractVerticle {

  // Convenience method so you can run it in your IDE
  public static void main(String[] args) {
      /**
    PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>();
    postgres.start();
    ***/
      
    PgConnectOptions options = new PgConnectOptions()
                .setPort(5432)
                .setHost("localhost")
                .setDatabase("bookinventory")
                .setUser("postgres")
                .setPassword("admin");
    // Uncomment for MySQL
//    MySQLContainer<?> mysql = new MySQLContainer<>();
//    mysql.start();
//    MySQLConnectOptions options = new MySQLConnectOptions()
//      .setPort(mysql.getMappedPort(3306))
//      .setHost(mysql.getContainerIpAddress())
//      .setDatabase(mysql.getDatabaseName())
//      .setUser(mysql.getUsername())
//      .setPassword(mysql.getPassword());
    Vertx vertx = Vertx.vertx();
    vertx.deployVerticle(new SqlClientExample(options));  }

  private final SqlConnectOptions options;

  public SqlClientExample(SqlConnectOptions options) {
    this.options = options;
  }

  @Override
  public void start() {

    Pool pool = Pool.pool(vertx, options, new PoolOptions().setMaxSize(4));

    // create a test table
    pool.query("create table test(id int primary key, name varchar(255))")
      .execute()
      .compose(r ->
        // insert some test data
        pool
          .query("insert into test values (1, 'Hello'), (2, 'World')")
          .execute()
      ).compose(r ->
      // query some data
      pool
        .query("select * from test")
        .execute()
    ).onSuccess(rows -> {
      for (Row row : rows) {
        System.out.println("row = " + row.toJson());
      }
    }).onFailure(Throwable::printStackTrace);
  }
  
  
}