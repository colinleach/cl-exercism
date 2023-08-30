{
    input = $1
    if (index(input, "T") == 0)
        input = input " 0 0 0";
    gsub(/[T-]/, " ", input)
    gsub(/:/, " ", input)
    print strftime("%Y-%m-%dT%H:%M:%S", mktime(input, 1) + 10^9, 1)
}
