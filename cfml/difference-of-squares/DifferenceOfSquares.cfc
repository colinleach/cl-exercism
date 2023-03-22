/**
* Your implementation of the DifferenceOfSquares exercise
*/
component {
	
	 function squareOfSum( number ) {
		sum = number * (number + 1) / 2;
		return sum * sum;
	}
	
	 function sumOfSquares( number ) {
		return number * (number+1) * (2*number + 1) / 6;
	}
	
	 function differenceOfSquares( number ) {
		return  squareOfSum(number) - sumOfSquares(number);
	}
	
}