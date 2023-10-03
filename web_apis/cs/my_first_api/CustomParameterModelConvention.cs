using Microsoft.AspNetCore.Mvc.ApplicationModels;

public class CustomParameterModelConvention : IParameterModelConvention
{
    public void Apply(ParameterModel parameter)
    {
        // Customize the ParameterModel here
    }
}
