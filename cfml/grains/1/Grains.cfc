/**
* Your implementation of the Grains exercise
*/
component {
	
	function square( input ) {
		if (input < 1 || input > 64) {
			return -1
		}

		var base = createObject("java","java.math.BigInteger").init( 2 );
		var power = createObject("java","java.math.BigInteger").init( input-1 );
		return base.pow( power ).toString();
	}
	
	function total( input ) {
		total = 0;
		loop from=1 to=64 index='local.i' {
			total += square( i );
		}
		
		return total;
	}
	
}