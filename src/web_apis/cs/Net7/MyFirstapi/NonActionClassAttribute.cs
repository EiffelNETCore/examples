using System;

namespace MyFirstapi;

/*
 *  You can use this attribute to annotate a class and specify the methods you want to exclude as follows:
 * [NonActionClass("Method1", "Method2")]
public class YourClass
{
    // Your methods go here
}*/
[AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
public sealed class NonActionClassAttribute : Attribute
{
    public string[] MethodsToExclude { get; }

    public NonActionClassAttribute(params string[] methodsToExclude)
    {
        MethodsToExclude = methodsToExclude;
    }
}