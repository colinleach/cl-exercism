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
    public int Moves { get; init; }
    public Bucket GoalBucket { get; init; }
    public int OtherBucket { get; init; }
}

public class TwoBucket(int bucketOne, int bucketTwo, Bucket startBucket)
{
     private int Bucket1 { get; } = bucketOne;
    private int Bucket2 { get; } = bucketTwo;
    private Bucket StartBucket { get; } = startBucket;


    public TwoBucketResult Measure(int goal)
    {
        if (goal % Gcd((uint) Bucket1, (uint) Bucket2) != 0 || goal > Math.Max(Bucket1, Bucket2))
            throw new ArgumentException("Solution is impossible");

        HashSet<(int vol1, int vol2)> status =
        [
            StartBucket == Bucket.One ? (Bucket1, 0) : (0, Bucket2) 
        ];
        (int vol1, int vol2) found = (0, 0);
        bool isFound = false;
        foreach (var s in status)
        {
            if (s.vol1 == goal || s.vol2 == goal)
            {
                found = s;
                isFound = true;
                break;
            }
        }
    
        int steps = 1;
        HashSet<(int vol1, int vol2)> seen = [(0, 0), (Bucket1, 0), (0, Bucket2)];
        
        while (!isFound)
        {
            HashSet<(int vol1, int vol2)> prevStatus = status;
            status = [];
            steps++;

            foreach ((int vol1, int vol2) s in prevStatus)
            {
                // empty/fill one bucket:
                HashSet<(int vol1, int vol2)> nextSteps = [
                    (s.vol1, 0 ),
                    (0, s.vol2 ),
                    (s.vol1, Bucket2),
                    (Bucket1, s.vol2)
                ];
                
                // transfers:
                int transfer1To2 = Math.Min(s.vol1, Bucket2 - s.vol2);
                nextSteps.Add( (s.vol1 - transfer1To2, s.vol2 + transfer1To2) );
                
                int transfer2To1 = Math.Min(s.vol2, Bucket1 - s.vol1);
                nextSteps.Add( (s.vol1 + transfer2To1, s.vol2 - transfer2To1) );
                
                foreach (var n in nextSteps.Except(seen))
                {
                    seen.Add(n);
                    status.Add(n);
                }
            }
            
            foreach (var s in status.Where(s => s.vol1 == goal || s.vol2 == goal))
            {
                found = s;
                isFound = true;
                break;
            }
        }
        return found.vol1 == goal 
            ? new TwoBucketResult { Moves = steps, GoalBucket = Bucket.One, OtherBucket = found.vol2 } 
            : new TwoBucketResult { Moves = steps, GoalBucket = Bucket.Two, OtherBucket = found.vol1 };
    }
    
    private static int Gcd(uint a, uint b)
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
