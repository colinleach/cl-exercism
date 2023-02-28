class Triangle<out T : Number>(val a: T, val b: T, val c: T) {

    init {
        val a_ = a.toDouble(); val _b = b.toDouble(); val _c = c.toDouble()
        if (listOf(a_, _b, _c).any { it == 0 } || a + b < c  )
    }

    def isTriangle() {
        listOf(a, b, c).all {it > 0}
    }

    val isEquilateral: Boolean = TODO("Implement this getter to complete the task")
    val isIsosceles: Boolean = TODO("Implement this getter to complete the task")
    val isScalene: Boolean = TODO("Implement this getter to complete the task")
}
