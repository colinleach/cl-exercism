component {
	
	/**
	* @returns true or false
	*/
	function isIsogram( input ) {
		letters = input.uCase()
						.listToArray('')
						.filter(function(c) { return c >= 'A' && c <= 'Z'})
						.toList()
		uniques = letters.listRemoveDuplicates()
		return len(uniques) == len(letters)
	}
	
}
