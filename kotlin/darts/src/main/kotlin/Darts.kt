object Darts {

    fun score(x: Number, y: Number): Int {
        val xd = x.toDouble();
        val yd = y.toDouble();
        val r_sq = xd * xd + yd * yd;
        if (r_sq <= 1) return 10
        if (r_sq <= 25) return 5
        if (r_sq <= 100) return 1
        return 0
    }
}
