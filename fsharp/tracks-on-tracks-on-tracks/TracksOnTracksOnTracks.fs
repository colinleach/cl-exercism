module TracksOnTracksOnTracks

let newList: string list = []

let existingList: string list = ["F#"; "Clojure"; "Haskell"]

let addLanguage (language: string) (languages: string list): string list =
    language :: languages

let countLanguages (languages: string list): int = List.length languages

let reverseList(languages: string list): string list = List.rev languages 

let excitingList (languages: string list): bool =
    match languages with
    | "F#" :: _ -> true
    | _ :: tail ->
        match tail with
        | "F#" :: _ -> languages.Length = 2 || languages.Length = 3
        | _ -> false
    |  _ -> false
    