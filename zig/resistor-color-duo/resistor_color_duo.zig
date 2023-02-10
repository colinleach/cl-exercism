pub const ColorBand = enum(u4) { black, brown, red, orange, yellow, green, 
                                blue, violet, grey, white, };

fn bandCode(color: ColorBand) isize {
    return @enumToInt(color);
}

pub fn colorCode(colors: []const ColorBand) anyerror!isize {
    return 10 * bandCode(colors[0]) + bandCode(colors[1]);
}
