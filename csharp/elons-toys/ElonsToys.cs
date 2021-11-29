using System;

class RemoteControlCar
{
    private int _distanceDriven = 0;
    private int _chargeRemaining = 100;
    
    public static RemoteControlCar Buy() => new();

    public string DistanceDisplay()
        => $"Driven {_distanceDriven} meters";

    public string BatteryDisplay() =>
        _chargeRemaining > 0 ? $"Battery at {_chargeRemaining}%" : "Battery empty";

    public void Drive()
    {
        if (_chargeRemaining <= 0) return;
        _distanceDriven += 20; 
        _chargeRemaining -= 1;
    }
}
