const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    const person = name orelse "you";
    const result = try std.fmt.bufPrint(buffer, "One for {s}, one for me.", .{person});
    return result;
}
