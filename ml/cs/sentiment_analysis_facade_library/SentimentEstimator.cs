using Microsoft.ML;
namespace SentimentAnalysis;
public class SentimentEstimator
{
    private readonly IEstimator<ITransformer> _estimator;

    public SentimentEstimator(IEstimator<ITransformer> estimator)
    {
        _estimator = estimator;
    }

    public ITransformer Fit(IDataView trainSet)
    {
        return _estimator.Fit(trainSet);
    }
}
