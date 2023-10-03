using Microsoft.ML;
namespace SentimentAnalysis;

public class PredictionEngineFacade
{
    private readonly PredictionEngine<SentimentData, SentimentPrediction> _predictionEngine;

    public PredictionEngineFacade(PredictionEngine<SentimentData, SentimentPrediction> predictionEngine)
    {
        _predictionEngine = predictionEngine;
    }

    public SentimentPrediction Predict(SentimentData sampleStatement)
    {
        return _predictionEngine.Predict(sampleStatement);
    }
}
