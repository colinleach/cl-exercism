object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int {
        val posFactors: List<Int> = factors.filter {it > 0 }
        fun multiples(i: Int) = posFactors.map {if (i % it == 0) i else 0}
        return (1 until limit).map {multiples(it)}.flatten().toSet().sum()
    }

}
