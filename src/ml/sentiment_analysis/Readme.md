# Analyzing Website Comments' Sentiment with Binary Classification in ML.NET

This tutorial guides you through the process of creating an Eiffel application using .NET Core. The application classifies sentiments from website comments and performs appropriate actions. The binary sentiment classifier is implemented using the Eiffel programming language.

## Overview
* Creating a console application
* Preparing the data
* Loading the data
* Building and training the model
* Evaluating the model
* Using the model to make predictions
* Viewing the results

## Prerequisites
* EiffelStudio 23.09 or later 
* .Net7

## Steps to Create a Console Application 
1. Copy the project template net7.
2. Rename it as `sentiment_analysis`.
    * sentiment_analysis.ecf
3. Download the [UCI Sentiment Labeled Sentences dataset](https://archive.ics.uci.edu/ml/machine-learning-databases/00331/sentiment%20labelled%20sentences.zip) (ZIP file).    

## Adding Required Packages
Execute the following command to add the necessary package:

```bash
dotnet add package Microsoft.ML --version 1.7.1 --package-directory packages
```

### Note
Due to current limitations with Generics, this specific example uses a C# Facade. This library enables us to access the generic features of the ML library that can't be consumed at the moment.

### Compiling the Facade Library
1. Navigate to the `cs\SentimentAnalysisFacadeLibrary` folder.
2. Execute the following command:

```bash
dotnet build
```

Alternatively, you can use Visual Studio to build the project.


## Reference C# Tutorial
The code in this tutorial is based on the following [C# tutorial](https://learn.microsoft.com/en-us/dotnet/machine-learning/tutorials/sentiment-analysis).