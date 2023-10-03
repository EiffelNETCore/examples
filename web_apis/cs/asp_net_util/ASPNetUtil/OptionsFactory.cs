using Microsoft.AspNetCore.Builder;

namespace ASPNetUtil;


public class WebApplicationOptionsFactory 
{
    public static WebApplicationOptions CreateWebApplicationOptions(string environmentName, string applicationName)
    {
        return new WebApplicationOptions
        {
            EnvironmentName = environmentName,
            ApplicationName = applicationName,
        };
    }

}
