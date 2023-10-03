using Microsoft.AspNetCore.Mvc.ApplicationModels;

public class CustomControllerModelConvention : IControllerModelConvention
{
    public void Apply(ControllerModel controller)
    {
        // Customize the ControllerModel here
    }
}
