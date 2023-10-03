namespace ASPNetUtil;

/// <summary>
///  You can use this attribute to annotate a class and specify the methods you want to include as follows:
//   [IncludeActionClass("Method1", "Method2")]
/// public class YourClass
///  {
///    // Your methods go here
///  }
/// </summary>
[AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = true)]
public sealed class IncludeActionClassAttribute : Attribute
{
    public string[] MethodsToInclude { get; }

    public IncludeActionClassAttribute(params string[] methodsToInclude)
    {
        MethodsToInclude = methodsToInclude;
    }
}