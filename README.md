# Rest service micronaut
## Pre-requisites
- It's necessary compile with graalvm distribution of JDK. You can download from [here](https://www.graalvm.org/downloads).
- Install [docker](https://docs.docker.com/install/).
- Install [micronaut cli](https://docs.micronaut.io/latest/guide/quickStart.html).
## Create new application
````shell script
mn create-app mn-first-rest --feature graal-native-image --build maven
````
The default embebed server is netty. This server gives no-blocking environment.
````xml
<dependency>
    <groupId>io.micronaut</groupId>
    <artifactId>micronaut-http-server-netty</artifactId>
    <scope>compile</scope>
</dependency>
````
Add lombok support in annotationProcessorPaths
````xml
<path>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>${lombok.version}</version>
</path>
````