using System.Collections.Generic;
using System.Linq;

public class GradeSchool
{
    private SortedDictionary<int, SortedSet<string>> Grades { get; set; } = new();
    
    public bool Add(string student, int grade)
    {
        IEnumerable<string> names = Roster();
        if (names.Contains(student)) return false;
        if (!Grades.ContainsKey(grade)) Grades[grade] = [];

        Grades[grade].Add(student);
        return true;
    }

    public IEnumerable<string> Roster() => Grades.Values.SelectMany(name => name);

    public IEnumerable<string> Grade(int grade) => 
        Grades.TryGetValue(grade, out var namesInGrade) ? namesInGrade : new List<string>();
}
