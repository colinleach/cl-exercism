using System;
using System.ComponentModel.DataAnnotations;

public class SimpleCipher
{
    private char[] keys;
     public SimpleCipher()
     {
         Random rand = new Random();
         
         string key = "";
         for (int i = 0; i < 100; i++)
         {
             int randValue = rand.Next(0, 26);
             char letter = Convert.ToChar(randValue + (int)'a');
             key += letter;
         }
         Key = key;
         keys = Key.ToCharArray();
     }

     public SimpleCipher(string key)
     {
         Key = key;
         keys = Key.ToCharArray();
     }

    public string Key { get; private set; }

    string Change(string input, bool encode)
    {
        char[] letters = input.ToCharArray();
        string output = "";
        for (int i = 0; i < input.Length; i++)
        {
            if (encode)
                output += Convert.ToChar((int)letters[i] + (int)keys[i] - (int)'a');
            else
                output += Convert.ToChar((int)letters[i] - ((int)keys[i] - (int)'a')); 
        }

        return output;
    }
    
    public string Encode(string plaintext)
    {
        return Change(plaintext, true);
    }

    public string Decode(string ciphertext)
    {
        return Change(ciphertext, false);
    }
}