# Building Web APIs with .Net using Eiffel


This guide will help you build Web APIs using .NET and Eiffel, providing data to different clients through a uniform contract.



## Prerequisites
- .NET 7
- EiffelStudio 23.09 or greater

## Web Technologies
- HTTP
- ASP.NET Core 7, 6


## Testing APIs
* [Postman](https://www.postman.com/) 
* [Hoppscotch](https://hoppscotch.io/)
* curl 
* Browser developer tools.

## Creating Your First Web API
1. Copy the project template `net7`.
2. Rename it as `my_first_api` and its configuration file as `my_first_api.ecf`.

The default formatter in ASP.NET Core for JSON is `System.Text.Json`. If you want to use `NewtonSoft.Json`, you need to add the dependency. Learn more about formatting response data in ASP.NET Core Web API [here](https://learn.microsoft.com/en-us/aspnet/core/web-api/advanced/formatting?view=aspnetcore-7.0).

## Adding Necessary Packages
Add the following packages to your project:

- Microsoft.AspNetCore.OpenApi, version 7.0.10
- Swashbuckle.AspNetCore, version 6.5.0
- Microsoft.AspNetCore.Mvc.NewtonsoftJson, version 7.0.11

You can add these packages using the following commands:

```bash
dotnet add package Swashbuckle.AspNetCore --version 6.5.0 --package-directory packages
dotnet add package Microsoft.AspNetCore.OpenApi --version 7.0.10 --package-directory packages
dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson --version 7.0.11 --package-directory packages
```

## ASP.NET Core
ASP.NET Core provides a Model-View-Controller (MVC) framework. Controllers inherit from `ControllerBase` and need to use class attributes `[ApiController]` for content negotiation, serialization, etc.

HTTP methods can be defined using method and/or attribute to provide the HTTP verb. For example, `[HttpGet]` or `Get[somethingElse]()` will be a GET request, and `[HttpPost]` or `Post[somethingElse]()` will be a POST request.

Here's an example of a controller:

```eiffel
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

## Launching the Application
1. Copy the `Properties` from the root directory project to `F_code`.
2. Copy the `wrap_my_first_api.csproj` from the root directory project to `F_code`.
3. Navigate to the `F_code` directory and run `dotnet run --launch-profile="https"`.
4. Open your browser and visit `https://localhost:7097/WeatherForecast` to see your API in action.