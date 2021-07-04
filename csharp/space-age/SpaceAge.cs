
using System;

public class SpaceAge
{
    private double age;

    public SpaceAge(int seconds)
    {
        age = seconds / 31557600.0;
    }

    public double OnEarth() => exercism submitage;

    public double OnMercury() => age / 0.2408467;

    public double OnVenus() => age / 0.61519726;

    public double OnMars() => age / 1.8808158;

    public double OnJupiter() => age / 11.862615;

    public double OnSaturn() => age / 29.447498;

    public double OnUranus() => age / 84.016846;

    public double OnNeptune() => age / 164.79132;
}