# Analyze sentiment of website comments with binary classification in ML.NET

This tutorial shows you how to create am Eiffel application using .NET Core that classifies sentiment from website comments and takes the appropriate action. 
The binary sentiment classifier uses Eiffel programming language

## Overview
* Create a console application
* Prepare data
* Load the data
* Build and train the model
* Evaluate the model
* Use the model to make a prediction
* See the results

## Getting Started

* EiffelStudio 23.08 
* .Net 7

## Create a console application 
TODO check how can we use the Eiffel .Net wizard to use it.    
    *  Copy the project template net7
    *  Rename it as sentiment_analysis 
        * sentiment_analysis.ecf
    * [UCI Sentiment Labeled Sentences dataset](https://archive.ics.uci.edu/ml/machine-learning-databases/00331/sentiment%20labelled%20sentences.zip) (ZIP file)    
   

##  Add the following packages

`dotnet add package Microsoft.ML --version 1.7.1 --package-directory packages`

### Note
Due to current limitations with Generics the code uses C# Facade for this specific example.
Tha library enable us to access the generic features of the ML library that at the moment can't be consumed.

# Prepare your data

    ```
    The datasets for this tutorial are from the 'From Group to Individual Labels using Deep Features', Kotzias et. al,. KDD 2015, and hosted at the UCI Machine Learning Repository - Dua, D. and Karra Taniskidou, E. (2017). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.
    ```
    
    * Create a `Data` directory
    * Download `UCI Sentiment Labeled Sentences dataset ZIP file`, and unzip.
    * Copy the `yelp_labelled.txt`` file into the `Data`` directory you created.


The code is based on the following [C# tutorial](https://learn.microsoft.com/en-us/dotnet/machine-learning/tutorials/sentiment-analysis)