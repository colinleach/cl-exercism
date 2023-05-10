# + arabic - integer number
# + roman - corresponding string
type num_map record {
    int arabic;
    string roman;
};

# Convert an integer to a Roman number.
#
# + number - the integer to convert
# + return - the Roman number as a string
function roman(int number) returns string {
    num_map[] pairs = [];
    pairs.push({arabic: 1000, roman: "M"} );
    pairs.push({arabic: 900, roman: "CM"} );
    pairs.push({arabic: 500, roman: "D"} );
    pairs.push({arabic: 400, roman: "CD"} );
    pairs.push({arabic: 100, roman: "C"} );
    pairs.push({arabic: 90, roman: "XC"} );
    pairs.push({arabic: 50, roman: "L"} );
    pairs.push({arabic: 40, roman: "XL"} );
    pairs.push({arabic: 10, roman: "X"} );
    pairs.push({arabic: 9, roman: "IX"} );
    pairs.push({arabic: 5, roman: "V"} );
    pairs.push({arabic: 4, roman: "IV"} );
    pairs.push({arabic: 1, roman: "I"} );

    string result = "";
    int remaining = number;
    foreach num_map pair in pairs {
        while remaining >= pair.arabic {
            result += pair.roman;
            remaining -= pair.arabic;
        }
    }
    return result;
}
