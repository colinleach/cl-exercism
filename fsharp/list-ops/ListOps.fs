module ListOps

let rec foldl folder state list =
    match list with
    | [] -> state
    | h :: t -> foldl folder (folder state h) t

let rec foldr folder state list = 
    match list with
    | [] -> state
    | h :: t -> folder (foldr folder state t) h

let length list =
    foldl (fun acc el -> 1 + acc) 0 list

let reverse list =
    foldl (fun acc el -> el :: acc) [] list

let rec map f list =
     match list with
     | [] -> []
     | h :: t -> f h :: map f t

let rec filter f list =
     match list with
     | [] -> []
     | h :: t -> if f h then  h :: filter f t else filter f t
 
let append xs ys =
    let rec revappend _xs _ys =
        match _xs with
        | [] -> _ys
        | h :: t -> revappend t (h :: _ys)
    let revxs = reverse xs
    revappend revxs ys

let rec concat xs =
    match xs with
    | [] -> []
    | h :: t -> append h (concat t)