using System;
using System.Linq;

public class DndCharacter
{
    public int Strength { get; }
    public int Dexterity { get; }
    public int Constitution { get; }
    public int Intelligence { get; }
    public int Wisdom { get; }
    public int Charisma { get; }
    public int Hitpoints { get; }
    
    private static readonly Random Random = new Random();

    public DndCharacter(int strength, int dexterity, int constitution, int intelligence, int wisdom, int charisma)
    {
        Strength = strength;
        Dexterity = dexterity;
        Constitution = constitution;
        Intelligence = intelligence;
        Wisdom = wisdom;
        Charisma = charisma;
        Hitpoints = Modifier(Constitution) + 10;
    }
    public static int Modifier(int score) => (int)(Math.Floor((score - 10) / 2.0));

    public static int Ability()
    {
        int[] dice = new int[4];
        for (int i = 0; i < 4; i++)
        {
            dice[i] = Random.Next(1, 7);
        }
        return dice.Sum() - dice.Min();
    }

    public static DndCharacter Generate() =>
        new(Ability(), Ability(), Ability(),
            Ability(), Ability(), Ability());
}