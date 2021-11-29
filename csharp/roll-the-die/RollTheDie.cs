using  System;

public class Player
{
    Random randObj = new Random();
    
    public int RollDie() => randObj.Next(18) + 1;

    public double GenerateSpellStrength() => randObj.NextDouble() * 100.0;
}