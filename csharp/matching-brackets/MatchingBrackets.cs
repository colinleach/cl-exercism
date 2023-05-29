using System.Collections.Generic;

public static class MatchingBrackets
{
    public static bool IsPaired(string input)
    {
        Queue<char> chars = new Queue<char>(input);
        Stack<char> seen = new Stack<char>();
        HashSet<char> opening = new HashSet<char> {'(', '[', '{'};
        HashSet<char> closing = new HashSet<char> {')', ']', '}'};
        
        while (chars.Count > 0)
        {
            char next = chars.Dequeue();
            if (opening.Contains(next)) seen.Push(next);
            else if (closing.Contains(next))
            {
                if (seen.Count == 0) return false;
                char prev = seen.Pop();
                if ((prev == '(' && next != ')') || 
                    (prev == '[' && next != ']') || 
                    (prev == '{' && next != '}')) 
                    return false;
            }
        }

        return seen.Count == 0;
    }
}
