# Building Web APIs with .Net using Eiffel

* Provide data to different clients
* Uniform contract

# Net 
* using .Net 7
* Eiffel 

# Web
    * HTTP 
    * ASP.Net Core 7, 6

## Getting Started

* EiffelStudio 23.09 or greater. 
* * .Net 7

## Testing APIs
* [Postman](https://www.postman.com/) 
* [Hoppscotch](https://hoppscotch.io/)
* curl 
* Browser developer tools.


## Create our first Web API 
    *  Copy the project template net7
    *  Rename it as my_first_api 
        * my_first_api.ecf
    * Set the environment variable
    `set ASP_NET_CORE=C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App\7.0.10`
        
        
The default formatter in ASP.Net core for JSON is System.Text.Json if we want to use
NewtonSoft.Json we need to add the dependency. More about Format response data in ASP.NET Core Web API
in the following [link](https://learn.microsoft.com/en-us/aspnet/core/web-api/advanced/formatting?view=aspnetcore-7.0)
        
##  Add the following packages

Microsoft.AspNetCore.OpenApi  version 7.0.10
Swashbuckle.AspNetCore        version 6.5.0 
Microsoft.AspNetCore.Mvc.NewtonsoftJson version 7.0.11

dotnet add package Swashbuckle.AspNetCore --version 6.5.0 --package-directory packages

dotnet add package Microsoft.AspNetCore.OpenApi --version 7.0.10 --package-directory packages

dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson --version 7.0.11 --package-directory packages

## Asp.Net Core 
ASP.Net core provies a MVC model view controler.

- Controllers inherit from ControllerBase
- Need to use class attributes [ApiController]
    - content negotiation
    - serialization
    - etc
- Http Methods: Method and/or attribute to provide teh HTTP ver
       [HttpGet]  / Get[somethingElse]() it will be a Get request
       [HttpPost] / Post[somethingElse]() it will be a Post request   

    basically we can have methods/features that are called like HTTP methods like
    `get, post, put, delete, ect` or the features start with the HTTP method name like `get_something`, `post_something`, etc

    With attribues like [HttpGet], we mark a feature responsible for Get requests, similarly for other HTTP methods.
     
 ```
    note
        description: "Controller example"
    	metadata: create {API_CONTROLLER_ATTRIBUTE}.make end,
		create {ROUTE_MVC_ATTRIBUTE}.make ("[controller]") end,
        create {INCLUDE_ACTION_CLASS_ATTRIBUTE}.make(<<"Get">>) end

    class MY_CONTROLLER
        inherit
        CONTROLLER_BASE

    feature -- HTTP methods
    	get: IENUMERABLE
		    note
			    property: auto
			    property_metadata: create {HTTP_GET_ATTRIBUTE}.make ("GetWeatherForecast") end
            do
            end
     end       


 ```        

### Routing with Attribute

| Attribute    | Description |
| ------------ | ----------- |
| [Route("/products")] | URL to call the API |
| [Route("/products/{id}")] | Controller action parameter is taken from URL |
| [Route("/products/{id?}")] | Optional controller action parameter is taken from URL |
| [Route("/[products]")] | Use controller name in URL |

The last one `[Route("/[products]")]`, is the name of the controller, is not the name of the class, which is the class name minus controller. 

## How to launch the application
- Copy the Properties from the Root directory project to F_code
- Copy the wrap_my_first_api.csproj from the Root directory project to F_code
- Go to the F_code directory and run `dotnet run --launch-profile="https"`
- Open the browser https://localhost:7097/WeatherForecast