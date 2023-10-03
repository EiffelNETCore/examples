using ASPNetUtil;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using System;
using System.Linq;

namespace MyFirstapi;

public class CustomApplicationModelProviderInclude : IApplicationModelProvider
{
    public int Order => -1000 + 99;
    // it's based on the value defined in  ApiBehaviorApplicationModelProvider : IApplicationModelProvider   public int Order => -1000 + 100;
    // as we want to execute it before we use -1000 + 99.

    public void OnProvidersExecuted(ApplicationModelProviderContext context)
    {
        // This method will be called after all providers have been executed
    }

    /// <summary>
    /// Iterates over the controllers in the ApplicationModel object.
    /// For each controller, it checks to see if it has the IncludeActionClassAttribute attribute.
    /// If it does, the method creates a list of actions to keep in the controller.
    /// This list is created by filtering the controller's actions to only include the actions
    /// that are listed in the IncludeActionClassAttribute.MethodsToInclude property.
    /// Then, it removes any actions from the controller that are not in this list.
    /// </summary>
    /// <param name="context"></param>
    public void OnProvidersExecuting(ApplicationModelProviderContext context)
    {
        // Iterate over the controllers in the application model.
        foreach (var controller in context.Result.Controllers)
        {
            // Check to see if the controller has the IncludeActionClassAttribute attribute.
            var actionAttr = controller.Attributes.OfType<IncludeActionClassAttribute>().FirstOrDefault();
            if (actionAttr != null)
            {
                // Create a list of actions to keep in the controller.
                var actionsToKeep = controller.Actions
                    .Where(a => actionAttr.MethodsToInclude.Contains(a.ActionName))
                    .ToList();

                // Remove the actions not in the list from the controller.
                for (int i = controller.Actions.Count - 1; i >= 0; i--)
                {
                    if (!actionsToKeep.Contains(controller.Actions[i]))
                    {
                        controller.Actions.RemoveAt(i);
                    }
                }
            }
        }
    }
}


