# API Documentation Generator

The project includes [Springfox](http://springfox.github.io/springfox/) 
Swagger integration to automatically generate API docs for the RESTful web service endpoints.  
This feature may be activated using the *"docs"* Spring profile.

Swagger is simple powerful Representation of RESTful API


## pom.xml

define the dependencies to the Swagger libraries

```sh
    <!-- Dependencies for Swagger -->
    <dependency>
      <groupId>io.springfox</groupId>
      <artifactId>springfox-swagger2</artifactId>
      <version>${swagger.version}</version>
    </dependency>
    <dependency>
      <groupId>io.springfox</groupId>
      <artifactId>springfox-swagger-ui</artifactId>
      <version>${swagger.version}</version>
    </dependency>
```

Enable Swagger in the boot application

```sh
@Profile("docs")
@Configuration
@EnableSwagger2
public class ApiDocsConfiguration {
    public static final String PROJECT_VERSION = "1.0.0";
    public static final String PROJECT_CONTACT = "example.com";

    @Bean
    public Docket docket() {
        Predicate<String> paths = PathSelectors.ant("/api/**");

        ApiInfo apiInfo = new ApiInfoBuilder()
                .title("Project Skeleton for Spring Boot Web Services")
                .description(
                        "The Spring Boot web services starter project provides   \
                        a foundation to rapidly construct a RESTful web services \
                        application.")
                .contact(PROJECT_CONTACT).version(PROJECT_VERSION).build();

        Docket docket = new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo)
                .select().paths(paths).build();
        return docket;
    }
}
```

## application.properties

```sh
spring.profiles.active=hsqldb,batch,docs
```

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
curl -i http://localhost:8080/v2/api-docs

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

curl -i http://localhost:8080/v2/api-docs
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

Usage of Swagger 2.0 in Spring Boot Applications to document APIs
http://heidloff.net/article/usage-of-swagger-2-0-in-spring-boot-applications-to-document-apis/

Udemy: 
  * https://www.udemy.com/restful-web-service-with-spring-boot/

GitHub:   
  * https://github.com/pbhavsar211/Restful
  * https://github.com/adrianbk/swagger-springmvc-demo

YouTube:  
  * https://www.youtube.com/playlist?list=PLGDwUiT1wr6-Fn3N2oqJpTdhGjFHnIIKY  
