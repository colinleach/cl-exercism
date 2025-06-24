class Triangle<out T : Number>(val a: T, val b: T, val c: T) {

    init {
        val a_ = a.toDouble(); val b_ = b.toDouble(); val c_ = c.toDouble()
        if (listOf(a_, b_, c_).any { it == 0.0 } )
            throw IllegalArgumentException("All sides must be non-zero")
        if ( (a_ + b_ <= c_) || (c_ + b_ <= a_) || (a_ + c_ <= b_) )
            throw IllegalArgumentException("Violates triangle inequality")
    }

    val isEquilateral: Boolean = (a == b && b == c)
    val isIsosceles: Boolean = (a == b || b == c || c == a)
    val isScalene: Boolean = (a != b && b != c && c != a)
}
