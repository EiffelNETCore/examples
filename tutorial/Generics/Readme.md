

# Consuming C# Generics in Eiffel: A Tutorial

## Introduction

Currently, Eiffel does not support consuming generics from C# classes. This tutorial demonstrates a workaround for this limitation by creating a Facade for a `List<string>` in C#. 

## Creating a Facade for a List<string>

A Facade simplifies access to complex components. In this case, we will create a Facade to manage a list of strings. The Facade will encapsulate the list's functionality and expose a more straightforward interface. Here's how you can do it:

```csharp
using System.Collections;
namespace ListOfString;

/// <summary>
/// Facade for a List<string> that encapsulates the list's functionality and exposes a few methods
/// </summary>
public class ListOfString
{
    private List<string> _list;

    public ListOfString()
    {
        _list = new List<string>();
    }

    public void Add(string item)
    {
        _list.Add(item);
    }

    public bool Contains(string item)
    {
        return _list.Contains(item);
    }

    public void Remove(string item)
    {
        _list.Remove(item);
    }

    public IList GetList()
    {
        return _list.ToList();
    }
}
```

## Creating a C# Library

To consume the Facade in Eiffel, we need to create a C# library. I recommend following the tutorial on creating a class library with C# and .NET on Microsoft’s official site. You can access it [here](https://learn.microsoft.com/en-us/dotnet/core/tutorials/library-with-visual-studio?pivots=dotnet-7-0). This tutorial guides you through the process of creating a class library using C# and .NET.

## Consuming the C# Library from Eiffel

Finally, we need to consume the C# library from Eiffel. 

Open the Eiffel configuration file (.ecf) of your project and add the following entry

`<assembly name="ListOfString" location="$PATH_CS_LIB\ListOfString.dll"/>`


## Conclusion

By creating a Facade for a `List<string>` in C#, we can effectively consume C# generic features in Eiffel. This approach can be extended to other generic types as well.
