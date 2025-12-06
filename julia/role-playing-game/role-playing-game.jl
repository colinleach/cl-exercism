StringOrMissing = Union{String, Missing}
IntOrNothing = Union{Int64, Nothing}

@kwdef mutable struct Player
    name::StringOrMissing = missing
    level::Int64 = 0
    health::Int64 = 100
    mana::IntOrNothing = nothing
end

introduce(player::Player) = ismissing(player.name) ? "Mighty Magician" : player.name

increment(mana::IntOrNothing) = isnothing(mana) ? 50 : mana + 100

increment(name::StringOrMissing) = ismissing(name) ? "The Great" : "$name the Great"

function title!(player::Player)
    if player.level == 42
        player.name = increment(player.name)
    end
    player.name
end

function revive!(player::Player)
    if player.health == 0
        player.health += 100
        player.mana = increment(player.mana)
    end
    player
end
