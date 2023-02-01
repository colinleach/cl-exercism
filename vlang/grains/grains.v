module main

import math { exp2 }

fn grains_on_square(square i64) !i64 {
	if 1 <= square && square <= 64 {
		return i64(exp2(square - 1))
	}
	return error("square must be between 1 and 64")
}

fn total_grains_on_board() u64 {
	return 0xffffffffffffffff
}