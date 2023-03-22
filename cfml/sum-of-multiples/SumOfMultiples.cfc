/**
* Your implementation of the SumOfMultiples exercise
*/
component {
	
	/**
	* @returns 
	*/
	function sum( array factors, limit ) {
		uniques = arrayNew(1);
		for (f in factors) {
			if (f > 0) {
				mult = f;
				while (mult < limit) {
					if (not arrayContains(uniques, mult)) arrayAppend(uniques, mult);
					mult += f;
				}
			}
		}
		return arraySum(uniques);
	}
	
}
