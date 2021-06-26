function to_append(count, prev_char)
    num = count > 1 ? string(count) : ""
    prev_char == '$' ? "" : num * prev_char
end

function encode(s)
    if s == ""
        return ""
    else
        prev_char = '$' # a bit ugly, prefer nothing
        count = 1
        out = ""
        for c in s
            if c == prev_char
                count += 1
            else
                out = out * to_append(count, prev_char)
                prev_char = c
                count = 1
            end
        end
    end
    out * to_append(count, prev_char)
end

function isnum(c)
    c in "12345690"
end

function decode(s)
    number = ""
    out = ""
    for c in s
        if isnum(c)
            number *= c
        else
            repeats = length(number) > 0 ? parse(Int, number) : 1
            for i in 1:repeats
                out *= c
            end
            number = ""
        end
    end
    out
end