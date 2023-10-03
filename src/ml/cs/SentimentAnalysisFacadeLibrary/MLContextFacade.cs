using Microsoft.ML.Data;
using Microsoft.ML;
using SentimentAnalysis;
using static Microsoft.ML.DataOperationsCatalog;
using System.Collections;
using System.Collections.Generic;

namespace SentimentAnalysis;

public class MLContextFacade
{
    private readonly MLContext _mlContext;

    public MLContextFacade()
    {
        MLContext mlContext = new MLContext();
        _mlContext = mlContext;
    }

    public IDataView LoadFromTextFile(string path, bool hasHeader = false)
    {
        return _mlContext.Data.LoadFromTextFile<SentimentData>(path, hasHeader: hasHeader);
    }

    public TrainTestData TrainTestSplit(IDataView data, double testFraction)
    {
        return _mlContext.Data.TrainTestSplit(data, testFraction);
    }

    public SentimentEstimator FeaturizeSentimentText(string outputColumnName, string inputColumnName)
    {
        var estimator = _mlContext.Transforms.Text.FeaturizeText(outputColumnName, inputColumnName)
            .Append(_mlContext.BinaryClassification.Trainers.SdcaLogisticRegression(labelColumnName: "Label", featureColumnName: "Features"));
        return new SentimentEstimator(estimator);
    }


    public IDataView Transform(ITransformer model, IDataView testSet)
    {
        return model.Transform(testSet);
    }

    public CalibratedBinaryClassificationMetrics Evaluate(IDataView predictions, string labelColumnName = "Label")
    {
        return _mlContext.BinaryClassification.Evaluate(predictions, labelColumnName);
    }

    public PredictionEngineFacade CreatePredictionEngine(ITransformer model)
    {
        var predictionEngine = _mlContext.Model.CreatePredictionEngine<SentimentData, SentimentPrediction>(model);
        return new PredictionEngineFacade(predictionEngine);
    }
    public SentimentPrediction Predict(PredictionEngine<SentimentData, SentimentPrediction> predictionFunction, SentimentData sampleStatement)
    {
        return predictionFunction.Predict(sampleStatement);
    }

    public IDataView LoadFromEnumerable(IList sentiments)
    {
        IEnumerable<SentimentData> localSentiments = sentiments.Cast<SentimentData>();
        return _mlContext.Data.LoadFromEnumerable(localSentiments);
    }

    public IList CreateEnumerable(IDataView predictions, bool reuseRowObject = false)
    {
        return _mlContext.Data.CreateEnumerable<SentimentPrediction>(predictions, reuseRowObject).ToList();
    }
}
