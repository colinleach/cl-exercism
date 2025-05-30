// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

/// various log levels
#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
}
/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    // let mut start: String = String::from("");
    match level {
        Info => ("[INFO]: {}", message).to_string(),
        Warning => ("[WARNING]: {}", message).to_string(),
        Error => String::from("[ERROR]: {}", message).to_string()
    }
}
pub fn info(message: &str) -> String {
    unimplemented!("return a message for info log level")
}
pub fn warn(message: &str) -> String {
    unimplemented!("return a message for warn log level")
}
pub fn error(message: &str) -> String {
    unimplemented!("return a message for error log level")
}
