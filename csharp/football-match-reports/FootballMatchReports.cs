using System;

public static class PlayAnalyzer
{
    public static string AnalyzeOnField(int shirtNum)
    {
        return shirtNum switch
        {
            1 => "goalie",
            2 => "left back",
            3 or 4 => "center back",
            5 => "right back",
            6 or 7 or 8 => "midfielder",         
            9 => "left wing",
            10 => "striker",
            11 => "right wing",
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    public static string AnalyzeOffField(object report)
    {
        return report switch
        {
            int num => $"There are {num} supporters at the match.",
            string text => text,
            Foul => "The referee deemed a foul.",
            Injury injury => $"Oh no! {injury.GetDescription()} Medics are on the field.",
            Incident => "An incident happened.",
            Manager manager => manager.Club switch
            {
                { } club => $"{manager.Name} ({manager.Club})",
                _ => manager.Name
            },
            _ => throw new ArgumentException()
        };
    }
}
