using System;

class RemoteControlCar
{
    private int _speed;
    private int _batteryDrain;
    private int _distanceDriven = 0;
    private int _chargeRemaining = 100;
 
    public RemoteControlCar(int speed, int batteryDrain)
    {
        _speed = speed;
        _batteryDrain = batteryDrain;
    }

    public bool BatteryDrained() => _chargeRemaining < _batteryDrain;

    public int DistanceDriven() => _distanceDriven;

    public void Drive()
    {
        if (_chargeRemaining < _batteryDrain) return;
        _distanceDriven += _speed;
        _chargeRemaining -= _batteryDrain;
    }

    public static RemoteControlCar Nitro() => new(50, 4);
}

class RaceTrack
{
    private int _distance;

    public RaceTrack(int distance)
    {
        _distance = distance;
    }

    public bool CarCanFinish(RemoteControlCar car)
    {
        while (!car.BatteryDrained())
        {
            car.Drive();
        }
        return car.DistanceDriven() >= _distance;
    }
}
