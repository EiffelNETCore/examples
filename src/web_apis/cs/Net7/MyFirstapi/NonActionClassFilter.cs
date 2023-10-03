using Microsoft.AspNetCore.Mvc.ApplicationModels;
using MyFirstapi;
using System;
using System.Linq;

public class NonActionClassFilter : IActionModelConvention
{
    public void Apply(ActionModel action)
    {
        if (action.Controller.Attributes.Any(a => a is NonActionClassAttribute))
        {
            var attribute = (NonActionClassAttribute)action.Controller.Attributes.First(a => a is NonActionClassAttribute);
            if (!attribute.MethodsToExclude.Contains(action.ActionMethod.Name))
            {
                action.ApiExplorer.IsVisible = false;
            }
        }
    }
}