/**
* Your implementation of the Acronym exercise
*/
component {
	
	/**
	* @returns 
	*/
	function abbreviate( phrase ) {
		phrase = uCase(replace(phrase, "-", " ", "all"));
		words = listToArray(phrase, " ", "false");
		output = "";
		for (w in words) { output &= left(w, 1); }
		return output;
	}
	
}