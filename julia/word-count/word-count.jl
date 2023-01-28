function cleansentence(sentence)
    commaless = replace(sentence, "," => " ")
    quoteless = replace(commaless, r"\'\s|\s\'" => " ")
    replace(quoteless, r"[^a-z0-9\s\']" => "")
end

function wordcount(sentence)
    counts = Dict()
    words = sentence |> lowercase |> cleansentence |> split
    for w in words
        if haskey(counts, w)
            counts[w] += 1
        else
            w = replace(w, r"^\'|\'$" => "")
            if w == "" || count(i->(i=='''), w) > 1
                continue
            end
            counts[w] = 1
        end
    end
    counts
end
