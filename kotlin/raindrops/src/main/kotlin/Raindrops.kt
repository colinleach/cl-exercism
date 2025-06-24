object Raindrops {

    fun convert(n: Int): String {
        val pling = if (n % 3 == 0) "Pling" else ""
        val plang = if (n % 5 == 0) "Plang" else ""
        val plong = if (n % 7 == 0) "Plong" else ""
        val all = "$pling$plang$plong"
        return all.ifEmpty { "$n" }
    }
}
