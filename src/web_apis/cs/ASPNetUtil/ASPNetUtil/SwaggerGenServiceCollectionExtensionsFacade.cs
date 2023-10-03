using System;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.ApiDescriptions;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace ASPNetUtil;

public class SwaggerGenServiceCollectionExtensionsFacade
{
    public static IServiceCollection AddSwaggerGen(IServiceCollection services)
    {
        return services.AddSwaggerGen();
    }
}
