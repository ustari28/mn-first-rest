# Rest service micronaut
````shell script
mn create-app mn-first-rest --build maven
````
The default embebed server is netty. This server gives no-blocking environment.
````xml
<dependency>
  <groupId>io.micronaut</groupId>
  <artifactId>micronaut-http-server-netty</artifactId>
  <scope>compile</scope>
</dependency>
````