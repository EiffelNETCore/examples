using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerUI;
using System.Text.Encodings.Web;

namespace ASPNetUtil;

public static class UseSwaggerUIFacade
{
  
    public static IApplicationBuilder UseSwaggerUI2(this IApplicationBuilder app, SwaggerUIOptions options)
    {
        return UseMiddlewareExtensions.UseMiddleware(app, typeof(SwaggerUIMiddleware), options);
    }

   public static IApplicationBuilder UseSwaggerUI(this IApplicationBuilder app)
   {
        Action<SwaggerUIOptions>? setupAction = null;
 
        IServiceScope val = ServiceProviderServiceExtensions.CreateScope(app.ApplicationServices);
        SwaggerUIOptions value;
        try
        {
            value = ServiceProviderServiceExtensions.GetRequiredService<IOptionsSnapshot<SwaggerUIOptions>>(val.ServiceProvider).Value;
            setupAction?.Invoke(value);
        }
        finally
        {
            ((IDisposable)val)?.Dispose();
        }
        if (value.ConfigObject.Urls == null)
        {
            IWebHostEnvironment requiredService = ServiceProviderServiceExtensions.GetRequiredService<IWebHostEnvironment>(app.ApplicationServices);
            value.ConfigObject.Urls = new UrlDescriptor[1]
            {
                    new UrlDescriptor
                    {
                        Name = ((IHostEnvironment)requiredService).ApplicationName + " v1",
                        Url = "v1/swagger.json"
                    }
            };
        }
        return app.UseSwaggerUI(value);
    }
}

