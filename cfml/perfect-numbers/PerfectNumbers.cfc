component {
	
	function classify( n ) {
		if (n < 1) { throw('Classification is only possible for positive integers.') }


	}
	
}


// isperfect(n) = n > 0 ? n == aliquotsum(n) : throw(DomainError(n))

// isabundant(n) = n > 0 ? n < aliquotsum(n) : throw(DomainError(n))

// isdeficient(n) = n > 0 ? n > aliquotsum(n) : throw(DomainError(n))

// aliquotsum(n) = sum(f for f in 1:(n ÷ 2 ) if n % f == 0)

//     if number < 1:
//         raise ValueError("Classification is only possible for positive integers.")
//     aliquot = sum(f for f in range(1, number // 2 + 1) if number % f == 0)
//     if aliquot == number:
//         return "perfect"
//     if  aliquot < number:
//         return "deficient"
//     if  aliquot > number:
//         return "abundant"