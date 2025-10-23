function demote(n)
    n isa Float64 && return ceil(UInt8, n)
    n isa Integer && return Int8(n)
    throw(MethodError(demote, (n,)))
end

function preprocess(coll)
    coll isa Vector && return demote.(coll) |> reverse
    coll isa Set && return [demote(c) for c in coll] |> sort |> reverse
    throw(MethodError(preprocess, (coll, )))
end
