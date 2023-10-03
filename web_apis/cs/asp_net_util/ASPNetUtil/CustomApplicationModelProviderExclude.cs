using ASPNetUtil;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using System;
using System.Linq;

namespace MyFirstapi;

public class CustomApplicationModelProviderExclude : IApplicationModelProvider
{
    public int Order => -1000 + 99;
    // it's based on the value defined in  ApiBehaviorApplicationModelProvider : IApplicationModelProvider   public int Order => -1000 + 100;
    // as we want to execute it before we use -1000 + 99.

    public void OnProvidersExecuted(ApplicationModelProviderContext context)
    {
        // This method will be called after all providers have been executed
    }
    /// <summary>
    ///  Iterates over the controllers in the ApplicationModel object.
    ///  For each controller, it checks to see if it has the NonActionClassAttribute attribute. 
    ///  If it does, the method creates a list of actions to exclude from the controller. 
    ///  This list is created by filtering the controller's actions to only include the actions 
    ///  that are listed in the NonActionClassAttribute.MethodsToExclude property.
    /// </summary>
    /// <param name="context"></param>
    public void OnProvidersExecuting(ApplicationModelProviderContext context)
    {
        // Iterate over the controllers in the application model.
        foreach (var controller in context.Result.Controllers)
        {
            // Check to see if the controller has the NonActionClassAttribute attribute.
            var nonActionAttr = controller.Attributes.OfType<NonActionClassAttribute>().FirstOrDefault();
            if (nonActionAttr != null)
            { // Create a list of actions to exclude from the controller.
                var actionsToExclude = controller.Actions
                    .Where(a => nonActionAttr.MethodsToExclude.Contains(a.ActionName))
                    .ToList();

                // Remove the actions from the controller.
                foreach (var action in actionsToExclude)
                {
                    controller.Actions.Remove(action);
                }
            }
        }
    }
}

