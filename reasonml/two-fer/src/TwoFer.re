let twoFer = (input) => {
    let addressee = switch input {
    | Some(name) => name
    | None => "you"
    };
    "One for " ++ addressee ++ ", one for me.";
};