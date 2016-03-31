# Production Monitoring and Management with Spring Boot Actuator

## pom.xml

We need to add spring boot starter dependency for the actuator component

```sh
  <!-- Dependencies for Actuator Production Monitoring and Management -->
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
  </dependency>
```

## Demonstrate out-of-the-box capabilities

Start the embedded Apache Tomcat web server on port 8080
```sh
mvn spring-boot:run
```
actuator endpoints are gupped in three categories  
  Configuration  
    http://localhost:8080/actuators/autoconfig  
    http://localhost:8080/actuators/beans  
    http://localhost:8080/actuators/configprops  
    http://localhost:8080/actuators/env  
    http://localhost:8080/actuators/mappings  
    http://localhost:8080/actuators/info  

  Runtime diagnostic information  
    http://localhost:8080/actuators/dump  
    http://localhost:8080/actuators/health  
    http://localhost:8080/actuators/metrics  
    http://localhost:8080/actuators/trace  

  Operational management functionality  
    shutdown Allows the application to be gracefully shutdown (not enabled by default).  
    http://localhost:8080/actuators/shutdown  

curl -i -u operations:operations http://localhost:8080/actuators/info   
    
## How to customize endpoints

### resources/config/application.properties

```sh
###
# Actuator Configuration
###
endpoints.health.id=status
endpoints.health.sensitive=false
endpoints.shutdown.enabled=true
endpoints.shutdown.sensitive=false
management.context-path=/actuators
management.security.role=SYSADMIN
```

id - allows you to change name of the endpoint and the context path to whitch it is mapped  
      http://localhost:8080/actuators/status    

sensitive - indicate if endpoint access is secured by Spring Security  
enabled - all endpoints  are enabled by defaul acceppt shutdown  

```sh
curl -i -X POST http://localhost:8080/actuators/shutdown
curl -i -X POST -u operations:operations http://localhost:8080/actuators/shutdown
```
# 9:13 Create a custom health indicator

Indicator returns up as long as there's at least one greeting in the database
otherwise it will return the status down

src/main/java/org/example/ws/actuator/health/GreetingHealthIndicator.java  

```sh
@Component
public class GreetingHealthIndicator implements HealthIndicator {
    @Autowired
    private GreetingService greetingService;

    @Override
    public Health health() {

        Collection<Greeting> greetings = greetingService.findAll();

        if (greetings == null || greetings.size() == 0) {
            return Health.down().withDetail("count", 0).build();
        }

        return Health.up().withDetail("count", greetings.size()).build();
    }
}
```

## How to return a customized response from the info endpoint

### resources/config/application.properties

```sh
info.app.name=Web Services
info.app.description=A RESTful web services project using Spring Boot.
info.build.group=@project.groupId@
info.build.artifact=@project.artifactId@
info.build.version=@project.version@
```

Spring automaticaly search the pom.cml file for values with these names  

```sh
curl get http://localhost:8080/actuators/info  

{
  "app": {
    "description": "A RESTful web services project using Spring Boot.",
    "name": "Web Services"
  },
  "build": {
    "group": "@project.groupId@",
    "artifact": "@project.artifactId@",
    "version": "@project.version@"
  }
}
```

Plceholder are not replaced with values from pom.xml  
stop application and package it as JAR file  
no repackaging with mvn spring-boot:run  

```sh
mvn clean package
java -jar target/spring-boot-fundamentals-1.0-SNAPSHOT.jar

{
  "app": {
    "description": "A RESTful web services project using Spring Boot.",
    "name": "Web Services"
  },
  "build": {
    "group": "org.example",
    "artifact": "spring-boot-fundamentals",
    "version": "1.0-SNAPSHOT"
  }
}
```

mvn spring-boot:run is only intended for local machine development  
hen spring boot application is hosted on a serverer it should be packaged as a JAR File and run using
the java -jar command  

## Create and collect custom counter metrics

### GreetingServiceBean.java

src/main/java/org/example/ws/service/GreetingServiceBean.java  

```sh
    /**
     * The <code>CounterService</code> captures metrics for Spring Actuator.
     */
    @Autowired
    private CounterService counterService;


   @Override
    public Collection<Greeting> findAll() {
        ...
        counterService.increment("method.invoked.greetingServiceBean.findAll");
        ...
    }
```

invoke many times: curl -i -u user:password http://localhost:8080/api/greetings/  

```sh
http://localhost:8080/actuators/metrics

 "counter.method.invoked.greetingServiceBean.findAll": 6,
 ```

# Literatur & Links

http://spring.io/guides/gs/actuator-service/  
http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#production-ready  

GitHub:   
  * https://github.com/mwarman/spring-boot-fundamentals/tree/actuator  

YouTube:  
  * https://www.youtube.com/playlist?list=PLGDwUiT1wr6-Fn3N2oqJpTdhGjFHnIIKY  
