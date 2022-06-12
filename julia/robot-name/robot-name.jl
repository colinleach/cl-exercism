const used = Set{String}()

mutable struct Robot
    rname::String
    Robot() = new(generate_name())
 end

function generate_name()::String
    newname = ""
    while true
        newname = join(rand('A':'Z', 2)) * join(rand(0:9, 3))
        if (!in(newname, used))
            push!(used, newname)
            break
        end
    end
    newname
end

function reset!(instance::Robot)
    instance.rname = generate_name()
    instance
end

function name(instance::Robot)
    instance.rname
end
