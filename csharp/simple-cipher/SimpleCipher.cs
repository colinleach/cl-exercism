using System;
using System.ComponentModel.DataAnnotations;

public class SimpleCipher
{
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
     }

     public SimpleCipher(string key)
     {
         Key = key;
     }

    public string Key { get; private set; }

    string Change(string input, bool encode)
    {
        // recycle Key to make it long enough
        while (Key.Length < input.Length) Key += Key;
        char[] keys = Key.ToCharArray();
        
        char[] letters = input.ToCharArray();
        string output = "";
        for (int i = 0; i < input.Length; i++)
        {
            int ascii;
            if (encode)
            {
                ascii = (int)letters[i] + (int)keys[i] - (int)'a';
                if (ascii > (int)'z') ascii -= 26;
            }
            else // decode
            {
                ascii = (int)letters[i] - ((int)keys[i] - (int)'a');
                if (ascii < (int)'a') ascii += 26;
            } 
            output += Convert.ToChar(ascii);
        }
        return output;
    }
    
    public string Encode(string plaintext) => Change(plaintext, true);

    public string Decode(string ciphertext) => Change(ciphertext, false);
}