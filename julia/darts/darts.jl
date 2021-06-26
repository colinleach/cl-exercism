function radius(x, y)
    sqrt(x*x + y*y)
end

function score(x, y)
    r = radius(x, y)
    if     r > 10; 0 // missed
    elseif r > 5;  1 // outer
    elseif r > 1;  5 // middle
    else          10 // inner
    end
end