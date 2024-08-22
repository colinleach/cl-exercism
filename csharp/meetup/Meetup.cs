using System;
using System.Linq;

public enum Schedule
{
    Teenth,
    First,
    Second,
    Third,
    Fourth,
    Last
}

internal record CurrMonth
{
    public CurrMonth(int year, int month, int day)
    {
        dt = new DateTime(year, month, day);
        dayOfMonth = day;
        dayOfWeek = dt.DayOfWeek;
    }
    
    public DateTime dt { get; }
    public int dayOfMonth { get; }
    public DayOfWeek dayOfWeek { get; }
}

public class Meetup
{
    CurrMonth[] dates { get; }
    
    public Meetup(int month, int year)
    {
        var daysThisMonth = DateTime.DaysInMonth(year, month);
        var days = Enumerable.Range(1, daysThisMonth);
        dates = days.Select(d => new CurrMonth(year, month, d)).ToArray();
    }

    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule)
    {
        var validDates = dates.Where(d => d.dayOfWeek == dayOfWeek);
        return schedule switch
        {
            Schedule.Teenth => validDates.First(d => d.dayOfMonth is >= 13 and <= 19).dt,
            Schedule.First => validDates.First().dt,
            Schedule.Second => validDates.Skip(1).First().dt,
            Schedule.Third => validDates.Skip(2).First().dt,
            Schedule.Fourth => validDates.Skip(3).First().dt,
            Schedule.Last => validDates.Last().dt,
            _ => throw new ArgumentException("Invalid schedule")
        };
    }
}