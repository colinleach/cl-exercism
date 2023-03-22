/**
* Your implementation of the Gigasecond exercise
*/
component {
	
	/**
	* @returns 
	*/
	function add( birthdate ) {
		return dateAdd('s', 1000000000, birthdate);
	}
}