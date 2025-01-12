using System;
using System.Collections.Generic;
using System.Linq;

public enum Bucket
{
    One,
    Two
}

public class TwoBucketResult
{
    public int Moves { get; set; }
    public Bucket GoalBucket { get; set; }
    public int OtherBucket { get; set; }
}

internal class State
{
    public int vol1 { get; set; }
    public int vol2 { get; set; }
}

public class TwoBucket(int bucketOne, int bucketTwo, Bucket startBucket)
{
     private int Bucket1 { get; } = bucketOne;
    private int Bucket2 { get; } = bucketTwo;
    private Bucket StartBucket { get; } = startBucket;


    public TwoBucketResult Measure(int goal)
    {
        if (goal % GCD((uint) Bucket1, (uint) Bucket2) != 0 || goal > Math.Max(Bucket1, Bucket2))
            throw new ArgumentException("Solution is impossible");

        HashSet<State> status =
        [
            StartBucket == Bucket.One
                ? new State { vol1 = Bucket1, vol2 = 0 }
                : new State { vol1 = 0, vol2 = Bucket2 }
        ];
        State found = status.FirstOrDefault(s => s.vol1 == goal || s.vol2 == goal);
    
        int steps = 1;
        HashSet<State> seen = 
        [
            StartBucket == Bucket.One
                ? new State { vol1 = Bucket1, vol2 = 0 }
                : new State { vol1 = 0, vol2 = Bucket2 }
         ];
        
        while (found == null)
        {
            HashSet<State> prevStatus = status;
            status = [];
            steps++;

            foreach (State s in prevStatus)
            {
                // empty/fill one bucket:
                HashSet<State> nextSteps = [
                    new() { vol1 = s.vol1, vol2 = 0 },
                    new() { vol1 = 0, vol2 = s.vol2 },
                    new() { vol1 = s.vol1, vol2 = Bucket2 },
                    new() { vol1 = Bucket1, vol2 = s.vol2 }
                ];
                
                // transfers:
                int transfer1To2 = Math.Min(s.vol1, Bucket2 - s.vol2);
                nextSteps.Add(new State { vol1 = s.vol1 - transfer1To2, vol2 = s.vol2 + transfer1To2 });
                
                int transfer2To1 = Math.Min(s.vol2, Bucket1 - s.vol1);
                nextSteps.Add(new State { vol1 = s.vol1 + transfer2To1, vol2 = s.vol2 - transfer2To1 });
                
                foreach (State n in nextSteps.Except(seen))
                {
                    seen.Add(n);
                    status.Add(n);
                }
            }
            
            foreach (var s in status.Where(s => s.vol1 == goal || s.vol2 == goal))
            {
                found = s;
                break;
            }
        }
        return found.vol1 == goal 
            ? new TwoBucketResult { Moves = steps, GoalBucket = Bucket.One, OtherBucket = found.vol2 } 
            : new TwoBucketResult { Moves = steps, GoalBucket = Bucket.Two, OtherBucket = found.vol1 };
    }
    
    private static int GCD(uint a, uint b)
    // Adapted from:
    // https://stackoverflow.com/questions/18541832/c-sharp-find-the-greatest-common-divisor
    {
        while (a != 0 && b != 0)
        {
            if (a > b)
                a %= b;
            else
                b %= a;
        }
        return (int)(a | b);
    }
}
