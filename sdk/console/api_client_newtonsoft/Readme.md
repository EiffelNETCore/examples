# Make HTTP requests to a REST service

This sample shows how to make HTTP requests in a console app with Eiffel on .NetCore

## Key Features

This sample demonstrates making HTTP requests to a web server, converting JSON objects into Eiffel objects, and terminal output. 
This sample uses a third party library to work with JSON objects Newtonsoft.Json 
It's based on the following [C# tutorial](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/console-webapiclient)  

## Notes
In .NET Core (now known as .NET 5 and later), you can use third-party libraries by managing them with the NuGet Package Manager. NuGet is a package manager for .NET that makes it easy to add, remove, and update libraries in your projects.

Here's how you can use third-party libraries in an Eiffel .NET Core application using the NuGet Package Manager:

## Search for the Package:
Go to the NuGet Package Manager website (https://www.nuget.org/) or use the package search feature in your IDE. Search for the third-party library you want to use.

## Add a New Package Source your NuGet configuration files
A package source is a repository of NuGet packages that you can install in your projects. NuGet is a package manager for .NET that helps you manage dependencies and libraries.

`dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org`

The command has the following parts:

    * dotnet nuget add source is the main command that tells the tool to add a new source.
    * https://api.nuget.org/v3/index.json is the URL of the package source that you want to add. This is the official NuGet feed that contains thousands of packages from various authors and organizations.
    * -n nuget.org is an option that specifies the name of the source. This is how you can identify the source in your configuration files or when you use other commands.

## Choose a Package:
Once you find the desired package, select the appropriate version based on your needs. You'll also see a command-line snippet that you can use to install the package.

### Install the Package:
Use the NuGet app from the terminal to install the package. In the terminal, navigate to your project's directory and run the following command:
Note: add nuget source

`nuget install <PackageName> -OutputDirectory packages`

Alternative it's possible to use `NetCli`
`dotnet add PackageName` but it will require a .Net project like C# and the path to the packages will be under
`C\Users\<user>\.nuget` but the advantage is that it will be cross platform.

Replace PackageName with the actual name of the package you want to install.

### Package Installation:
The package and its dependencies will be downloaded and added to your project. The packages are typically stored in the packages folder within your project directory.


## Update the Eiffel configuration file:
Open the .ecf file of your project. This file contains the project configuration and dependencies. You can edit it using a text editor or directly from EiffelStudio (I didn't check if it's possible to add .Net package from EiffelStudio)
Add the assembly to Path where the package was insalled.

`<assembly name="PackageName" location=".\packages\PackageName\lib\NetVersion\PackageName.dll"/>`

or

`<assembly name="PackageName" location="$NUGET_PATH\packages\PackageName\lib\NetVersion\PackageName.dll"/>`


Example NewtonJSON

`nuget install Newtonsoft.Json -Version 13.0.3 -OutputDirectory packages`

or

`dotnet add package Newtonsoft.Json --version 13.0.3 --package-directory packages`

Since `donet add package` requires a project in the current directory add a simple `mock.csproj`
that will enable us to run the command.

```
    <Project Sdk="Microsoft.NET.Sdk">

    <PropertyGroup>
        <TargetFramework>net6.0</TargetFramework>
    </PropertyGroup>

    </Project>

```
