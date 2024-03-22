module CircularBuffer

open System

let mkCircularBuffer size = [], size

let clear buffer = [], snd buffer

let write value (buffer: int list * int) =
    if (fst buffer).Length >= snd buffer then
        failwith "Buffer full"
    fst buffer @ [value], snd buffer
        
let forceWrite value (buffer: int list * int) =
    if (fst buffer).Length < snd buffer then
        write value buffer
    else
        match fst buffer with
        | _ :: t -> write value (t, snd buffer)
        | _ -> write value ([], snd buffer)

let read (buffer: int list * int) =
    match buffer with
    | [], _ -> failwith "Buffer empty"
    | h :: t, size -> h, (t, size)
    