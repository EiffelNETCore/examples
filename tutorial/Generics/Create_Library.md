# How to create a C# library using Visual Studio

- Start Microsoft Visual Studio: Launch the Visual Studio application on your computer.
- Create a New Project: On the Menu click `Create New Project`.
- Select Project Type: In the left list, click Windows under Visual C#. In the right list, click `ClassLibrary`.
- Name Your Project: You can then proceed to give your project a name. For example, you could call the project `ListOfString`.
- Select the Target Framework: For example `.NET 7.0 (Standard Term Support)`
- Create the Project: Press the `Create` button. After you have given a name to your project2.
- `Add Code`: Now, you can start adding your classes and methods to this library.

# How to create a C# library using the dotnet tool

- Open a terminal
- Create a new folder: Create a new directory for your project and navigate into it. 
```
mkdir ListOfString
cd ListOfString
```
- Create a new library: Use the dotnet new command to create a new class library project
  `dotnet new classlib -n ListOfString`
Now we have a new class library named ListOfString 

Use `dotnet new list`   Lists templates containing the specified template name

- Add Your Code: Now, you can start adding your classes and methods to this library

- Build the Library: Once you’ve added your code, you can build the library using the dotnet build command

  `dotnet build`

## To learn more about dotnet use
  `dotnet help`

## For more information on a command.
Run 'dotnet [command] --help' 
  
