using Microsoft.ML;
using Microsoft.ML.Data;
using SentimentAnalysis;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Data;
using static System.Net.Mime.MediaTypeNames;
using System.Buffers.Text;
using System.Reflection;
using System;
using System.Collections;

public class Program
{
    
    static void Main(string[] args)
    {

        Console.WriteLine();
        Console.WriteLine("=============== Sentiment Analysis Facade ===============");
        SentimentAnalysisFacade.Execute();

        Console.WriteLine();
        Console.WriteLine("=============== Sentiment Analysis Generics ===============");
        SentimentAnalysisGenerics.Execute();
    }

}
