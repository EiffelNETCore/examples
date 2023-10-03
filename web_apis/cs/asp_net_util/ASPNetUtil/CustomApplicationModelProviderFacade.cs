using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.Extensions.DependencyInjection;
using MyFirstapi;

namespace ASPNetUtil;
public static class CustomApplicationModelProviderFacade
{
    /// <summary>
    /// Registers the CustomApplicationModelProviderInclude class with the dependency injection container.
    /// This class iterates over the controllers in the ApplicationModel object and checks for the IncludeActionClassAttribute attribute.
    /// If a controller has this attribute, the method creates a list of actions to keep in the controller.
    /// This list includes the actions that are listed in the IncludeActionClassAttribute.MethodsToInclude property.
    /// Then, it removes any actions from the controller that are not in this list.
    /// </summary>
    public static void RegisterIncludedActionsProvider(IServiceCollection services)
    {
        services.AddSingleton<IApplicationModelProvider, CustomApplicationModelProviderInclude>();
    }

    /// <summary>
    /// Registers the CustomApplicationModelProviderExclude class with the dependency injection container.
    /// This class iterates over the controllers in the ApplicationModel object and checks for the NonActionClassAttribute attribute.
    /// If a controller has this attribute, the method creates a list of actions to exclude from the controller.
    /// This list includes the actions that are listed in the NonActionClassAttribute.MethodsToExclude property.
    /// Then, it removes these actions from the controller.
    /// </summary>
    public static void RegisterExcludedActionsProvider(IServiceCollection services)
    {
        services.AddSingleton<IApplicationModelProvider, CustomApplicationModelProviderExclude>();
    }
}