class Lasagna
{
    public int ExpectedMinutesInOven() => 40;
 
    public int RemainingMinutesInOven(int previousMinutesInOven)
    {
        return ExpectedMinutesInOven() - previousMinutesInOven;
    }

    public int PreparationTimeInMinutes(int layers) => layers * 2;
    
    public int ElapsedTimeInMinutes(int layers, int previousMinutesInOven)
    {
        return PreparationTimeInMinutes(layers) + previousMinutesInOven;
    }
}
