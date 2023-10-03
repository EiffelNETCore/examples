# Eiffel examples using Net7

This repository contains examples in Eiffel, showcasing the latest .Net 7. We also provide C# examples located in the `cs` folders.

> **Note:** The examples were tested with .Net 7 but should also work with .Net 6.

## Prerequisites

To run the examples in this repository, you need the following software installed on your machine:
- The latest edition of EiffelStudio
- .Net 7 SDK and runtime or later

```
$>dotnet --version
7.0.400
```

## Repository Structure

The repository is organized as follows:

- `ml`: Contains Machine Learning examples.
- `sdk`
   - console 
        - api_client_newtonsoft : This sample shows how to make HTTP requests in a console app with Eiffel on .NetCore using a Third Party Library
        - deser_newtonsoft      : This sample shows how to serialize and deserialize an Object/
- `web_apis`: Contains examples related to web APIs.
    - `cs`: Contains C# examples.
        - ASPNetUtil : Library with C# Facades to access Generics features.
        - net7    
            - MyFirstApi7 : Basic WebAPI using Net7
        - my_first_api: Eiffel version of a Basic API using Net7, depends on ASPNetUtils         
- `template`: This directory contains Eiffel project templates compatible with .Net versions 6 and 7.
- `tutorial`: This directory contains tutorials, including a guide on how to use a Facade to access Generics in C#.

