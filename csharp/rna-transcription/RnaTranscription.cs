using System.Collections.Generic;
using System.Linq;

public static class RnaTranscription
{
   public static string ToRna(string strand)
   {
       var complement = new Dictionary<char, char>
       {
           { 'A', 'U' },
           { 'C', 'G' },
           { 'G', 'C' },
           { 'T', 'A' }
       };
       return new string(strand.Select(c => complement[c]).ToArray());
   }
}
