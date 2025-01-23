using System;
using System.Text.RegularExpressions;

public class PhoneNumber
{
    public static string Clean(string phoneNumber)
    {
        if (Regex.IsMatch(phoneNumber, @"[a-zA-Z]")) 
            throw new ArgumentException("letters not permitted");
        
        phoneNumber = Regex.Replace(phoneNumber, @"[ +\-().]", "");
        if (Regex.IsMatch(phoneNumber, @"[^0-9]")) 
            throw new ArgumentException("punctuation not permitted");
        
        switch (phoneNumber.Length)
        {
            case < 10:
                throw new ArgumentException("must not be fewer than 10 digits");
            case > 11:
                throw new ArgumentException("must not be greater than 11 digits");
            case 11 when phoneNumber[0] != '1':
                throw new ArgumentException("11 digits must start with 1");
        }

        var noCountry = phoneNumber.Length == 11 ? phoneNumber[1..] : phoneNumber;
        var areaCode = noCountry[..3];
        var exchangeCode = noCountry[3..6];
        
        if (areaCode[0] == '0' || areaCode[0] == '1') 
            throw new ArgumentException("area code cannot start with zero or one");
        if (exchangeCode[0] == '0' || exchangeCode[0] == '1') 
            throw new ArgumentException("exchange code cannot start with zero or one");
        
        return noCountry;
    }
}
