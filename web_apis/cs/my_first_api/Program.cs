
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.IO;
using System.Runtime.InteropServices;
using Microsoft.AspNetCore.Mvc.NewtonsoftJson;

namespace MyFirstapi;

public class Program
{
    public static void Main(string[] args)
    {


        //Directory.SetCurrentDirectory(@"the directory of WebApi Project");
        //var options = new WebApplicationOptions();
        WebApplicationOptions webAppOptions = new WebApplicationOptions();// { EnvironmentName = "Development", ApplicationName = "WebApi" };
     
        var builder = WebApplication.CreateBuilder(webAppOptions);
        // Add services to the container.

        System.Environment.SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", "Development", EnvironmentVariableTarget.Process);

        builder.Configuration.AddJsonFile("appsettings.json",
                optional: true,
        reloadOnChange: true);

        builder.Services.AddSingleton<IApplicationModelProvider, CustomApplicationModelProvider>();
        //builder.Services.AddHttpsRedirection(opt => opt.HttpsPort = 443);
        /*  builder.Services.AddMvc(options =>
          {
              options.Conventions.Insert(0, new CustomActionModelConvention());
          });*/
        builder.Services.AddControllers().AddNewtonsoftJson();


        /*        builder.Services.AddControllers(options =>
                {
                    options.Conventions.Add(new NonActionClassFilter());
                }); 
        */        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle

        /*  builder.Services.AddMvc(options =>
          {
              options.Conventions.Add(new CustomApplicationModelConvention());
          });*/
        /*builder.Services.AddControllers(actions =>
        {
            actions.Conventions.Add(new CustomApplicationModelConvention());
        });
*/


        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwaggerUI();
            app.UseSwagger();
        }

        app.UseHttpsRedirection();

        app.UseAuthorization();


        app.MapControllers();

        app.Run();
    }

}