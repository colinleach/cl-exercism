using Dates

function add_gigasecond(date::DateTime)
    date + Second(1_000_000_000)
end
