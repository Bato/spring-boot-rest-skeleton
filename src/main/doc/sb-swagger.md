# Swagger API

Swagger is simple powerful Representation of RESTful API


## pom.xml

define the dependencies to the Swagger libraries

```sh
<dependency>
    <groupId>com.mangofactory</groupId>
    <artifactId>swagger-springmvc</artifactId>
    <version>1.0.2</version>
</dependency>
```

Enable Swagger in the boot application

```sh
@SpringBootApplication
@EnableSwagger
@ComponentScan("com.mycompany")
public class Application {    

## Demonstrate out-of-the-box capabilities

Start the embedded Apache Tomcat web server on port 8080
```sh
mvn spring-boot:run

.SwaggerApiResourceListing     : Added a resource listing with (8) api resources:
.SwaggerApiResourceListing     :   Basic Error Controller at location: /api-docs/default/basic-error-controller
.SwaggerApiResourceListing     :   Endpoint Mvc Adapter at location: /api-docs/default/endpoint-mvc-adapter
.SwaggerApiResourceListing     :   Environment Mvc Endpoint at location: /api-docs/default/environment-mvc-endpo

.SwaggerApiResourceListing     :   Greeting Controller at location: /api-docs/default/greeting-controller
.SwaggerApiResourceListing     :   Health Mvc Endpoint at location: /api-docs/default/health-mvc-endpoint
.SwaggerApiResourceListing     :   Metrics Mvc Endpoint at location: /api-docs/default/metrics-mvc-endpoint
.SwaggerApiResourceListing     :   Role Controller at location: /api-docs/default/role-controller
.SwaggerApiResourceListing     :   Shutdown Mvc Endpoint at location: /api-docs/default/shutdown-mvc-endpoint
```

Show API

```sh
curl -i http://localhost:8080/api-docs

{
    "apiVersion": "1.0",
    "apis": [
        {
            "description": "Role Controller",
            "path": "/default/role-controller",
            "position": 0
        },
        {
            "description": "Shutdown Mvc Endpoint",
            "path": "/default/shutdown-mvc-endpoint",
            "position": 0
        }
    ],
    "authorizations": {},
    "info": {
        "contact": "Contact Email",
        "description": "Api Description",
        "license": "Licence Type",
        "licenseUrl": "License URL",
        "termsOfServiceUrl": "Api terms of service",
        "title": "default Title"
    },
    "swaggerVersion": "1.2"
}    
```

# Swagger UI

Online : http://petstore.swagger.io/

##  Local installation 

download http://swagger.io/swagger-ui/

install in D:\tools\Swagger\swagger-ui-2.1.4

file:///D:/tools/Swagger/swagger-ui-2.1.4/dist/index.html

http://localhost:8080/api-docs
Can't read from server. It may not have the appropriate access-control-origin settings.

```sh
package org.example.ws.web.filter;
@Component
public class SimpleCORSFilter extends GenericFilterBean {
	
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) resp;
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods",
                "DELETE, GET, OPTIONS, PATCH, POST, PUT");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers",
                "x-requested-with, content-type");
        chain.doFilter(req, resp);
    }
```

## How to customize endpoints

After this you can add a separate configuration java 
class which is responsible for Swagger:

# Literatur & Links

Spring Boot & Swagger UI
https://dzone.com/articles/spring-boot-swagger-ui

Udemy: 
  * https://www.udemy.com/restful-web-service-with-spring-boot/

GitHub:   
  * https://github.com/pbhavsar211/Restful
  * https://github.com/adrianbk/swagger-springmvc-demo

YouTube:  
  * https://www.youtube.com/playlist?list=PLGDwUiT1wr6-Fn3N2oqJpTdhGjFHnIIKY  
