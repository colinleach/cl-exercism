pub const ColorBand = enum(u4) {  black, 
                        brown, 
                        red, 
                        orange, 
                        yellow,
                        green, 
                        blue, 
                        violet, 
                        grey, 
                        white, 
                    };

pub fn colorCode(color: ColorBand) isize {
    return @enumToInt(color);
}

pub fn colors() []const ColorBand {
    return &[_]ColorBand {
        .black, .brown, .red, .orange, .yellow,
        .green, .blue, .violet, .grey, .white,
    };
}