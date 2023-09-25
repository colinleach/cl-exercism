using System;

public class Clock
{
    private int _hours;
    private int _mins;
    
    public Clock(int hours, int minutes)
    {
        _hours = hours;
        _mins = minutes;
        CleanOverflow();
    }

    public Clock Add(int minutesToAdd) => new(_hours, _mins + minutesToAdd);

    public Clock Subtract(int minutesToSubtract) => Add(-minutesToSubtract);

    public override string ToString() => $"{_hours:d2}:{_mins:d2}";

    public override bool Equals(Object obj)
    {
        Clock other = (Clock)obj;
        return other != null && (this._hours == other._hours) && (this._mins == other._mins);
    }

    private void CleanOverflow()
    {
        int mins = _mins;
        while (mins < 0)
        {
            mins += 60;
            _hours--;
        }
        while (_hours < 0) _hours += 24;
        _mins = mins % 60;
        _hours = (_hours + (mins / 60)) % 24;
    }
}
