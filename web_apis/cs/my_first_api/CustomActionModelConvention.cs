using Microsoft.AspNetCore.Mvc.ApplicationModels;
using MyFirstapi;
using System.Linq;

/// <summary>
/// Custom application model convetion in ASP.Net Core MVC.
/// It's used to modify the application model during the startup of the Application.
/// For each controller it check if ti has the NonActionClassAttribute
/// If the controller has the NonActionClassAttribute, it then gets a list of all the action methods in that controller 
/// which are specified in the MethodsToExclude property of the NonActionClassAttribute.
/// It then removes these action methods from the controller’s Actions collection.
/// </summary>
public class CustomActionModelConvention : IApplicationModelConvention
{
    public void Apply(ApplicationModel application)
    {
        foreach (var controller in application.Controllers)
        {
            var nonActionAttr = controller.Attributes.OfType<NonActionClassAttribute>().FirstOrDefault();
            if (nonActionAttr != null)
            {
                var actionsToExclude = controller.Actions
                    .Where(a => nonActionAttr.MethodsToExclude.Contains(a.ActionName))
                    .ToList();

                foreach (var action in actionsToExclude)
                {
                    controller.Actions.Remove(action);
                }
            }
        }
    }
}