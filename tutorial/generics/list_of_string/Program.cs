namespace ListOfString;

internal class Program
{
    static void Main(string[] args)
    {
        // Create a ListOfString instance
        var listOfString = new ListOfString();

        // Add some strings to the list
        listOfString.Add("Item 1");
        listOfString.Add("Item 2");
        listOfString.Add("Item 3");

        // Check if an item exists in the list
        Console.WriteLine($"Contains 'Item 2': {listOfString.Contains("Item 2")}"); // Should print true
        Console.WriteLine($"Contains 'Item 4': {listOfString.Contains("Item 4")}"); // Should print false

        // Remove an item from the list
        listOfString.Remove("Item 1");

        // Get the list and print its contents
        var items = listOfString.GetList();
        Console.WriteLine("List Contents:");
        foreach (var item in items)
        {
            Console.WriteLine(item);
        }
    }
}