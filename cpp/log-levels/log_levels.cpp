#include <string>

namespace log_line {
    std::string message(const std::string& log_line) {
        int msg_start = log_line.find(": ") + 2;
        return log_line.substr(msg_start);
    }

    std::string log_level(const std::string& log_line) {
        int level_end = log_line.find("]") -1;
        return log_line.substr(1, level_end);
    }

    std::string reformat(const std::string log_line) {
        return message(log_line) + " (" + log_level(log_line) + ")";
    }
} // namespace log_line
