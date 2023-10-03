using Microsoft.AspNetCore.Mvc.ApplicationModels;
using System;
using System.Linq;

namespace MyFirstapi;

public class CustomApplicationModelProvider : IApplicationModelProvider
{
    public int Order => -1000 + 99; 
    // it's based on the value defined in  ApiBehaviorApplicationModelProvider : IApplicationModelProvider   public int Order => -1000 + 100;
    // as we want to execute it before we use -1000 + 99.

    public void OnProvidersExecuted(ApplicationModelProviderContext context)
    {
        // This method will be called after all providers have been executed
    }

    public void OnProvidersExecuting(ApplicationModelProviderContext context)
    {
        foreach (var controller in context.Result.Controllers)
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

