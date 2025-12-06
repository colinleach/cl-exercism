const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]

function frown!(E_)
    E_[7, :] =E[9, :]
    E_[9, :] = E[7, :]
    E_
end

frown(E) = frown!(copy(E))

function stickerwall(E)
    hspacer = zeros(Int, size(E, 1), 1)
    upper = hcat(E, hspacer, ones(Int, size(E, 1), 1), hspacer, frown(E))
    lower = hcat(frown(E), hspacer, ones(Int, size(E, 1), 1), hspacer, E)
    vspacer = hcat(zeros(Int, 1, size(E, 2) + 1), [1], zeros(Int, 1, size(E, 2) + 1))
    vcat(upper, vspacer, ones(Int, 1, size(upper, 2)), vspacer, lower)
end

colpixelcount(E) = E .* sum(E, dims = 1)

function render(E)
    chars = (x -> x > 0 ? 'X' : ' ').(E)
    join([join(r, "") for r in eachrow(chars)], "\n")
end
