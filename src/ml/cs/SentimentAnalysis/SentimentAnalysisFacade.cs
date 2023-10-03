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

namespace SentimentAnalysis;
public class SentimentAnalysisFacade
{
    static readonly string _dataPath = Path.Combine(Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.FullName, "Data", "yelp_labelled.txt");

    public static void Execute()
    {
        MLContextFacade mlContextFacade = new MLContextFacade();

        DataOperationsCatalog.TrainTestData splitDataView = LoadData(mlContextFacade);

        ITransformer model = BuildAndTrainModel(mlContextFacade, splitDataView);
        Evaluate(mlContextFacade, splitDataView, model);

        UseModelWithSingleItem(mlContextFacade, model);

        UseModelWithBatchItems(mlContextFacade, model);

        Console.WriteLine();
        Console.WriteLine("=============== End of process ===============");
    }

    /// <summary>
    /// Creates batch test data.
    /// Predicts sentiment based on test data.
    /// Combines test data and predictions for reporting.
    /// Displays the predicted results.
    /// </summary>
    /// <param name="mlContextFacade"></param>
    /// <param name="model"></param>
    private static void UseModelWithBatchItems(MLContextFacade mlContextFacade, ITransformer model)
    {
        ArrayList sentiments = new ArrayList
        {
            new SentimentData { SentimentText = "This was a horrible meal" },
            new SentimentData { SentimentText = "I love this spaghetti." }
        };

        IDataView batchComments = mlContextFacade.LoadFromEnumerable(sentiments);
        IDataView batchPredictions = mlContextFacade.Transform(model, batchComments);
        IList predictedResults = mlContextFacade.CreateEnumerable(batchPredictions);
        Console.WriteLine();

        Console.WriteLine("=============== Prediction Test of loaded model with multiple samples ===============");
        // </SnippetAddInfoMessage>

        Console.WriteLine();

        // <SnippetDisplayResults>
        foreach (SentimentPrediction prediction in predictedResults)
        {
            Console.WriteLine($"Sentiment: {prediction.SentimentText} | Prediction: {(Convert.ToBoolean(prediction.Prediction) ? "Positive" : "Negative")} | Probability: {prediction.Probability} ");
        }
        Console.WriteLine("=============== End of predictions ===============");
    }

    /// <summary>
    /// Creates a single comment of test data.
    /// Predicts sentiment based on test data.
    /// Combines test data and predictions for reporting.
    /// Displays the predicted results.
    /// </summary>
    /// <param name="mlContextFacade"></param>
    /// <param name="model"></param>
    private static void UseModelWithSingleItem(MLContextFacade mlContextFacade, ITransformer model)
    {
        PredictionEngineFacade predictionEngine = mlContextFacade.CreatePredictionEngine(model);
        SentimentData sampleStatement = new SentimentData { SentimentText = "This was a very bad steak" };
        SentimentPrediction resultPrediction = predictionEngine.Predict(sampleStatement);
        Console.WriteLine();
        Console.WriteLine("=============== Prediction Test of model with a single sample and test dataset ===============");

        Console.WriteLine();
        Console.WriteLine($"Sentiment: {resultPrediction.SentimentText} | Prediction: {(Convert.ToBoolean(resultPrediction.Prediction) ? "Positive" : "Negative")} | Probability: {resultPrediction.Probability} ");

        Console.WriteLine("=============== End of Predictions ===============");
        Console.WriteLine();
    }

    /// <summary>
    /// Loads the test dataset.
    /// Creates the BinaryClassification evaluator.
    /// Evaluates the model and creates metrics.
    /// Displays the metrics.
    /// </summary>
    /// <param name="mlContextFacade"></param>
    /// <param name="splitDataView"></param>
    /// <param name="model"></param>
    private static void Evaluate(MLContextFacade mlContextFacade, DataOperationsCatalog.TrainTestData splitDataView, ITransformer model)
    {
        Console.WriteLine("=============== Evaluating Model accuracy with Test data===============");
        IDataView predictions = mlContextFacade.Transform(model, splitDataView.TestSet);
        CalibratedBinaryClassificationMetrics metrics = mlContextFacade.Evaluate(predictions);
        Console.WriteLine();
        Console.WriteLine("Model quality metrics evaluation");
        Console.WriteLine("--------------------------------");
        Console.WriteLine($"Accuracy: {metrics.Accuracy:P2}");
        Console.WriteLine($"Auc: {metrics.AreaUnderRocCurve:P2}");
        Console.WriteLine($"F1Score: {metrics.F1Score:P2}");
        Console.WriteLine("=============== End of model evaluation ===============");
    }

    /// <summary>
    /// Extracts and transforms the data.
    /// Trains the model.
    /// Predicts sentiment based on test data.
    /// Returns the model.
    /// </summary>
    /// <param name="mlContextFacade"></param>
    /// <param name="splitDataView"></param>
    /// <returns></returns>
     private static ITransformer BuildAndTrainModel(MLContextFacade mlContextFacade, DataOperationsCatalog.TrainTestData splitDataView)
    {
        SentimentEstimator estimator = mlContextFacade.FeaturizeSentimentText("Features", nameof(SentimentData.SentimentText));
        
        Console.WriteLine("=============== Create and Train the Model ===============");
        ITransformer model = estimator.Fit(splitDataView.TrainSet);
        Console.WriteLine("=============== End of training ===============");
        Console.WriteLine();
        return model;
    }

    /// <summary>
    /// Loads the data.
    /// Splits the loaded dataset into train and test datasets.
    /// Returns the split train and test datasets.
    /// </summary>
    /// <param name="mlContextFacade"></param>
    /// <returns></returns>
    private static DataOperationsCatalog.TrainTestData LoadData(MLContextFacade mlContextFacade)
    {
        IDataView dataView = mlContextFacade.LoadFromTextFile(_dataPath);
        DataOperationsCatalog.TrainTestData splitDataView = mlContextFacade.TrainTestSplit(dataView, testFraction: 0.2);
        return splitDataView;
    }
}
