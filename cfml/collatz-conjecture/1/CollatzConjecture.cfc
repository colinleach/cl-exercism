component {
	
	/**
	* @returns 
	*/
	function steps( number ) {
		if (number < 1) { throw('Only positive integers are allowed') }

		count = 0
		while (number != 1) {
			number = number % 2 EQ 0 ? number / 2 : 3 * number + 1
			count += 1
		}
		return count
	}
	
}
