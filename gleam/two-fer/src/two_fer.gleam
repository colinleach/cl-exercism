import gleam/option.{Option, unwrap}

pub fn two_fer(name: Option(String)) -> String {
  // let person = unwrap(name, "you")
  "One for " <> unwrap(name, "you") <> ", one for me."
}
