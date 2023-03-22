/**
* Your implementation of the Hamming exercise
*/
component {
	
	/**
	* @returns 
	*/
	 function distance( strand1, strand2 ) {
		if (strand1.length() NEQ strand2.length()) {
			throw('left and right strands must be of equal length');
		}
		if (strand1.length() EQ 0) return 0;

		seq1 = strand1.split("");
		seq2 = strand2.split("");
		count = 0;
		for (i=1; i <= strand1.length(); i++) {
			if (seq1[i] NEQ seq2[i]) count++;
		}
		return count;
	}
	
}