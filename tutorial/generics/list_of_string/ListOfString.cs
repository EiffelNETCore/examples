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